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
		
		mov ax, WORD PTR [num1]
		add WORD PTR [result], ax
		
		CLC						; Clear Carry
		mov ax, WORD PTR [num2]
		add WORD PTR [result], ax
		adc WORD PTR [result + 2], 0
		
		CLC
		mov ax, WORD PTR [num1 + 2]
		add WORD PTR [result + 2], ax
		adc WORD PTR [result + 4], 0
		
		CLC
		mov ax, WORD PTR [num2 + 2]
		add WORD PTR [result + 2], ax
		adc WORD PTR [result + 4], 0
			
		
		RETF
MAIN   ENDP
mycode ENDS
	   END MAIN