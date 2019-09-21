; Kucukten buyuge sirali 2 diziyi (d1, d2) yine kucukten buyuge dogru sirali olacak
; bir dizide (dSon) birlestiriniz.

myss		SEGMENT PARA STACK 'stack'
			DW 20 DUP(?)
myss		ENDS
myds		SEGMENT PARA 'data'
n1			DW 7
n2			DW 6
d1			DB 7, 12, 64, 98, 104, 105, 125 ; hex -> 7h, 0Ch, 40h, 62h, 68h, 69h, 7Dh
d2			DB -70, -10, 9, 17, 68, 90 ; hex -> 0BAh, 0F6h, 9h, 11h, 44h, 5Ah
dSon		DB 13 DUP(?) ; hex -> 0BAh, 0F6h, 7h, 9h, 0Ch, 11h, 40h, 44h, 5Ah, 62h, 68h, 69h, 7Dh olmasi beklenir
myds		ENDS
mycs		SEGMENT PARA 'code'
			ASSUME CS:mycs, DS:myds, SS:myss
MAIN		PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, myds
			MOV DS, AX
			
			XOR BX, BX			;n3 icin
			XOR SI, SI			;i icin
			XOR DI, DI			;j icin
			
don:		CMP SI, n1
			JAE atla
			CMP DI, n2
			JAE atla
			MOV AL, d1[SI]
			MOV AH, d2[DI]
			CMP AL, AH
			JL Jd1
			MOV dSon[BX], AH
			INC DI
			JMP ortak
Jd1:		MOV dSon[BX], AL
			INC SI
ortak:		INC BX
			JMP don
			
atla:		CMP DI, n2
			JE Ld1
			
			MOV CX, n2
			SUB CX, DI		
			
L1:			MOV AL, d2[DI]		;k icin
			MOV dSon[BX], AL 
			INC BX
			INC DI
			LOOP L1
			JMP SON

Ld1:		MOV CX, n1
			SUB CX, SI		
			
L2:			MOV AL, d1[SI]		;k icin
			MOV dSon[BX], AL
			INC BX
			INC SI
			LOOP L2

SON:		RETF
MAIN		ENDP
mycs		ENDS
			END MAIN