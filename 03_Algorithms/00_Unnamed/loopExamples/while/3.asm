mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	sum dd 0

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

		mov cx, 100

strt:	cmp WORD PTR [sum], 1000
		JB insideofwhile
		cmp cx, 50
		JNBE endofwhile

insideofwhile:

		add WORD PTR [sum], cx
		dec cx

		jmp strt

endofwhile:
		; Custom Instructions Ends

		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN