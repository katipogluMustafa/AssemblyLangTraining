; 32 bit subtraction
; -------------------------------------------------------------------------
;
; 	*** SUB : Subtraction ***
;
; - dest <-- dest - src
;
; - Operandlar aynı tipte olmalıdır.
; - OF, SF, ZF, AF, PF, CF i değiştirir.
;
; -------------------------------------------------------------------------
;
; 	*** SBB : Subtraction with borrow ***
;
; - dest <-- dest - src - CF
;
; - Operandlar aynı tipte olmalıdır.
; - OF, SF, ZF, AF, PF, CF i değiştirir.
;
; -------------------------------------------------------------------------
mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	num1	dd	594C42D4h
	num2	dd	45533341h
	fark    dd  0 
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
		mov ax, WORD PTR [ num1 + 0 ]
		mov bx, WORD PTR [ num1 + 2 ]
		
		sub ax, WORD PTR [ num2 + 0 ]
		SBB bx, 0
		
		mov WORD PTR [ fark + 0 ], ax
		
		mov ax, WORD PTR [ num2 + 2 ]
		sub bx, ax
		
		mov WORD PTR [ fark + 2 ], bx
		
		; Custom Instructions Ends
		
		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN