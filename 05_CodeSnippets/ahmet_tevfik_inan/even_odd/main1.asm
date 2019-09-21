mystack SEGMENT PARA STACK 'my_stack'
	dw 12 dup(?)
mystack ENDS

mydata SEGMENT PARA 'my_data'

	DIZI 	DW 10, 21, 43, 71, 199, 67, 88, 234, 0, 467
	ELEMAN 	DW 10
	TEK_S 	DW 0
	CIFT_S 	DW 0

mydata ENDS

mycode SEGMENT PARA 'my_code'
		ASSUME CS:mycode, SS: mystack, DS: mydata

	MAIN PROC FAR

		push ds
		xor ax,ax
		push ax

		mov ax, mydata
		mov ds, ax

		mov cx, ELEMAN
		xor SI, SI
	L:
		MOV AX, DIZI[SI]
		SHR AX, 1
		ADC TEK_S, 0
		ADD SI, 2

		LOOP L

		mov AX, ELEMAN
		sub AX, TEK_S
		mov CIFT_S, AX
        RETF
	MAIN ENDP

mycode ENDS
	   END MAIN