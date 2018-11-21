; -------------------------------------------------------------------------
;
; 	***MOV Komutu***
; 
; - Her iki işlenende mem yada sreg(segment register) olamaz.
; - İlk işlenen sreg, ikinci işlenen immediate data olamaz.
; - Operandların boyutları aynı olmalı.
; - Bayrakların konumunu değiştirmez.
; - Girdilerden biri mem ise PTR'dan yararlanılır.
;
; MOV dest,src
; src <-- dest
;
; -------------------------------------------------------------------------
mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	myVar 		dw 1998			; myVar = 07CEh
	mySecondVar dd 19981998h
	myThirdVar	dd 0
	myfourthVar	dq 0
mydata ENDS

mycode SEGMENT PARA 'CODE'

	ASSUME CS:mycode, DS:mydata, SS:mystack
	
MAIN	PROC FAR
		
		; For returning
		push ds
		xor ax,ax
		push ax
	
		; For defining data segment
		mov ax, mydata
		mov ds, ax
		
		; Custom Instructions Starts
		
		mov AX, 0		; AX = 0			; reg, idata
		mov AX, 1997h	; AX = 1997h
		mov AL, 98H		; AL = 98H
		mov AH, 20H		; AH = 20H
		; AH ve AL değiştiğinden, şuan AX = 2098h 
		
		mov AX, myVar	; AX = 07CEh		; reg, mem
		mov WORD PTR [myThirdVar + 0], AX 	; myThirdVar = 0000 07CE h
		mov BYTE PTR [myThirdVar + 2], AL 	; myThirdVar = 00CE 07CE h
		mov BYTE PTR [myThirdVar + 3], AH 	; myThirdVar = 07CE 07CE h
		
		mov BX, AX		; BX = AX = 07CEh	; reg, reg
		; Custom Instructions Ends
		
		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN