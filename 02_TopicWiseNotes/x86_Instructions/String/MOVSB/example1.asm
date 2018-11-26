my_ss SEGMENT PARA STACK 'STACK'

	dw 20 dup(?)

my_ss ENDS

my_ds SEGMENT PARA 'DATA'
	eskiyer DB 10,55,7,5,6,1,4
	yeniyer DB 7 dup(?)

my_ds ENDS

my_cs SEGMENT PARA 'CODE'
	ASSUME CS:my_cs, DS:my_ds, SS:my_ss

MAIN PROC FAR
	push ds
	xor ax,ax
	push ax

	mov ax, my_ds
	mov ds, ax

	mov ax, my_ds
	mov es, ax

	LEA SI, eskiyer
	LEA DI, yeniyer
	mov cx, 7
	CLD
	REP MOVSB


RETF
MAIN  ENDP
my_cs ENDS
	  END MAIN