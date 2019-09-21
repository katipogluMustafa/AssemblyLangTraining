;sum := 0;
;
;for count := 1 to 100 loop
;
;count to add sum;
;
;end for;
;

mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	sum dw 0
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

		mov cx, 1

strt:	cmp cx, 100
		JZ son

		add sum, cx
		inc cx

		jmp strt
son:


		; Custom Instructions Ends

		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN