; Calculate n factorial

mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	n db 5
sonuc dd 0
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
		xor dx,dx
		
		mov ax, 1
		
		xor cx, cx
		mov cl, n
	l1:
	    mul cx
		loop l1
		
		mov WORD PTR [sonuc + 0], ax
		mov WORD PTR [sonuc + 2], dx
		
		; Custom Instructions Ends
		
		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN