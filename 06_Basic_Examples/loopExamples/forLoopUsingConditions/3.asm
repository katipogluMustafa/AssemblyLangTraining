;sum := 1000;
;
;for count := 100 downto 50 loop
;
;subtract 2*count from sum;
;
;end for;

mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	sum dw 1000
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

strt:	cmp cx, 50
		JZ son

		xor ax,ax
		xor dx,dx

		mov ax, sum
		mov bx, 2
		mul bx

		sub sum, ax
		dec cx

		jmp strt
son:


		; Custom Instructions Ends

		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN