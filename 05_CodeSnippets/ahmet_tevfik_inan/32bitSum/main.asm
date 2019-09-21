myss SEGMENT PARA STACK 'STACK'
	dw 10 dup(?)
myss ENDS

myds SEGMENT PARA 'DATA'

	ASAYISI DD 12345678H
	BSAYISI DD 9ABCDEF0H
	TOPLAM  DQ 0h

myds ENDS

mycs SEGMENT PARA 'CODE'
		ASSUME CS:mycs, DS:myds, SS:myss

	MAIN PROC FAR

	push ds
	xor ax,ax
	push ax

	mov ax, myds
	mov ds, ax

	LEA SI, ASAYISI
	LEA DI, BSAYISI
	LEA BX, TOPLAM

	mov ax, [SI]
	mov dx, [DI]
	add ax, dx
	mov [BX], ax

	mov ax, [SI + 2]
	mov dx, [DI + 2]
	ADC ax, dx
	mov [BX+2], AX
	ADC WORD PTR [BX + 4], 0

    RETF
	MAIN ENDP

mycs ENDS
	 END MAIN