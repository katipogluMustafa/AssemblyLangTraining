; -------------------------------------------------------------------------
;
; 	*** ADD: Addition ***
;
; - dest <-- dest + src
;
; - Operandlar aynı tipte olmalıdır.
; - OF, SF, ZF, AF, PF, CF i değiştirir.
; -------------------------------------------------------------------------
mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	dizi	db	59h, 4Ch, 42h, 4Dh, 45h, 53h, 33h, 41h
	eleman  db  8
	toplam  dw  0 
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
		xor SI,SI
		xor ax,ax
		xor cx,cx
		mov cl, eleman
l1:		
		add al, dizi[SI]
		adc ah, 0
		INC SI
		loop l1
		
		mov toplam,ax
		
		; Custom Instructions Ends
		
		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN