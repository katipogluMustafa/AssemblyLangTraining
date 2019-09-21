; Calculate Number of Lower or Upper case character in a string

mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'

	myStr  db 'Mustafa Katipoglu$'
	n	   dw 18
lowerCount dw 0
upperCount dw 0
otherCount dw 0

mydata ENDS

mycode SEGMENT PARA 'CODE'

	ASSUME CS:mycode, DS:mydata, SS:mystack
	
MAIN	PROC FAR
		
		; For returning
		push ds
		xor ax,ax
		push ax
	
		; For defining data segment
		mov ax, mydata
		mov ds, ax
		
		; Custom Instructions Starts
		xor ax,ax
		mov cx, n
		lea SI, myStr
	l1:
        mov al, [SI]

		cmp al, 'a'
		JNGE else1
		cmp al, 'z'
		JNLE else1
		
		INC WORD PTR lowerCount
		JMP endofloop
		
  else1:
		cmp al, 'A'
		JNGE else2
		cmp al, 'Z'
		JNLE else2
		
		INC WORD PTR upperCount
		JMP endofloop
		
  else2:
		
		INC WORD PTR otherCount
endofloop:	
		INC SI
		loop l1
		
		; Custom Instructions Ends
		
		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN