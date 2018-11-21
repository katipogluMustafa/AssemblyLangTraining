; -------------------------------------------------------------------------
;
; 	*** XCHG : Exchange***
; - Girdi olan 2 operand'ın değiş tokuş yapmasını sağlar.
; 
; - xchg reg, reg
; - xchg reg, mem
; - xchg mem, reg
;
; -------------------------------------------------------------------------
mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	myVar	dw	1453h
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
		
		XOR AX, AX					; AX = 0
		xchg AX, myVar				; AX = 1453 myVar = 0
		
		xor BX,BX
		xchg AX,BX					; BX = 1453 AX = 0
		
		xchg BX, myVar				; BX = 0	myVar = 1453
		
		
		; Custom Instructions Ends
		
		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN