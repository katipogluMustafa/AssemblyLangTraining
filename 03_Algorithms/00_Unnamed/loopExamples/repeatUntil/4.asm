;count := 30;
;
;sum := 50;
;
;repeat
;
;add count to sum;
;
;add 3 to count;
;
;until (count > 50) and (sum ≥ 600);

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
		add cx, 3

		cmp cx, 50
		JNG inside
		cmp WORD PTR [sum], 600
		JNGE inside

		; Custom Instructions Ends

		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN