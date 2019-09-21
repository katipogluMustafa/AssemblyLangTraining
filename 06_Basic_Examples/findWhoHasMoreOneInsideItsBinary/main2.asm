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

		xor DI,DI			; Max index
		xor SI,SI			; dizi index
		xor dx,dx
		
		mov cx,eleman
lD:
		push cx
		
		mov AX,dizi[SI]
		xor dl,dl			; for couting num of 1s
		mov cx,16			
LI:
		SHR AX,1
		ADC DL,0
		loop LI
		
		cmp DH,DL			; if dh >= dl , dl is empty
		JGE next
		mov dh,dl			; dh = current max num of 1 inside num
		mov DI, SI			; max indis = current SI
next: 
		POP cx
		add SI, 2
		loop LD
		mov yer, DI
	

	RETF
MAIN ENDP
mycs ENDS
	 END MAIN