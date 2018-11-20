; -------------------------------------------------------------------------
;
; 10 adet word tipinde elemanı olan bir dizi elemanlarının binary gösteriminde
; en çok 1 barındıran elemanın adresini bulan ve bunu bellek üzerindeki bir
; değişkende saklayan EXE Tipi Program
;
; -------------------------------------------------------------------------

myss SEGMENT PARA STACK 'STACK'
	dw 32 dup(?)
myss ENDS

myds SEGMENT PARA 'DATA'
	eleman  dw 10
	dizi	dw 88h,45h,71h,77h,63h,0AAh,56h,12h,92h,0BFh
	yer		dw ? 
myds ENDS

mycs SEGMENT PARA 'CODE'
	ASSUME CS:mycs, SS:myss, DS:myds
MAIN PROC FAR
	push ds
	xor ax, ax
	push ax
	
	mov ax, myds
	mov ds, ax
	
	xor SI,SI		; index for the dizi
	xor dx,dx 		; MAX
	mov cx, eleman
l1:	
	push cx	
	xor bx,bx		; X
	xor ax,ax 		; Temp
	
	mov bx, 0FFFFh
	and bx, dizi[SI]
	
	push dx
	mov cx, 16
l2:
	mov dx,1
	AND dx,bx		; 1 & x
	
	cmp dx, 1
	jz EL2
	INC AX
EL2:	
	SHR bx, 1
	loop l2
	pop dx
	
	cmp ax, [yer]
	JB EL1
	lea DI, dizi
	add DI, SI
	mov yer, DI
	xor DI,DI
EL1:	
	ADD SI, 2
	pop cx
	loop l1
		

	RETF
MAIN ENDP
mycs ENDS
	 END MAIN