mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	sum dd 200

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

		xor cx,cx

strt:	cmp cx, 100
		JNBE insideofwhile
		cmp WORD PTR [sum], 300
		JNB endofwhile

insideofwhile:

		add WORD PTR [sum], cx
		add cx, 5

		jmp strt

endofwhile:
		; Custom Instructions Ends

		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN