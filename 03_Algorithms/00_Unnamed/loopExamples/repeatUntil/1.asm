;sum := 0;
;
;count := 1;
;
;repeat
;
;add count to sum;
;
;add 1 to count;
;
;until (sum > 5000) or (count = 40);

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

		mov cx, 1	; cx = count

inside:

		add sum, cx
		inc cx

		cmp sum, 5000
		JG outside
		cmp cx, 40
		JNZ inside
outside:
		; Custom Instructions Ends

		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN