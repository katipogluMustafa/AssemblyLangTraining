; Add Two Unsigned 32 bit numbers

mydata SEGMENT PARA 'data'
	num1	DD		12345678H
	num2	DD	   	7FFFF2F2H
	result  DQ		0
mydata ENDS

mystack SEGMENT PARA STACK 'stack'
	DW 10 DUP(?)
mystack ENDS

mycode SEGMENT PARA 'code'

	ASSUME CS:mycode, DS: mydata, SS: mystack

MAIN PROC FAR
		
		push ds
		xor ax,ax
		push ax
		
		mov ax, mydata
		mov ds, ax
		
		xor ax,ax
		
		lea SI, num1
		lea DI, num2
		lea BX, result
		
		CLC
		mov ax, [SI]
		add ax, [DI]
		mov [BX], ax 
		ADC WORD PTR [BX + 2], 0
		
		CLC
		mov ax, [SI + 2]
		add ax, [DI + 2]
		mov [BX + 2], ax
		ADC WORD PTR [BX + 4], 0
		RETF
MAIN   ENDP
mycode ENDS
	   END MAIN