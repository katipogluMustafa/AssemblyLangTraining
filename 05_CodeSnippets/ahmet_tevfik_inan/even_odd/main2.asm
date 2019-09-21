myss SEGMENT PARA STACK 'stack'
	dw 12 dup(?)
myss ENDS

myds SEGMENT PARA 'data'

	DIZI 	DW 10, 21, 43, 71, 199, 67, 88, 234, 0, 467
	ELEMAN 	DW 10
	TEK_S 	DW 0
	CIFT_S 	DW 0

myds ENDS


mycs SEGMENT PARA 'code'
		ASSUME CS:mycs, DS:myds, SS:myss

	MAIN PROC FAR

		push ds
		xor ax,ax
		push ax

		mov ax, myds
		mov ds, ax

		mov cx, ELEMAN
		LEA SI, DIZI

	L:
		TEST WORD PTR[SI], 0001h
		jz cift

		INC TEK_S

cift: 	ADD SI, 2

		LOOP L

		mov ax, ELEMAN
		sub ax, TEK_S
		mov CIFT_S, ax

		 RETF
	MAIN ENDP

mycs ENDS
	 END MAIN