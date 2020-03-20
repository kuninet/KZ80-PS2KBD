/*
  PS2Keyboard.h - PS2Keyboard library
  Copyright (c) 2007 Free Software Foundation.  All right reserved.
  Written by Christian Weichel <info@32leaves.net>
    
  Adapted by Eduardo Gouget to work with a MSX Computer
  http://msx.gouget.com.br 2014
*/


#ifndef PS2Keyboard_h
#define PS2Keyboard_h

#include "Arduino.h"

/*
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
*/

/*
 * PS2 keyboard "make" codes to check for certain keys.
 */

// Give these codes that aren't used by anything else
// Making all the control key codes above 0x80 makes it simple to check for
// printable characters at the calling level.
#define PS2_KC_BKSP    0x80
#define PS2_KC_UP      0x81
#define PS2_KC_DOWN    0x82
#define PS2_KC_LEFT    0x83
#define PS2_KC_RIGHT   0x84
#define PS2_KC_PGDN    0x85
#define PS2_KC_PGUP    0x86
#define PS2_KC_END     0x87
#define PS2_KC_HOME    0x88
#define PS2_KC_INS     0x89
#define PS2_KC_DEL     0x8A
#define PS2_KC_ESC     0x8B
#define PS2_KC_CLON    0x8C // caps_lock on
#define PS2_KC_CLOFF   0x8D // caps_lock off

#define PS2_KEYMAP_SIZE 131 // PS2 matrix size with MSX bytes

typedef struct {
	uint8_t normal[PS2_KEYMAP_SIZE];
	uint8_t extended[PS2_KEYMAP_SIZE];
} PS2Keymap_t;

extern const PROGMEM PS2Keymap_t PS2Keymap_HBABNT;
extern const PROGMEM PS2Keymap_t PS2Keymap_ExpABNT;
//extern const PROGMEM PS2Keymap_t PS2Keymap_HBUS;
//extern const PROGMEM PS2Keymap_t PS2Keymap_ExpUS;

typedef uint8_t bool;
typedef uint8_t byte;

/**
 * Purpose: Provides an easy access to PS2 keyboards
 * Author:  Christian Weichel
 */
class PS2Keyboard {

  private:
    int  m_dataPin;
    byte m_charBuffer;

  public:
  	/**
  	 * This constructor does basically nothing. Please call the begin(int)
  	 * method before using any other method of this class.
  	 */
  	PS2Keyboard();

    /**
     * Starts the keyboard "service" by registering the external interrupt.
     * setting the pin modes correctly and driving those needed to high.
     * The propably best place to call this method is in the setup routine.
     */
    void begin(int dataPin, int clockPin, bool kybdLites, const PS2Keymap_t &map = PS2Keymap_HBABNT);

    /**
     * Returns true if there is a char to be read, false if not.
     */
    bool available();

    /**
     * Sends a reset command to the keyboard and re-initialises all the control
     * variables within the PS2Keybaord code.
     */
    void reset();

    /**
     * Returns the char last read from the keyboard. If the user has pressed two
     * keys between calls to this method, only the later one will be availble. Once
     * the char has been read, the buffer will be cleared.
     * If there is no char availble, 0 is returned.
     */
    byte read();

    uint8_t MSX_KB_Matrix(uint8_t arg); // Return the value of MSX matrix
    
    void lights (byte val); // Change the light of PS2

};

#endif
