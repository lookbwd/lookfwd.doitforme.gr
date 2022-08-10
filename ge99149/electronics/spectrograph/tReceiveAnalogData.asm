;***************************************************************************
;* Title                :Send message with RS232
;* Target MCU           :AT90S2313
;* The timing is adapted for 9.216 MHz crystal
;***************************************************************************

.include "2313def.inc"

.def	temp	=R16
.def	temp1	=R17
.def	result	=R18
.def	temp2	=R19		; RC5 Message
.def	speed	=R20
.def	temp3	=R21
.def	oldata	=R22

;	Port D definitions
.equ	SerTXD	=0
.equ	SerRXD	=1
.equ	ADInter	=2
.equ	PHInter	=3
.equ	PHClock	=4
.equ	PHStart	=5
.equ	ADStart	=6

.cseg
.org 0
	rjmp	RESET		; Reset Handler
	rjmp	EXT_INT0	; IRQ0 Handler
	reti	;	rjmp	EXT_INT1	; IRQ1 Handler
	reti	;	rjmp	TIM_CAPT1	; Timer1 Capture Handler
	reti	;	rjmp	TIM_COMP1	; Timer1 Compare Handler
	reti	;	rjmp	TIM_OVF1	; Timer1 Overflow Handler
	reti	;	rjmp	TIM_OVF0	; Timer0 Overflow Handler
	rjmp	UART_RXC	; UART RX Complete Handler
;	rjmp	UART_DRE	; UDR Empty Handler
;	rjmp	UART_TXC	; UART TX Complete Handler
;	rjmp	ANA_COMP	; Analog Comparator Handler

;********************************************************************
;* Interupts
;********************************************************************

EXT_INT0:	push	temp
		in	temp,SREG
		push	temp

		in	temp,PINB
		out	UDR,temp
		sbi	PORTD,ADStart
		
		pop	temp
		out	SREG,temp
		pop	temp
		reti

UART_RXC:	push	temp
		in	temp,SREG
		in	speed,UDR
		out	SREG,temp
		pop	temp
		reti



RESET	:	ldi 	temp, low(RAMEND)
		out	SPL,temp
		ldi	temp,0x0E
		out	UBRR,temp		
		ldi	temp,(1<<TXEN)+(1<<RXEN)+(1<<RXCIE)
		out	UCR,temp
		
;		ldi	temp,0x01	; Timer - counter enable
;		out	TCCR0,temp

		ldi	temp,(1<<PD6)
		out	DDRD,temp

		sbi	PORTD,ADStart




		
		out	PORTB,temp

		ldi	temp,(1<<INT0)
		out	GIMSK,temp		
		ldi	temp,0x02
		out	MCUCR,temp
		
		sei

Loop:		rcall	Delay
		cbi	PORTD,ADStart
		rjmp	Loop
		
		
Delay:		clr	result		;Clear result counter 1
		mov	temp3,speed	;Reset temp counter 2
		ldi	temp1,0xff	;load temp1, counter 3
		ldi	temp,0xf2
loop1:
		inc	temp1		;Count up temp counter 1
		brne	loop1
		ldi	temp1,0xff	;load temp1, counter 3
		inc	result
		brne	loop1		;Check if inner loop is finished
		inc 	temp		;Count up temp counter 2
		brne 	loop1		;Check if delay is finished
		ldi	temp,0xf2
		inc 	temp3		;Count up temp counter 2
		brne 	loop1		;Check if delay is finished
		ret