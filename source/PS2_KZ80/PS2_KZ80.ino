#include <avr/pgmspace.h>
#include <avr/io.h>
#include "PS2Keyboard.h"

#define KBD_CLK_PIN  2
#define KBD_DATA_PIN 3

#define F_CPU 8000000UL

PS2Keyboard keyboard;

void setup() {
  
  keyboard.begin(KBD_DATA_PIN, KBD_CLK_PIN, 0); //Compile code with Hotbit ABNT2 Key Map
//  keyboard.begin(KBD_DATA_PIN, KBD_CLK_PIN, 0, PS2Keymap_ExpABNT); //Compile code with Expert ABNT2 Key Map
  

  PCMSK1 |= (_BV(0)|_BV(1)|_BV(2)|_BV(3));
  PCICR |= _BV(PCIE1);

  DDRC &= ~(_BV(0)|_BV(1)|_BV(2)|_BV(3));
  DDRB = B11111111;
  PORTC &= ~(_BV(0)|_BV(1)|_BV(2)|_BV(3));
  
  keyboard.reset();
  
}

void loop() {
  
}

ISR(PCINT1_vect)
{

    if ( PINC == 8) {
      delayMicroseconds(16);
      if (PINC==8) {
        noInterrupts();
        PORTB = keyboard.MSX_KB_Matrix(0);
        interrupts();
      }else{
        noInterrupts();
        PORTB = keyboard.MSX_KB_Matrix(PINC+1); 
        interrupts();
      }
    } else {
      noInterrupts();
      PORTB = keyboard.MSX_KB_Matrix(PINC+1) ;
      interrupts();
    }        
}
