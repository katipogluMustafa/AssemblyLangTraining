mystack	SEGMENT PARA STACK 'STACK'

	; Define required amount of stack segment here
	DW 10 DUP(?)

mystack ENDS

mydata SEGMENT PARA 'DATA'
	; Define required variables here

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
		
		; Code Start

			; Define your program specific code
		
		; Code End

		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN