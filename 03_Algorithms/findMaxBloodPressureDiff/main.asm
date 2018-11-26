; -------------------------------------------------------------------------
;
;  Bir hastanın 10 gün boyunca ölçülmüş büyük ve küçük tansiyon değerleri
; verilmiş olsun. Büyük ile küçük tansiyon değerleri arasındaki farkın en
; fazla olduğu günü bulan ve GUN isimli değişkende saklayan program
;
; BYK : Büyük tansiyon değerleri
; KCK : Küçük tansiyon değerleri
;
; -------------------------------------------------------------------------

myss SEGMENT PARA STACK 'STACK'
	dw 32 dup(?)
myss ENDS

myds SEGMENT PARA 'DATA'
	BYK 	DB 12, 13, 14, 15, 15, 16, 13, 12, 10, 9
	KCK 	DB 5, 6, 7, 8, 9, 3, 2, 5, 5, 6
	GUN 	DW 0
	ELEMAN 	DW 10
myds ENDS

mycs SEGMENT PARA 'CODE'
	ASSUME CS:mycs, SS:myss, DS:myds
MAIN PROC FAR
	push ds
	xor ax, ax
	push ax
	
	mov ax, myds
	mov ds, ax
	
	xor si,si
	xor di,di
	
	xor ax,ax		; AL : MAX Diff
	mov al, BYK[SI]
	sub al, KCK[DI]
	
	mov cx, ELEMAN
	DEC cx
	
	xor dx, dx		; BL : Temp
l1: 
	INC SI			
	INC DI
	
	mov dl, BYK[SI]
	sub dl, KCK[DI]
	
	cmp dl, al
	jng EN
	mov al, dl		; move the new max diff into AL
	
	mov GUN, SI
	
EN:	
	XOR dx,dx		; zero out the BX
	loop l1
	
		

	RETF
MAIN ENDP
mycs ENDS
	 END MAIN