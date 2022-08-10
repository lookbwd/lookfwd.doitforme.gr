;***************************************************************************
;* Title                :Send message with RS232
;* Target MCU           :AT90S2313
;* The timing is adapted for 9.216 MHz crystal
;***************************************************************************

.include "2313def.inc"

.def	temp	=R16
.def	temp1	=R17
.def	result	=R18
.def	temp2	=R20		; RC5 Message
.def	counter	=R21		; Bit received counter
.def	delay	=R22
.def	flag	=R23

.cseg
.org 0
	rjmp	RESET		; Reset Handler
;	rjmp	EXT_INT0	; IRQ0 Handler
;	rjmp	EXT_INT1	; IRQ1 Handler
;	rjmp	TIM_CAPT1	; Timer1 Capture Handler
;	rjmp	TIM_COMP1	; Timer1 Compare Handler
;	rjmp	TIM_OVF1	; Timer1 Overflow Handler
;	rjmp	TIM_OVF0	; Timer0 Overflow Handler
;	rjmp	UART_RXC	; UART RX Complete Handler
;	rjmp	UART_DRE	; UDR Empty Handler
;	rjmp	UART_TXC	; UART TX Complete Handler
;	rjmp	ANA_COMP	; Analog Comparator Handler

;********************************************************************
;* Interupts
;********************************************************************
RESET	:	ldi r16, low(RAMEND)
		out	SPL,r16

		ldi	temp,0x0E
		out	UBRR,temp
		ldi	temp,0x08
		out	UCR,temp
		ldi	counter,0x00
		
Loop:		ldi	ZH,high(Word<<1)
		ldi	ZL,low(Word<<1)
		add	ZL,counter
		lpm
		out	UDR,r0
		inc	counter
		cpi	counter,((EOW-WORD)<<1)
		brcs	Continue
		clr	counter
		
Continue:	rcall	Delay
		rjmp	Loop
		
		
Delay:		clr	result		;Clear result counter 1
		ldi	temp,$00	;Reset temp counter 2
		ldi	temp1,0xff	;load temp1, counter 3
loop1:
		inc	temp1		;Count up temp counter 1
		brne	loop1
		ldi	temp1,0xff	;load temp1, counter 3
		inc	result
		brne	loop1		;Check if inner loop is finished
		inc 	temp		;Count up temp counter 2
		brne 	loop1		;Check if delay is finished
		ret
				
Word:  		.DB "I AVR sas stelnei ilektronika filakia!! 0123456789"
EOW: