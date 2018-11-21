; -------------------------------------------------------------------------
;
; 	*** CLC : Clear Carry Flag***
;
; - CF <-- 0
;
; -------------------------------------------------------------------------
;
; 	*** CMC : Complement Carry Flag ***
;
; - CF = 1 ise, CF <-- 0
; - CF = 0 ise, CF <-- 1
; -------------------------------------------------------------------------
;
; 	*** STC : Set Carry Flag ***
;
; - CF <-- 1
; -------------------------------------------------------------------------
mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	myVar		dw 3
	mySecondVar	dw 8
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
		SHR WORD PTR [myVar], 1 		; CF = 1
		CLC								; CF = 0
		
		SHR WORD PTR [mySecondVar], 1	; CF = 0
		CMC								; CF = 1
		CMC								; CF = 0
		
		STC								; CF = 1
		RCL WORD PTR [myVar], 1
		
		
		
		; Custom Instructions Ends
		
		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN