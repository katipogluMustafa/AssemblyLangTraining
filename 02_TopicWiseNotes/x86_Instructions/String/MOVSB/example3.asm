; -------------------------------------------------------------------------
;
; 	*** MOVSB: MOVE STRİNG BYTE ***
;
; - DS:SI ikilisinin gösterdiği adresteki byte'ı
;	ES:DI ikilisinin gösterdiği adrese aktarır.
;
; - Bayrakları etkilemez.
; - Direction Flag(DF) nin değerine göre işlemin yönü değişir.
;		DF:1 ise Yüksek anlamlı bitten alçak anlamlıya doğru
;		DF:0 ise Alçak anlamlı bitten yüksek anlamlıya doğru
;
; -------------------------------------------------------------------------
mystack	SEGMENT PARA STACK 'STACK'
	DW 10 DUP(?)
mystack ENDS

mydata SEGMENT PARA 'DATA'
	dizi1	db	59h, 4Ch, 42h, 4Dh, 45h, 53h, 33h, 41h
	dizi2	db	8 dup(?)
	dizi3	db	8 dup(?)
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
		
		mov ax, mydata
		mov es, ax
		
		LEA SI, dizi1
		LEA DI, dizi2
		CLD				; Clear Direction Flag, DF = 0
		mov CX, 8		; 8 elemanı taşicaz
		REP MOVSB		; 8 kere MOVSB
		
		; SI da zaten dizi1 in adresi var
		LEA DI, [dizi3 + 7]
		STD				; Set Direction Flag, 	DF = 1 
		mov CX, 8
		REP MOVSB		; 8 kere mov işlemini tekrarla.
		
		; Custom Instructions Ends
		
		RETF

MAIN 	ENDP
mycode  ENDS
	    END MAIN