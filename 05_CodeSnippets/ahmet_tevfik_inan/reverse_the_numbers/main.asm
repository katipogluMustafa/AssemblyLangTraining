; 16 Bit'lik bir sayının on altılık tabandaki ifadesindeki hanelerinin
; tersten yazılmasını sağlayan EXE tipinde program

SSEG SEGMENT PARA STACK 'STACK'
	DW 12 DUP(?)
SSEG ENDS
DSEG SEGMENT PARA 'DATA'
	ELEMAN DW 10
	DIZI DW 1234h, 2345h, 4567h, 5678h, 6789h, 789Ah, 89ABh, 9ABCh, 0ABCDh
DSEG ENDS

CSEG SEGMENT PARA 'CODE'
		ASSUME CS:CSEG, DS:DSEG, SS:SSEG
	MAIN PROC FAR

	push ds
	xor ax,ax
	push ax

	mov ax, DSEG
	mov ds, ax

	mov cx, 10
	LEA SI, DIZI

L:
	mov ax, [SI]

	xchg AL, AH
	push cx

	mov cl, 4
	ROR AL, CL
	ROR AH, CL
	mov [SI], AX
	ADD SI, 2

	pop cx
	LOOP L



	MAIN ENDP

CSEG ENDS
	 END MAIN
