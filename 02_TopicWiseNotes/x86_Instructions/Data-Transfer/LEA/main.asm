; -------------------------------------------------------------------------
;
; 	*** LEA : Load Effective Address***
; 
; - istenen bellek alanın göreli konumu register'da oluşur.
; - SI,DI ve BX harici register kullanılamaz.
;
; src <-- Address of Dest
;
; -------------------------------------------------------------------------
mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	myVar	dw	0111011001110101B
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
		
		LEA SI, myVar
		
		xor ax,ax		; AX = 0
		
		mov AL, [SI]	; AL = 01110101B
		mov AH, [SI + 1]; AH = 01110110B
											; AX = 7675h
		mov BYTE PTR [SI + 0], 0FFh
		mov BYTE PTR [SI + 1], 0DDh
		
		mov dx, [SI]						; DX = 0DDFFh
		
		mov WORD PTR [SI], 0FFFFh
		
		mov cx, [SI]						; CX = 0FFFFh		
		
		
		; Custom Instructions Ends
		
		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN