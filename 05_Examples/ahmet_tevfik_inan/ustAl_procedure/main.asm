mystack SEGMENT PARA STACK 'stack'
	dw 10 dup(?)
mystack ENDS

mydata SEGMENT PARA 'data'

	SAYI 	DW 2
	UST  	DW 10
	SONUC 	DW 0

mydata ENDS

mycode SEGMENT PARA 'code'
		ASSUME CS:mycode, DS:mydata, SS:mystack

	MAIN PROC FAR
		push ds
		xor ax,ax
		push ax

		mov ax, mydata
		mov ds, ax

		mov cx, UST
		mov bx, SAYI
		CALL USTAL
		mov sonuc, ax
		RETF
	MAIN ENDP

	USTAL PROC NEAR
			MOV ax, 1
	L1: 	MUL BX
			LOOP L1
			RET
	USTAL ENDP

mycode    ENDS
		  END MAIN
