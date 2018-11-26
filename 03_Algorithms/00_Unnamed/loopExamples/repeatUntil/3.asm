;count := 30;
;
;sum := 50;
;
;repeat
;
;add count to sum;
;
;subtract 1 from count;
;
;until (count = 0) or (sum ≥ 400);

mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	sum dw 50
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

		mov cx, 30	; cx = count


inside:	add sum, cx
		dec cx

		cmp cx, 0
		jz outside
		cmp WORD PTR sum, 400
		JNGE inside
outside:

		; Custom Instructions Ends

		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN