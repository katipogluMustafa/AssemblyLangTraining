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
			
			xor SI,SI
			xor DI,DI
			xor BX,BX
			xor ax,ax
			
			mov cx, 13
			
	basla:	mov al, d1[SI]
			cmp al, d2[DI]
			JGE etiket
			mov dSon[BX], al
			INC BX
			INC SI
	etiket: 
			mov al, d2[DI]
			mov dSon[BX], al
			INC DI	
			INC BX
			loop basla
			
SON:		RETF
MAIN		ENDP
mycs		ENDS
			END MAIN