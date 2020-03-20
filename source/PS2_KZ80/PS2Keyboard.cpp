/*
  PS2Keyboard.cpp - PS2Keyboard library
  Copyright (c) 2007 Free Software Foundation.  All right reserved.
  Written by Christian Weichel <info@32leaves.net>
  
  Adapted by Eduardo Gouget to work with a MSX Computer
  http://msx.gouget.com.br 2014
*/

#include "PS2Keyboard.h"

#include "avr/io.h"
#include "avr/interrupt.h"
#include "avr/pgmspace.h"
#include "binary.h"

//typedef uint8_t bool;
typedef uint8_t byte;

bool ps2Keyboard_Lites;
int ps2Keyboard_ClockPin;
int  ps2Keyboard_DataPin;
byte ps2Keyboard_CurrentBuffer;
volatile byte ps2Keyboard_CharBuffer;
volatile byte ps2Keyboard_BufferPos;


volatile boolean cmd_in_progress;
volatile int     cmd_count;
         byte    cmd_value;
volatile byte    cmd_ack_value;
         byte    cmd_parity;
volatile boolean cmd_ack_byte_ok;


// Minhas alterações de variáveis
//
static const PS2Keymap_t *keymap=NULL; //PS2 Keyboard Matrix
volatile uint8_t KB_Matrix[15]={255,255,255,255,255,255,255,255,255,255,255,255,255,255,255}; //MSX Keyboard Matrix, 11 Rows (Japanese MSX has 11 Rows, but not implemented yet)
bool ps2Keyboard_extend;    // remembers a keyboard extended char received
bool ps2Keyboard_release;   // distinguishes key presses from releases



// sending command bytes to the keybaord needs proper parity (otherwise the keyboard
// just asks you to repeat the byte)
byte odd_parity(byte val) {
  int i, count = 1;  // start with 0 for even parity
  for (i=0; i<8; i++) {
    if (val&1) count++;
    val = val>>1;
  }
  return count & 1; // bottom bit of count is parity bit
}

void kbd_send_command(byte val) {
  // stop interrupt routine from receiving characters so that we can use it
  // to send a byte
  cmd_in_progress = true;
  cmd_count       = 0;

  // set up the byte to shift out and initialise the ack bit
  cmd_value      = val;
  cmd_ack_value  = 1;    // the kbd will clear this bit on receiving the byte
  cmd_parity     = odd_parity(val);

  // set the data pin as an output, ready for driving
  digitalWrite(ps2Keyboard_DataPin, HIGH);
  pinMode(ps2Keyboard_DataPin, OUTPUT);

  // drive clock pin low - this is going to generate the first
  // interrupt of the shifting out process
  pinMode(ps2Keyboard_ClockPin, OUTPUT);
  digitalWrite(ps2Keyboard_ClockPin, LOW);

  // wait at least one clock cycle (in case the kbd is mid transmission)
  delayMicroseconds(60);

  // set up the 0 start bit
  digitalWrite(ps2Keyboard_DataPin, LOW);
  // let go of clock - the kbd takes over driving the clock from here
  digitalWrite(ps2Keyboard_ClockPin, HIGH);
  pinMode(ps2Keyboard_ClockPin, INPUT);

  // wait for interrupt routine to shift out byte, parity and receive ack bit
  while (cmd_ack_value!=0) ;

  // switch back to the interrupt routine receiving characters from the kbd
  cmd_in_progress = false;
}

void PS2Keyboard::reset() {
  kbd_send_command(0xFF);   // send the kbd reset code to the kbd: 3 lights
                            // should flash briefly on the kbd
  kbd_send_command(0xed);   // Liga os LEDs
  kbd_send_command(0x03);   // NumLock + ScrollLock
  kbd_send_command(0xf4);   // Habilita teclado
  
  // reset all the global variables
  ps2Keyboard_CurrentBuffer = 0;
  ps2Keyboard_CharBuffer    = 0;
  ps2Keyboard_BufferPos     = 0;
  ps2Keyboard_extend        = false;
  ps2Keyboard_release       = false;
  cmd_in_progress           = false;
  cmd_count                 = 0;
  cmd_value                 = 0;
  cmd_ack_value             = 1;
}


// The ISR for the external interrupt
// This may look like a lot of code for an Interrupt routine, but the switch
// statements are fast and the path through the routine is only ever a few
// simple lines of code.
// ===================================
// I made drastic changes in this routines to mork with MSX matrix
void ps2interrupt (void) {
  int value = digitalRead(ps2Keyboard_DataPin);
  int line;
  int column;
  uint8_t temporary;

  if (cmd_in_progress) {
    cmd_count++;          // cmd_count keeps track of the shifting
    switch (cmd_count) {
    case 1: // start bit
      digitalWrite(ps2Keyboard_DataPin,LOW);
      break;
    case 2: case 3: case 4: case 5: case 6: case 7: case 8: case 9:
      // data bits to shift
      digitalWrite(ps2Keyboard_DataPin,cmd_value&1);
      cmd_value = cmd_value>>1;
      break;
    case 10:  // parity bit
      digitalWrite(ps2Keyboard_DataPin,cmd_parity);
      break;
    case 11:  // stop bit
      // release the data pin, so stop bit actually relies on pull-up
      // but this ensures the data pin is ready to be driven by the kbd for
      // for the next bit.
      digitalWrite(ps2Keyboard_DataPin, HIGH);
      pinMode(ps2Keyboard_DataPin, INPUT);
      break;
    case 12: // ack bit - driven by the kbd, so we read its value
      cmd_ack_value = digitalRead(ps2Keyboard_DataPin);
      cmd_in_progress = false;  // done shifting out
    }
    return; // don't fall through to the receive section of the ISR
  }


  if(ps2Keyboard_BufferPos > 0 && ps2Keyboard_BufferPos < 11) {
    ps2Keyboard_CurrentBuffer |= (value << (ps2Keyboard_BufferPos - 1));
  }
  ps2Keyboard_BufferPos++; // keep track of shift-in position

  if(ps2Keyboard_BufferPos == 11) { // a complete character received
    switch (ps2Keyboard_CurrentBuffer) {
    case 0xF0: { // key release char
      ps2Keyboard_release = true;
      break;
    }
    case 0xE0: { // extended char set
      ps2Keyboard_extend = true;
      break;
    }
    default: { // a real key
        ps2Keyboard_CharBuffer = ps2Keyboard_CurrentBuffer;
        if (!ps2Keyboard_extend) {
          temporary=pgm_read_byte(keymap->normal + ps2Keyboard_CharBuffer -1);
        }
        else{
          temporary=pgm_read_byte(keymap->extended + ps2Keyboard_CharBuffer -1);
          ps2Keyboard_extend=false;
        }
        line = (temporary & 240)/16;
        column = (temporary & 15);
        if (ps2Keyboard_release) {
          bitSet(KB_Matrix[line],column);
          ps2Keyboard_release=false;
        }else{
          bitClear(KB_Matrix[line],column);
        }
      }
      
    }
    ps2Keyboard_CharBuffer = ps2Keyboard_CurrentBuffer;
    ps2Keyboard_CurrentBuffer = 0;
    ps2Keyboard_BufferPos = 0;
  }
}

/*
    MSX KEYMAP
    Each byte correspond to a PS2 scan code
    The value represents a Line vs Column of MSX matrix
    F5 = 0x71 ==> Line 7 and Column 1 on MSX
    The value 0xB7 is out of MSX matrix, not mapped
*/
const PROGMEM PS2Keymap_t PS2Keymap_HBABNT = { //Keymap for HotBit and PS2 ABNT
  //Normal
  { 0xB7 /* F9 */ ,0xB7 ,0x71 /* F5 */ ,0x67 /* F3 */ ,0x65 /* F1 */ ,0x66 /* F2 */ ,0xB7 /* F12 */ ,0xB7 ,
    0xB7 /* F10 */ ,0xB7 /* F8 */ ,0xB7 /* F6 */ ,0x70 /* F4 */ ,0x73 /* TAB */ ,0xB7 /* ` */ ,0xB7 ,0xB7 ,
    0x64 /* L ALT */ ,0x60 /* L SHFT */ ,0xB7 ,0x61 /* L CTRL */ ,0x46 /* Q */ ,0x01 /* 1 */ ,0xB7 ,0xB7 ,
    0xB7 ,0x57 /* Z */ ,0x50 /* S */ ,0x26 /* A */ ,0x54 /* W */ ,0x02 /* 2 */ ,0xB7 ,0xB7 ,
    0x30 /* C */ ,0x55 /* X */ ,0x31 /* D */ ,0x32 /* E */ ,0x04 /* 4 */ ,0x03 /* 3 */ ,0xB7 ,0xB7 ,
    0x80 /* SPACE */ ,0x53 /* V */ ,0x33 /* F */ ,0x51 /* T */ ,0x47 /* R */ ,0x05 /* 5 */ ,0xB7 ,0xB7 ,
    0x43 /* N */ ,0x27 /* B */ ,0x35 /* H */ ,0x34 /* G */ ,0x56 /* Y */ ,0x06 /* 6 */ ,0xB7 ,0xB7 ,
    0xB7 ,0x42 /* M */ ,0x37 /* J */ ,0x52 /* U */ ,0x07 /* 7 */ ,0x10 /* 8 */ ,0xB7 ,0xB7 ,
    0x22 /* , */ ,0x40 /* K */ ,0x36 /* I */ ,0x44 /* O */ ,0x00 /* 0 */ ,0x11 /* 9 */ ,0xB7 ,0xB7 ,
    0x23 /* . */ ,0x25 /* ; */ ,0x41 /* L */ ,0x17 /* Ç */ ,0x45 /* P */ ,0x12 /* - */ ,0xB7 ,0xB7 ,
    0x24 ,0x20 /* ~ */ ,0xB7 ,0x15 /* AGUDO */ ,0x13 /* = */ ,0xB7 ,0xB7 ,0x63 /* CAPS */ ,
    0x60 /* R SHFT */ ,0x77 /* ENTER */ ,0x16 /* [ */ ,0xB7 ,0x21 /* ] */ ,0xB7 ,0xB7 ,0xB7 ,
    0x14 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0x75 /* BKSP */ ,0xB7 ,0xB7 ,
    0x01 /* KP 1 */ ,0xB7 ,0x04 /* KP 4 */ ,0x07 /* KP 7 */ ,0x23 ,0xB7 ,0xB7 ,0x00 /* KP 0 */ ,
    0x22 /* KP , */ ,0x02 /* KP 2 */ ,0x05 /* KP 5 */ ,0x06 /* KP 6 */ ,0x10 /* KP 8 */ ,0x72 /* ESC */ ,0xB7 /* NUM */ ,0xB7 /* F11 */ ,
    0xB7 /* KP + */ ,0x03 /* KP 3 */ ,0x12 /* KP - */ ,0xB7 /* KP * */ ,0x11 /* KP 9 */ ,0xB7 /* SCROLL */ ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 /* F7 */ },
  //Extended
  { 0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 /* WWW Search */ ,
    0x62 /* R ALT */ ,0xB7 /* PRNT SCRN */ ,0xB7 ,0x42 /* R CTRL */ ,0xB7 /* Previous Track */ ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0x62 /* L WIN */ ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 /* MESSENGER */ ,0xB7 ,0x64 /* R WIN */ ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 /* CALC */ ,0xB7 ,0xB7 ,0xB7 ,0x80 /* CONTEXTO */ ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 /* PLAY/PAUSE */ ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 /* WWW HOME */ ,0xB7 /* STOP */ ,0xB7 /* LOG OFF */ ,0xB7 ,0xB7 ,0xB7 /* DORMIR */ ,0xB7 /* My Computer */ ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 /* EMAIL */ ,
    0xB7 ,0x24 /* KP / */ ,0xB7 ,0xB7 ,0xB7 /* Next Track */ ,0xB7 ,0xB7 ,0xB7 /* Media Select */ ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0x77 /* KP EN */ ,0xB7 ,0xB7 ,0xB7 ,0xB7 /* Wake */ ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 /* END */ ,0xB7 ,0x84 /* L ARROW */ ,0x81 /* HOME */ ,0xB7 ,0xB7 ,0xB7 ,0x82 /* INSERT */ ,
    0x83 /* DELETE */ ,0x86 /* D ARROW */ ,0xB7 ,0x87 /* R ARROW */ ,0x85 /* U ARROW */ ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0x76 /* PG DN */ ,0xB7 ,0xB7 ,0x74 /* PG UP */ ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 }
};

const PROGMEM PS2Keymap_t PS2Keymap_ExpABNT = {   //Keymap for Expert and PS2 ABNT
  //Normal
  { 0xB7 /* F9 */ ,0xB7 ,0x71 /* F5 */ ,0x67 /* F3 */ ,0x65 /* F1 */ ,0x66 /* F2 */ ,0xB7 /* F12 */ ,0xB7 ,
    0xB7 /* F10 */ ,0xB7 /* F8 */ ,0xB7 /* F6 */ ,0x70 /* F4 */ ,0x73 /* TAB */ ,0xB7 /* ` */ ,0xB7 ,0xB7 ,
    0x64 /* L ALT */ ,0x60 /* L SHFT */ ,0xB7 ,0x61 /* L CTRL */ ,0x46 /* Q */ ,0x01 /* 1 */ ,0xB7 ,0xB7 ,
    0xB7 ,0x57 /* Z */ ,0x50 /* S */ ,0x26 /* A */ ,0x54 /* W */ ,0x02 /* 2 */ ,0xB7 /* L WIN */ ,0xB7 ,
    0x30 /* C */ ,0x55 /* X */ ,0x31 /* D */ ,0x32 /* E */ ,0x04 /* 4 */ ,0x03 /* 3 */ ,0xB7 ,0xB7 ,
    0x80 /* SPACE */ ,0x53 /* V */ ,0x33 /* F */ ,0x51 /* T */ ,0x47 /* R */ ,0x05 /* 5 */ ,0xB7 ,0xB7 ,
    0x43 /* N */ ,0x27 /* B */ ,0x35 /* H */ ,0x34 /* G */ ,0x56 /* Y */ ,0x06 /* 6 */ ,0xB7 ,0xB7 ,
    0xB7 ,0x42 /* M */ ,0x37 /* J */ ,0x52 /* U */ ,0x07 /* 7 */ ,0x10 /* 8 */ ,0xB7 ,0xB7 ,
    0x22 /* , */ ,0x40 /* K */ ,0x36 /* I */ ,0x44 /* O */ ,0x00 /* 0 */ ,0x11 /* 9 */ ,0xB7 ,0xB7 ,
    0x23 /* . */ ,0x24 /* ; */ ,0x41 /* L */ ,0x21 /* Ç */ ,0x45 /* P */ ,0x12 /* - */ ,0xB7 ,0xB7 ,
    0x25 /* / */ ,0x17 /* ~ */ ,0xB7 ,0x15 /* AGUDO */ ,0x13 /* = */ ,0xB7 ,0xB7 ,0x63 /* CAPS */ ,
    0x60 /* R SHFT */ ,0x77 /* ENTER */ ,0x16 /* [ */ ,0xB7 ,0x21 /* ] */ ,0xB7 ,0xB7 ,0xB7 ,
    0x14 /* \ */ ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0x75 /* BKSP */ ,0xB7 ,0xB7 ,
    0x01 /* KP 1 */ ,0xB7 ,0x04 /* KP 4 */ ,0x07 /* KP 7 */ ,0x23 /* KP . */ ,0xB7 ,0xB7 ,0x00 /* KP 0 */ ,
    0x22 /* KP , */ ,0x02 /* KP 2 */ ,0x05 /* KP 5 */ ,0x06 /* KP 6 */ ,0x10 /* KP 8 */ ,0x72 /* ESC */ ,0xB7 /* NUM */ ,0xB7 /* F11 */ ,
    0x90 /* KP + */ ,0x03 /* KP 3 */ ,0x91 /* KP - */ ,0x92 /* KP * */ ,0x11 /* KP 9 */ ,0xB7 /* SCROLL */ ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 /* F7 */ },
  //Extended
  { 0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 /* WWW Search */ ,
    0x62 /* R ALT */ ,0xB7 /* PRNT SCRN */ ,0xB7 ,0x42 /* R CTRL */ ,0xB7 /* Previous Track */ ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0x62 /* L WIN */ ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 /* MESSENGER */ ,0xB7 ,0x64 /* R WIN */ ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 /* CALC */ ,0xB7 ,0xB7 ,0xB7 ,0x80 /* CONTEXTO */ ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 /* PLAY/PAUSE */ ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 /* WWW HOME */ ,0xB7 /* STOP */ ,0xB7 /* LOG OFF */ ,0xB7 ,0xB7 ,0xB7 /* DORMIR */ ,0xB7 /* My Computer */ ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 /* EMAIL */ ,
    0xB7 ,0x94 /* KP / */ ,0xB7 ,0xB7 ,0xB7 /* Next Track */ ,0xB7 ,0xB7 ,0xB7 /* Media Select */ ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0x77 /* KP EN */ ,0xB7 ,0xB7 ,0xB7 ,0xB7 /* Wake */ ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 /* END */ ,0xB7 ,0x84 /* L ARROW */ ,0x81 /* HOME */ ,0xB7 ,0xB7 ,0xB7 ,0x82 /* INSERT */ ,
    0x83 /* DELETE */ ,0x86 /* D ARROW */ ,0xB7 ,0x87 /* R ARROW */ ,0x85 /* U ARROW */ ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0x76 /* PG DN */ ,0xB7 ,0xB7 ,0x74 /* PG UP */ ,0xB7 ,0xB7 ,0xB7 ,
    0xB7 ,0xB7 ,0xB7 }
};

PS2Keyboard::PS2Keyboard() {
  // nothing to do here	
}

void PS2Keyboard::begin(int dataPin, int clockPin, bool kybdLites, const PS2Keymap_t &map) {
  
  keymap = &map;
  // Prepare the global variables
  ps2Keyboard_Lites         = kybdLites;
  ps2Keyboard_DataPin       = dataPin;
  ps2Keyboard_ClockPin      = clockPin;
  ps2Keyboard_CurrentBuffer = 0;
  ps2Keyboard_CharBuffer    = 0;
  ps2Keyboard_BufferPos     = 0;
  ps2Keyboard_extend        = false;
  ps2Keyboard_release       = false;
  cmd_in_progress           = false;
  cmd_count                 = 0;
  cmd_value                 = 0;
  cmd_ack_value             = 1;
  
  
  // initialize the pins
  pinMode(ps2Keyboard_ClockPin, INPUT);
  digitalWrite(ps2Keyboard_ClockPin, HIGH);
  pinMode(dataPin, INPUT);
  digitalWrite(dataPin, HIGH);

  attachInterrupt(0, ps2interrupt, FALLING);

}

bool PS2Keyboard::available() {
  return ps2Keyboard_CharBuffer != 0;
}

byte PS2Keyboard::read() {
  byte result;

  // read the raw data from the keyboard
  result = ps2Keyboard_CharBuffer;
  //ps2Keyboard_CharBuffer = 0;

  return(result);
}
uint8_t PS2Keyboard::MSX_KB_Matrix(uint8_t arg){
  return KB_Matrix[arg];
  
  
}
void PS2Keyboard::lights (byte val) {
  //cmd_ack_byte_ok = false;   // initialise the ack byte flag
  kbd_send_command(0xED);    // send the command byte
  //while (!cmd_ack_byte_ok) ; // ack byte from keyboard sets this flag
  kbd_send_command(val);     // now send the data
}
