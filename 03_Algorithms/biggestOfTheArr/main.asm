; Find the biggest number inside 10 number array.
myss SEGMENT PARA STACK 'STACK'
	dw 10 dup(?)
myss ENDS

myds SEGMENT PARA 'DATA'
	eleman dw 10
	dizi   dw -4,23,456,4,8,67,-78,9,-99,256
	BYKSAY dw ?
myds ENDS

mycs SEGMENT PARA 'CODE'
	   ASSUME CS:mycs, DS:myds, SS:myss

MAIN   PROC FAR
	push ds
	xor ax,ax
	push ax
	
	mov ax, myds
	mov DS,ax
	
	mov CX, eleman
	dec CX

	xor SI,SI
	LEA SI, dizi
	mov ax, [SI]

L1:	add SI,2
	cmp ax, [SI]
	jg dev
	mov ax, [SI]
dev:
	loop l1
	mov BYKSAY, AX

	 RETF

MAIN ENDP
mycs ENDS
	 END MAIN
