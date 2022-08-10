;***************************************************************************
;* Title                : Create custom pulses with or without triger
;* Target MCU           : AT90S2313
;* The timing is adapted for 4 MHz crystal
;***************************************************************************

.include "2313def.inc"

.def	DivL		=r0		; Dividend Low byte

.def	V1H		=r10		; Local copies of signal Variable1H
.def	V1L		=r11		; Local copies of signal Variable1L
.def	V2H		=r12		; Local copies of signal Variable2H
.def	V2L		=r13		; Local copies of signal Variable2L
.def	V3L		=r14		; Local copies of signal Variable3L

.def	temp		=R16		; scrach register 1
.def	temp2		=R17		; scrach register 2
.def	DispCnt 	=R18		; Which segment is to be displayed next
.def	DivCnt		=r19		; Divide Counter
.def	DivResult	=R20		; Result of division with 10 for display
.def	PeriodL		=R21		; Signal's period Low byte (Mode 1)
.def	PeriodH		=R22		; Signal's period High byte (Mode 2)
.def	FlagLed		=R23		; Register Indicating which Led should light


; X used as index of the step that pulse sequence is (1st set, 2nd set, 1st clear, 2nd clear)
; Y used as EEPROM index and temporary for storing division remainder
; Z used as key anti-bounce counter providing smooth variable change


; SRAM definitions
; 0x0060(H) and 0x0061(L) store the delay between set of PD0 and PD1
; 0x0062(H) and 0x0063(L) store the delay between set of PD1 and clear of PD0
; 0x0064(H) and 0x0065(L) store the delay between clear of PD0 and clear of PD1

; 0x0066(H) and 0x0067(L) store the first variable
; 0x0068(H) and 0x0069(L) store the second variable
; 0x006A stores the third variable

; 0x0070 Used to store hundrents of visible variable
; 0x0071 Used to store tens of visible variable
; 0x0072 Used to store ones of visible variable


;	-------------------------------------------------------------------------
;				Interupt Segment
;	-------------------------------------------------------------------------

		rjmp	RESET			; Reset Handler
		rjmp	EXT_INT0		; IRQ0 Handler
		nop				; IRQ1 Handler
		nop				; Timer1 Capture Handler
		rjmp	TIM_COMP1		; Timer1 Compare Handler
		nop				; Timer1 Overflow Handler
		rjmp	TIM_OVF0		; Timer0 Overflow Handler
	

;	-------------------------------------------------------------------------
;		External interupt 0 at the rising edge of PD2
;	-------------------------------------------------------------------------

EXT_INT0:	push	temp			; Pushes...
		in	temp,SREG
		push	temp
		push	temp2

		lds	temp,0x006A		; If Variable3 is 0 (mode 1)
		tst	temp
		brbs	1,EXT_END		; do nothing
		rcall	CalculatePulse		; Else triger another pulse (mode 2)
		rcall	TrigerNewPulse

EXT_END:	pop	temp2			; Pops...
		pop	temp
		out	SREG,temp
		pop	temp
		reti
		
;	-------------------------------------------------------------------------
;				Timer 1 Compare interupt
;	-------------------------------------------------------------------------

TIM_COMP1:	push	temp			; Pushes...
		in	temp,SREG
		push	temp
		push	temp2
		
		cpi	XL,0x62			; Is sequence in step2?
		brbs	1,SetPD1		; Then raise PD1
		cpi	XL,0x64			; Is sequence in step3?
		brbs	1,ClearPD0		; Then clear PD0
		cbi	PORTD,PD1		; Else in step4, clear PD1

		ldi	XL,0x60			; Restore step counter to initial value
		ldi	temp, 0x02		; Disable interupt
		out	TIMSK,temp
		
TIM_COMP1_Ret:	ld	temp, X+		; Set next interupt's time window
		out	OCR1AH,temp
		ld	temp, X+
		out	OCR1AL,temp
		
		ldi	temp,0x40		; Clear possible interupt Flag
		out	TIFR,temp
		
		pop	temp2			; Pops...
		pop	temp
		out	SREG,temp
		pop	temp
		reti
		
SetPD1:		sbi	PORTD,PD1		; Set PD1
		rjmp	TIM_COMP1_Ret
ClearPD0:	cbi	PORTD,PD0		; Clear PD0
		rjmp	TIM_COMP1_Ret

;	-------------------------------------------------------------------------
;			Timer 0 Overfloat interupt every 1mS
;		Used to service key function and triger new pulse sequences
;	-------------------------------------------------------------------------
		
TIM_OVF0:	push	temp			; Pushes...
		in	temp,SREG
		push	temp

		ldi	temp,0xC1		; Set exact time for the next interupt
		out	TCNT0,temp
		push	temp2
		push	DispCnt

		sbic	PIND,PIND6		; Is Increase Button Pushed?
		rjmp	IncreasePushed
		sbic	PIND,PIND5		; Is Decrease Button Pushed?
		rjmp	DecreasePushed
		sbic	PIND,PIND4		; Is Up Button Pushed?
		rjmp	UpPushed
		sbic	PIND,PIND3		; Is down Button Pushed?
		rjmp	DownPushed
		ldi	ZL,0xFF			; If no key pressed reset anti-bounce counter
		ldi	ZH,0xFF

ReturnFromKey:	cpi	ZH,0xFF			; Is any key pushed?
		brbs	1,BtnNoChange		; No then goto NoChange
		
		rcall	EEStore			; Else Update EEPROM for posible Changes
		rcall	Prepare4Displ		; Format data for display output
		
BtnNoChange:	dec	PeriodL			; If time==variable2 passed since last pulse
		brbc	1,TIM_END
		dec	PeriodH
		brbc	2,TIM_END

		lds	PeriodH,0x0068		; Set next event's time
		lds	PeriodL,0x0069
		
		lds	temp,0x006A		; If Variable3==0 (mode 2)
		tst	temp
		brbc	1,TIM_END		; then do nothing
		rcall	CalculatePulse		; Else triger another pulse (mode 1)
		rcall	TrigerNewPulse

TIM_END:	pop	temp2			; Pops...
		pop	temp
		out	SREG,temp
		pop	temp
		reti

;	-------------------------------------------------------------------------
;				Button Service routines
;	-------------------------------------------------------------------------

UpPushed:	adiw	ZL,0x01			; Up button pushed
		brbc	1,ReturnFromKey
		dec	FlagLed			; Set previous Variable(Led)
		brbc	2,ReturnFromKey		; If the first
		clr	FlagLed			; Then don't change
		rjmp	ReturnFromKey

DownPushed:	adiw	ZL,0x01			; Down button pushed
		brbc	1,ReturnFromKey
		inc	FlagLed			; Set next Variable(Led)
		cpi	FlagLed,0x03	
		brbc	1,ReturnFromKey		; If the last	
		ldi	FlagLed,0x02		; Then don't change
		rjmp	ReturnFromKey

IncreasePushed:	adiw	ZL,0x01			; Increase button pushed
		brbs	1,DoIncrease		; If first time key pushed DoIncrease
		cpi	ZH,0x02			; Else if key pushed for more than 512 cycles
		brbs	0,ReturnFromKey
		mov	temp,ZL			; Then every 32 cycles DoIncrease
		andi	temp,0x1F
		brbc	1,ReturnFromKey
DoIncrease:	cpi	FlagLed,0x00		; Choose which variable to change
		brbs	1,IncVariable1
		cpi	FlagLed,0x01
		brbs	1,IncVariable2
		cpi	FlagLed,0x02
		brbs	1,IncVariable3
ReturnLocal:	rjmp	ReturnFromKey


DecreasePushed:	adiw	ZL,0x01			; Decrease button pushed
		brbs	1,DoDecrease		; If first time key pushed DoDecrease
		cpi	ZH,0x02			; Else if key pushed for more than 512 cycles
		brbs	0,ReturnFromKey
		mov	temp,ZL			; Then every 32 cycles DoDecrease
		andi	temp,0x1F
		brbc	1,ReturnFromKey
DoDecrease:	cpi	FlagLed,0x00		; Choose which variable to change
		brbs	1,DecVariable1
		cpi	FlagLed,0x01
		brbs	1,DecVariable2
		cpi	FlagLed,0x02
		brbs	1,DecVariable3
		rjmp	ReturnFromKey

;	-------------------------------------------------------------------------
;			Button SubService routines (Variable Changes)
;	-------------------------------------------------------------------------

IncVariable1:	lds	temp,0x0067		; Increase Variable1
		inc	temp
		sts	0x0067,temp
		brbc	1,ReturnLocal
		lds	temp,0x0066
		inc	temp
		sts	0x0066,temp
		rjmp	ReturnFromKey


IncVariable2:	lds	temp,0x0069		; Increase Variable2
		inc	temp
		sts	0x0069,temp
		brbc	1,ReturnLocal
		lds	temp,0x0068
		inc	temp
		sts	0x0068,temp
		rjmp	ReturnFromKey


IncVariable3:	ldi	temp,0x01		; Increase Variable3
		sts	0x006A,temp
		rjmp	ReturnFromKey
		

DecVariable1:	lds	temp,0x0067		; Decrease Variable1
		dec	temp
		sts	0x0067,temp
		cpi	temp,0xFF
		brbc	1,ReturnLocal
		lds	temp,0x0066
		dec	temp
		sts	0x0066,temp
		rjmp	ReturnFromKey
		
DecVariable2:	lds temp,0x0069			; Decrease Variable2
		dec temp
		sts 0x0069,temp
		cpi temp,0xFF
		brbc 1,ReturnLocal
		lds temp,0x0068
		dec temp
		sts 0x0068,temp
		rjmp ReturnFromKey

DecVariable3:	clr temp			; Decrease Variable3
		sts 0x006A,temp
		rjmp ReturnFromKey

; --------------------------------------------------------------------------
;	Calculate delay parameters for the new pulse sequence
; --------------------------------------------------------------------------

CalculatePulse:	lds	temp2,0x0066		; It takes theoretical values
		lds	temp,0x0067		; and calculates delays in ÏS/4
		clc				; for pulse sequence
		rol	temp
		rol	temp2
		rol	temp
		rol	temp2
		subi	temp,0x0B
		sbci	temp2,0x00
		sts	0x0060,temp2		; Set delay time between two outputs
		sts	0x0061,temp		; for use in the begining of pulse
		sts	0x0064,temp2		; and for the end
		sts	0x0065,temp
		subi	temp,0x94		; Subtract 1mS = 4000 cycles from delay value
		sbci	temp2,0x0F		; to calculate delay between two pulses
		com	temp			; a - b = - (b - a) technique to save variables
		com	temp2
		sts	0x0062,temp2		; Store delays
		sts	0x0063,temp
		ret

; --------------------------------------------------------------------------
;			Triger new pulse sequence
; --------------------------------------------------------------------------

TrigerNewPulse:	ldi	XL,0x60
		clr	XH

		ld	temp, X+		; Recall 0x0060 to OCR1AH
		out	OCR1AH,temp
		ld	temp, X+		; and  0x0061 to OCR1AL
		out	OCR1AL,temp
		clr	temp
		out	TCNT1H,temp		; Reset timer's value
		out	TCNT1L,temp

		sbi	PORTD,PD0		; Set PD0 (First Pulse)

		ldi	temp,0x40		; Clear possible set compare interupt flag
		out	TIFR,temp
		ldi	temp,0x42		; Enable timer compare interupt
		out	TIMSK,temp
		ret

; --------------------------------------------------------------------------
; 		Fairly optimized divide with 10 function
;	DivL(L),YL(H) are dividend, YL is reminder and DivResult is result
; --------------------------------------------------------------------------

DivideWith10: 	ldi 	DispCnt,0xFF		; Display first segment next
		ldi 	DivCnt,0x08
		clr	YH

DivideLoop:	clc
		rol	DivL			; rol LOW byte
		rol	YL			; rol HIGH byte
		sbiw	YL,0x0A			; remainder = remainder - divisor
		brbs	0,DeviNegative		; if carry set goto DeviNegative
		rol	DivResult		; set first bit=Carry=0
DivideContinue:	dec	DivCnt			; Decrease DivideCounter
		brbc	1,DivideLoop		; If more loops then goto Loop
		com	DivResult		; Set the complement of result(C=1 div[b0]=0)
		ret				; return
DeviNegative:	rol	DivResult		; set first bit=Carry=1
		adiw	YL,0x0A			; restore remainder
		rjmp	DivideContinue

; --------------------------------------------------------------------------
; 		Select which variable will be used for division
; --------------------------------------------------------------------------

SelectVariable:	cpi	FlagLed,0x00
		brbs	1,VariableAlpha
		cpi	FlagLed,0x01
		brbs	1,VariableBeta
		cpi	FlagLed,0x02
		brbs	1,VariableGama
		clr	YL
		clr	DivL
		ret

VariableAlpha:	lds	DivL,0x0067
		lds	YL,0x0066
		ret

VariableBeta:	lds	DivL,0x0069
		lds	YL,0x0068
		ret

VariableGama:	lds	DivL,0x006A
		clr	YL
		ret
		
; --------------------------------------------------------------------------
; 		Prepare visible variable for view to display
; --------------------------------------------------------------------------			
		
Prepare4Displ:	cli				; Disable interupts to lock variables
		push	YL
		push	YH
		
		rcall	SelectVariable		; Select which variable to be displayed
		rcall	DivideWith10		; Divide variable with 10
		sts	0x0072,YL		; store ones in 0x0072
		mov	DivL,DivResult		; Move modulo for next division
		clr	YL
		rcall	DivideWith10		; Redivide, finaly var/100
		sts	0x0071,YL		; store tenths in 0x0071
		sts	0x0070,DivResult	; store hundrends in 0x0070

		pop	YH
		pop	YL
		sei
		ret
		
; --------------------------------------------------------------------------
; 		Store the three variables to EEPROM
; --------------------------------------------------------------------------	
		
EEStore:	sbic	EECR,EEWE		; Has EEPROM writen last byte?
		ret				; No? Return
		lds	V1H,0x0066		; Yes... Restore variables to data space
		lds	V1L,0x0067
		lds	V2H,0x0068
		lds	V2L,0x0069
		lds	V3L,0x006A
		clr	YH
		dec	YL
		brbc	1,EENoInit
		ldi	YL,0x06
EENoInit:	ldd	temp, Y+8		; Read EEPROM and check for changes
		out	EEAR,YL
		sbi	EECR,EERE
		in	temp2,EEDR
		cp	temp,temp2		; Is a change between stored and current data?
		brbc	1,IsAChange		; Yes... Go to IsAChange
		ret				; Else return

IsAChange:	out	EEAR,YL			; Out EEPROM's address
		out	EEDR,temp		; Out updated Data
		cli 				; disable interupts, time critical
		sbi	EECR,EEMWE		; Write enable fuse
		sbi	EECR,EEWE		; Write strobe
		sei				; re-enable interupts
		ret

; --------------------------------------------------------------------------
; 		Recall the three variables from EEPROM
; --------------------------------------------------------------------------	
		
EERestore:	ldi	YL,0x06			; 5 Values to be restored
		clr	YH
EERestoreLoop:	out	EEAR,YL			; Store EEData to r10...r14
		sbi	EECR,EERE
		in	temp,EEDR
		std	Y+8, temp
		dec	YL
		cpi	YL,0x01
		brbc	1,EERestoreLoop

		mov	temp2,V1L		; Test if DATA is all right
		cpi	temp2,0xE7		; Test if Variable 1 is between 0...999
		ldi	temp2,0x03
		cpc	V1H,temp2
		brbs	0,Variable1OK
		ldi	temp,0x0A		; If it isn't set Variable 1 to 10
		mov	V1L,temp
		clr	V1H
Variable1OK:	mov	temp2,V2L		; Test if Variable 2 is between 0...999
		cpi	temp2,0xE7
		ldi	temp2,0x03
		cpc	V2H,temp2
		brbs	0,Variable2OK
		ldi	temp,0x0A		; If it isn't set Variable 2 to 10
		mov	V2L,temp
		clr	V2H
Variable2OK:	mov	temp,V3L		; Test if Variable 3 is between 0...1
		cpi	temp,0x01
		brbs	1,EERestoreFinal
		tst	V3L
		brbs	1,EERestoreFinal
		clr	V3L			; If it isn't set Variable 3 to 0

EERestoreFinal:	sts	0x0066,V1H		; Set all values to SRAM segment
		sts	0x0067,V1L
		sts	0x0068,V2H
		sts	0x0069,V2L
		sts	0x006A,V3L
		ret 

;	-------------------------------------------------------------------------
;				Update display routines
;	-------------------------------------------------------------------------

SetDisplay:	ldi	temp,0x0D		; Clear output temporary
		out	PORTB,temp
		inc	DispCnt			; Which display is next?
		cpi	DispCnt,0x03
		brbs	2,FirstDisplay		; All displays updated?
		clr	DispCnt			; Restart

FirstDisplay:	tst	DispCnt			; Update first display?
		brbc	1,SecondDisplay		; No, Jump to next
		lds	temp,0x0070		; First led's data stored in SRAM 0x0070
		ldi	temp2,0x40
		cpi	FlagLed,0x01		; Test if extra led set
		brbc	1,ExtraLedOff0
		ldi	temp2,0xC0
ExtraLedOff0:	or	temp2,temp
		out	PORTB,temp2
		ret

SecondDisplay:	cpi	DispCnt,0x01		; Update second display?
		brbc	1,ThirdDisplay		; No, Jump to next
		lds	temp,0x0071		; Second led's data stored in SRAM 0x0071
		ldi	temp2,0x20
		cpi	FlagLed,0x02		; Test if extra led set
		brbc	1,ExtraLedOff1
		ldi	temp2,0xA0
ExtraLedOff1:	or	temp2,temp
		out	PORTB,temp2
		ret

ThirdDisplay:	lds	temp,0x0072		; Then it's the third display
		ldi	temp2,0x10		; Third led's data stored in SRAM 0x0072
		cpi	FlagLed,0x00
		brbc	1,ExtraLedOff2		; Test if extra led set
		ldi	temp2,0x90
ExtraLedOff2:	or	temp2,temp
		out	PORTB,temp2
		ret

;	-------------------------------------------------------------------------
;				Initializations and settings
;	-------------------------------------------------------------------------

RESET:		ldi	temp,low(RAMEND)
		out	SPL,temp

		clr	ZL
		clr	ZH
		
		ldi	temp,3
ResetLoop:	dec	temp			; Big initial delay waiting for V++ to stable
		brne	ResetLoop		; because EERead operations follow
		ldi	temp,3
		adiw	ZL,0x01
		brbc	1,ResetLoop

		ldi	temp,0xFF		; PORTB as an output(Leds and Displays)
		out	DDRB,temp
		ldi	temp,0x03		; PD0,PD1 output, all other input(buttons)
		out	DDRD,temp

		ldi	temp,0x03		; Set Timer0 Running at CK/64
		out	TCCR0,temp

		ldi	temp,0x02		; Timer0 interupt enable
		out	TIMSK,temp

		ldi	temp,0x40		; Enable interupt 0
		out	GIMSK,temp

		ldi	temp,0x03		; Rising edge of INT0 generates interupt
		out	MCUCR,temp

		clr	temp			; Set timer1 as an autonomous timer
		out	TCCR1A,temp
		ldi	temp,0x09		; Running at CLK and reseting
		out	TCCR1B,temp		; once compare mach

		rcall	EERestore		; Restore data from the EEPROM
		lds	PeriodH,0x0068
		lds	PeriodL,0x0069
		ldi	YL,0x06
		clr	FlagLed			; Set First Variable Visible
		rcall	Prepare4Displ		; Fix data to display type
		sei				; Enable all interupts

loop:		rcall	SetDisplay		; Update display segment
		rjmp	loop
