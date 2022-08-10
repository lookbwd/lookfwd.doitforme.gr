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

.def	Tim0Con	=R2		; 4 variables for Tim0over speed optimixe
.def	Tim0Co2	=R3
.def	Tim0Var	=R4
.def	Tim0Va2	=R5

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
	rjmp	EXT_INT1	; IRQ1 Handler
	reti	;	rjmp	TIM_CAPT1	; Timer1 Capture Handler
	reti	;	rjmp	TIM_COMP1	; Timer1 Compare Handler
	reti	;	rjmp	TIM_OVF1	; Timer1 Overflow Handler
	rjmp	TIM_OVF0	; Timer0 Overflow Handler
	rjmp	UART_RXC	; UART RX Complete Handler
	rjmp	UART_DRE	; UDR Empty Handler
;	rjmp	UART_TXC	; UART TX Complete Handler
;	rjmp	ANA_COMP	; Analog Comparator Handler

;********************************************************************
;* Interupts
;********************************************************************

UART_DRE:	push	temp		; Data transmited... force next
		in	temp,SREG
		push	temp

		dec	XL
		cpi	XL,(0x60-1)	; Total segments number
		breq	EndofTrans

		ld	temp,X
		out	UDR,temp

		pop	temp
		out	SREG,temp
		pop	temp
		reti

EndofTrans:	ldi	temp,(1<<RXEN)+(1<<RXCIE)	; disable interupt
		out	UCR,temp
		pop	temp
		out	SREG,temp
		pop	temp
		reti

TIM_OVF0:	in	Tim0Va2,SREG
		in	Tim0Var,PORTD
		eor	Tim0Var,Tim0Con
		out	PORTD,Tim0Var
		out	TCNT0,Tim0Co2
		out	SREG,Tim0Va2
		reti
		

EXT_INT0:	push	temp		; AD convertion OK write data
		in	temp,SREG
		push	temp

		in	temp,PINB
		st	X+,temp

		sbi	PORTD,ADStart

		cpi	XL,(38+0x60)	; Total segments number
		brsh	AllRead
		
		pop	temp
		out	SREG,temp
		pop	temp
		reti

AllRead:	clr	temp		; Read all segments, now pushing start bytes FF00 
		st	X+,temp		; and sending data to UART
		ldi	temp,(1<<TXEN)+(1<<UDRIE)+(1<<RXEN)+(1<<RXCIE)
		out	UCR,temp
		ser	temp
		out	UDR,temp
		pop	temp
		out	SREG,temp
		pop	temp
		reti


EXT_INT1:	cbi	PORTD,ADStart	; Photo detector Ready, interupt
		reti			; Start AD convertion

UART_RXC:	push	temp		; Data received
		in	temp,SREG
		in	speed,UDR
		out	SREG,temp
		pop	temp
		reti



RESET	:	ldi 	temp, low(RAMEND)
		out	SPL,temp

					; Port D Direction Flags
		ldi	temp,(1<<PHClock)+(1<<PHStart)+(1<<ADStart)
		out	DDRD,temp

		sbi	PORTD,ADStart

		ldi	temp,0x0A
		out	MCUCR,temp

		ldi 	speed,0xb4

		ldi	temp,0x0E	; Setup the UART
		out	UBRR,temp
		ldi	temp,(1<<RXEN)+(1<<RXCIE)
		out	UCR,temp
		
		ldi	temp,0xC0	; Timer - counter enable
		mov	Tim0Co2,temp
		out	TCNT0,Tim0Co2
		ldi	temp,0x01
		out	TCCR0,temp
		ldi	temp,(1<<TOIE0)
		out	TIMSK,temp
		ldi	temp,(1<<PHClock)
		mov	Tim0Con,temp	; Set Clock pin = PHClock
		
		sei			; Enable all interupts

;		--------- main --------

Loop:		sbi	PORTD,PHStart	; Start all segments scaning

;		----- short delay 522u -----

		clr	result
		ldi	temp,0xFB
loop2:		inc	result
		brne	loop2
		inc 	temp
		brne 	loop2
		ldi	temp,0xf2

;		----- continue -----

		cbi	PORTD,PHStart
		clr	XH
		ldi	XL,0x60		; base of SRAM

		ser	temp		; Clear interupt flags and enable interupts
		out	GIFR,temp
		ldi	temp,(1<<INT0)+(1<<INT1); Enable Interupt 0 and 1 on falling edge
		out	GIMSK,temp

; 		------ big delay ------

		clr	result		;Clear result counter 1
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
		rjmp	Loop