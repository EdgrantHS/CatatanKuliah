#define __SFR_OFFSET 0x00
#include "avr/io.h"

;------------------------

.global main
main:
    LDI   R20, 0xFF
    OUT   DDRD, R20   ;set port D as o/p for low byte result
    OUT   DDRB, R20   ;set port B as o/p for high byte result
    SBI   DDRC, 0     ;set pin PC0 as i/p for ADC0
    ;--------------------------------------------------------------
    LDI   R20, 0xC0   ;internal 2.56V, right-justified data, ADC0
    STS   ADMUX, R20
    LDI   R20, 0x87   ;enable ADC, ADC prescaler CLK/128
    STS   ADCSRA, R20
;------------------------------------------------------------------

read_ADC:
    LDI   R20, 0xC7   ;set ADSC in ADCSRA to start conversion
    STS   ADCSRA, R20
    ;--------------------------------------------------------------

wait_ADC:
    LDS   R21, ADCSRA ;check ADIF flag in ADCSRA
    SBRS  R21, 4      ;skip jump when conversion is done (flag set)
    RJMP  wait_ADC    ;loop until ADIF flag is set
    ;--------------------------------------------------------------
    LDI   R17, 0xD7   ;set ADIF flag again
    STS   ADCSRA, R17 ;so that controller clears ADIF
    ;--------------------------------------------------------------
    LDS   R18, ADCL   ;get low-byte result from ADCL
    LDS   R19, ADCH   ;get high-byte result from ADCH
    OUT   PORTD, R18  ;send low-byte to port D
    OUT   PORTB, R19  ;send high-byte to port B
    RJMP  read_ADC