mycode SEGMENT PARA 'code'
	org 100h
	ASSUME CS:mycode, DS:mycode, SS:mycode, ES:mycode

data: jmp MAIN
	ELEMAN dw 10
	DIZI   dw -4, 23, 456, 4, 8, 67, -78, 9, -99, 256
	BYKSAY dw ?

	MAIN PROC NEAR
		mov cx, ELEMAN
		LEA SI, DIZI
		DEC CX
		mov ax, [SI]
	L:
		add SI, 2
		jg DEVAM
		mov ax, [SI]
	DEVAM: LOOP L
		mov BYKSAY, AX

	MAIN ENDP
mycode 	 ENDS
	     END data