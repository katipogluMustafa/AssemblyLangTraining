my_ss SEGMENT PARA STACK 'STACK'
	dw 32 dup(?)
my_ss ENDS

my_ds SEGMENT PARA 'DATA'
CR		EQU		13
LF 		EQU 	10
MSG1 	DB 		'Dizinin Boyutu[0-100]: ', 0
MSG2 	DB  	CR, LF, 'Dizinin Elemanlari: ',0
N_HATA  DB  	CR, LF, 'Byte tipinde eleman girmelisiniz! , [-128 ~ 127] ', LF, LF,0
INFO 	DB  	CR, LF, 'Her Elemani girdikten sonra entera basiniz... ',LF,LF,0
HATA 	DB  	CR, LF, 'Dikkat !!! Sayi vermediniz yeniden giris yapiniz.!!! ',0
G_INF   DB 		CR, LF, 'Girdi Dizisi: ',LF,0
O_INF   DB      CR, LF, LF, 'Cikti Dizisi: ',LF,0
SONUC 	DB  	CR, LF, 'Toplam ',0
BOYUT   DB 		?
SAYI2   DW 		?
dizi    db      100 dup(?) 			; sona NULL amaçlı 0 koyucaz ondan 100 + 1 elemanlı.
my_ds ENDS

my_cs SEGMENT PARA 'CODE'
		ASSUME CS:my_cs, DS: my_ds, SS:my_ss

MAIN PROC FAR
	; Dönüş değerlerini yığında sakla
	push ds   					; işletim sisteminin kaldığı segment değerini stack'e at
	xor ax,ax
	push ax 					; işletim sisteminin kaldığı offset değerini stack'e at

	; my_ds' ye erişebilmek için
	mov ax, my_ds
	mov ds, ax 					; DS'ye my_ds'yi at ki data segmentimiz tanımlanmış olsun.

		lea ax,MSG1
		CALL PUT_STR
		CALL GETN


		mov BOYUT, al  	 			; Dizinin boyutunu BOYUT'un içine at

		xor cx,cx
		mov cl, BOYUT 				; dizinin boyutunu cx'e at

		lea ax, INFO
		CALL PUT_STR

		lea ax, MSG2
		CALL PUT_STR

		lea ax, dizi
		CALL GET_DIZI 				; dizinin elemanlarını okur ve memory'ye yerleştirir.


		lea ax, G_INF
		CALL PUT_STR

		lea ax, dizi
		push ax 					; Dizinin adres bilgisini stack üzerinden PUT_DIZI'ye yolla
		xor ax, ax
		mov al, BOYUT
		push ax 					; BOYUT bilgisini stack üzerinden PUT_DIZI'ye yolla
		CALL PUT_DIZI 				; dizinin elemanların ekrana yazdırır.

		; **BASLA** CALL quickSort

		lea ax, dizi
		mov SI , 0

		xor cx,cx  		; cx temp here.
		mov cl, BOYUT
		mov DI , cx  	; DI = BOYUT
		dec DI  		; DI = BOYUT - 1

		CALL quickSort

		; **BITIS** CALL quickSort

		lea ax, O_INF
		CALL PUT_STR

		lea ax, dizi
		push ax 					; Dizinin adres bilgisini stack üzerinden PUT_DIZI'ye yolla
		xor ax, ax
		mov al, BOYUT
		push ax 					; BOYUT bilgisini stack üzerinden PUT_DIZI'ye yolla
		CALL PUT_DIZI 				; dizinin elemanların ekrana yazdırır.


	  RETF
MAIN  ENDP

;	Klavyeden 1 karakter okur
;	Sonuc Al'de tutulur

GETC PROC NEAR

 	mov ah, 1h
	INT 21h

	RET
GETC ENDP


; Ekrana 1 karakter yazar
; AL'deki karakteri ekrana yazar.
PUTC PROC NEAR
		PUSH AX 	; AX'in eski değerini koru
		PUSH DX 	; DX'in eski değerini koru

		MOV DL, AL 	; ekrana basılcak karakteri DL'ye at
		MOV AH, 2	; 2 numaralı fonksiyonu
		INT 21h		; INT 21H'den çağır

		POP DX 		; DX'in eski değerini dx'e koy
		POP AX 		; AX'in eski değerini ax'e koy
		RET
PUTC ENDP

; Klavyeden alınan sayiyi okur, sonucu AX'de tutar.
; DX: sayinin işaretli olup/olmadığını belirler. 1(+), -1(-) demektir.
; BL: hane sayisi
; CX: okunan sayının işlenmesi sırasındaki ara değer
; AL: klavyeden okunan karakter

GETN PROC NEAR
		push BX 	; BX'in eski değerini koru
		push CX		; CX'in eski değerini koru
		push DX 	; DX'in eski değerini koru
G_S:
		mov DX, 1 	; sayi pozitif olsun
		xor BX, BX  ; hane sayisi = 0
		xor CX, CX  ; ara değer = 0
NEW:
		call GETC  	; klavyeden okunan değeri al'ye al
		cmp AL, CR  ; Enter tuşuna basılmış mı
		JE FIN_READ ; Enter'lanmışsa okumayı bitir.
		cmp AL, '-' ; Al, '-' mi geldi
		JNE CTR_NUM ; eğer - değilse sayıyı kontrol etmeye git
NEGATIVE: 			;
		mov dx, -1  ; - basıldı, gelicek sayı negatif
					; dx = -1 yaptık ki
		 			; sayının negatif olduğu belli olsun
		JMP NEW  	; yeni haneyi al

CTR_NUM:
		cmp AL, '0' ; verilen rakam 0-9 arasındamı kontrol edelim
		JB ERROR
		cmp AL, '9'
		JA ERROR    ; Eğer değilse Hata verelim.

		sub AL, '0' ; örneğin 5 girildiyse bu aslında ascii '5'tir.
					; gerçek değerini bulmak için '5' - '0' yaparsak
					; sayının gerçek değerini bulmuş oluruz.
		mov BL, AL  ; Elde edilen rakamı BL'ye at
		mov AX, 10
		push DX 	; mul sonucu dx:ax te oluşucağından dx'i koru
		MUL CX  	; dx:ax = Aradeğer(CX) * 10
		POP DX 		; dx'in eski değerini al
		mov CX, AX  ; CX := Aradeğer(CX) * 10
		ADD CX, BX  ; DX := Aradeğer(CX) * 10 + Yeni Rakam
		JMP NEW   	; Klavyeden yeni basılan değeri al

ERROR:
		lea AX, HATA
		call PUT_STR 		; Hata mesajını göster
		jmp G_S 			; okunanları unut yeniden başla, hata vardı çünkü.

FIN_READ:
		mov AX, CX 	; Sonucu AX'e al
		cmp DX, 1
		JE FIN_GETN ; eğer sonuç pozitifse sona git
		NEG AX 		; eğer sonuç negatif ise, sayının negatifini dön

FIN_GETN:
		pop DX 		; DX'in eski değerini dx'e koy
		pop CX 		; CX'in eski değerini cx'e koy
		pop DX 		; DX'in eski değerini dx'e koy
		RET
GETN ENDP

; AX'te bulunan sayıyı hane hane ekrana yazdırır.
; CX := 10, haneleri 10'a bölerek bulmak için.
; --------------- BAK BURAYA --------------
PUTN PROC NEAR
		PUSH CX 	; CX'in eski değerini koru
		PUSH DX 	; DX'in eski değerini koru
 		XOR DX, DX  ; DX = 0
		PUSH DX 	; stack'e ilk önce 0 atıyoruz ki işlemlerin sonunda
					; sayının kaç hane olduğunu bilmediğimizden onu alana kadar devam edicez.

		MOV CX, 10 	; DX := 10, her haneyi 10'a bölerek bulmak için
		cmp AX, 0   ; Verilen sayı 0dan büyük eşit mi
		jge F_Dig  	; Kaç hane olduğunu hesapla.

		neg ax 		; 0'dan küçükse sayı negatifini al
		push ax 	; AX'in değerini koru
		mov al, '-'
		call PUTC   ; negatif olduğundan ekrana - koy
		POP AX      ; AX'in değerini geri al

F_Dig:
		DIV CX 		; DX:AX'i 10'a böl(DX = 0), bölüm AX, kalan DX
		ADD DX, '0' ; DX'te oluşan kalan rakamına '0' ekleyerek ASCII'deki rakam haline dönüştür.
		PUSH DX    	; ve yığında sakla.
		XOR DX, DX  ; DX'i geri sifirla bölmenin son 16 biti için
		cmp AX, 0   ; bolen 0 ise islem bitmiştir.
		JNE F_Dig   ; tekrar işlemi yap

D_L: 				; yazılacak tüm haneler yığında
					; en anlamlı en üstte, en az anlamlı en altta
					; onun alıntada sona vardığımızı anlamak için koyulan 0 değeri
		POP AX  	; Sırasıyla stack'den değerleri alalım.
		cmp AX, 0   ; sona gelmişsen, [sona 0 koymuştuk anlamak için stackte]
 		je E_D_L    ; Fonksiyondan çık
 					; sona gelmemişsek sayıyı ekrana yazdır
		call PUTC
		jmp D_L     ; işleme devam

E_D_L:
		POP DX 		; DX'in eski değerini al
		POP CX 		; CX'in eski değerini al
		RET
PUTN ENDP


; AX'TE adresi verilen sonunda 0 olan diziyi karakter karakter ekrana yazdırır.
PUT_STR PROC NEAR
		PUSH BX 			  	; BX'i indis olarak kullanıcaz eski değerini koru
		mov BX, AX 			  	; BX'e elimize gelen dizinin adresini at
		MOV AL, BYTE PTR[BX]	; dizinin karakterini AL'ye al
PS1:
		cmp AL, 0 				; Sona geldik mi ?
		JE PF1					; sona geldiysek fonksiyondan çık
								; Sona gelmediysek
		CALL PUTC 				; Karakteri ekrana bas
		INC BX 					; BX'i bir sonraki karakteri gösterir hale getir.
		MOV AL, BYTE PTR [BX] 	; AL'ye bir sonraki karakteri at
		JMP PS1  				; sona gelene kadar tekrarla.

PF1:
		POP BX 					; BX'in eski değerini geri BX'e koy
		RET
PUT_STR ENDP


; Byte türünden girdi diziyi okur memoryde AX ile verilen dizinin içine koyar.
; Tüm registerların değerlerini korur.
GET_DIZI PROC NEAR
		push ax
		push si
		push cx

		xor cx, cx
		mov cl, BOYUT

		mov SI, ax 				; Dizinin adresini SI'ya al

L1:
		CALL GETN 				; Aralarında boşluk olan sayı oku GETN ile
		cmp ax, 127
		jg N_Error
		cmp ax, -128
		JL N_Error

		; if we come here then the input that has been given to us < 127 and >-128 and so it is a byte just like we want.
		mov [SI], al 			; Sayıyı SI ile gösterilen diziye at.
		INC SI  				; SI'yı bir sonraki dizi indexini gösterir hale getir.
		loop L1
		jmp END_OF_FONK			; Buraya geldiysek, looptan rahatlıkla çıkmışızdıri fonksiyondan yavaştan çık.

N_Error:
		push ax
		lea ax, N_HATA
		CALL PUT_STR
		pop ax
		jmp L1

END_OF_FONK:

		pop cx
		pop si
		pop ax
		RET
GET_DIZI ENDP

; Byte türünden diziyi ekrana basar, elemanların arasında boşluk olacak şekilde.
; STACK'den önce dizinin adresini, sonra dizinin boyut bilgisini alır.
PUT_DIZI PROC NEAR
		push BP
		mov BP, SP
		push AX
		push CX
		push SI
		push dx

		mov SI, [BP + 6] 				; Byte türünden dizinin adresini SI'ya at
		mov CX, [BP + 4]				; Dizi boyutun CX'e ata

Yazdir:
		xor ax, ax
		mov al, [SI] 					; AX'e yazdırılmak istenen dizinin elemanının at
		cmp al, 0
		jnl P_Devam
		xor dx,dx
		mov dx, 256
		sub dx, ax
		mov ax, dx
		neg ax
P_Devam:
		CALL PUTN 						; AX'tekini ekrana yazdır.
		mov al, ' '
		CALL PUTC
		INC SI  						; SI dizinin bir sonraki elemanını gösteriyor.
		loop Yazdir

		pop dx
		pop SI
		pop CX
		pop AX
		pop BP
		RET 4 							; Stackdeki 2 parametri yok sayar dönerken(4 byte)
PUT_DIZI ENDP


; AX, dizi adresi
; SI, 1. eleman indis
; DI, 2. eleman indis
SWAP PROC NEAR
	push bx
	push ax
	push SI
	push DI

	mov bx, ax

	mov al, [BX + SI]
	xchg al, [BX + DI]
	mov [BX + SI], al

	pop DI
	pop SI
	pop ax
	pop bx
	ret
SWAP ENDP


; AX, dizinin adresi
; SI, dizinin ilk indisi
; DI, dizinin son indisi
quickSort PROC NEAR
		cmp si,di 			; başlangıç indisi, son indisten büyük ise boş return yap.
		jge retNothing

		push SI
		push DI

		; AX = dizi, SI = bas, DI = son
		CALL PickPivot
		; BX = BL = pivot'un indisi şuan
		; AX = dizi, SI = bas, DI = son, BX = pivot
		CALL partition
		; BX = newPivot indisi şuan

		; **BASLA** quickSort(dizi, bas, newPivot - 1)
		mov DI, BX 		; DI = newPivot
		dec DI  		; DI = newPivot - 1

		; AX = dizi, SI = baş , DI = newPivot - 1
		CALL quickSort
		pop di
		pop si
		; **BITIS** quickSort(dizi, bas, newPivot - 1)


		; **BASLA** quickSort(dizi, newPivot + 1, son)
		mov SI, BX
		inc SI 			; SI = newPivot + 1
		; AX = dizi, SI = newPivot + 1, DI = son
		CALL quickSort
		; **BITIS** quickSort(dizi, newPivot + 1, son)

retNothing:
		  ret
quickSort ENDP

; AX, dizinin adresi
; SI, dizinin ilk indisi
; DI, dizinin son indisi
; BX, pivot position
; BX, Returns new pivot position
partition PROC NEAR
		push cx
		push dx
		push SI
		push DI

		;dx'e pivot'un değerini at
		xor dx,dx
		push SI
		mov SI, AX
		mov dl, [SI + BX] 	; dx = [pivot] = pivotValue
		pop SI

		; Eğer ilk eleman pivot ise devam et

		cmp SI, BX 		; cmp bas, pivotPosition
		JE devam

		; Eğer ilk eleman pivot değil ise
			; ilk elemana pivot'u koy.

		; swap( dizi, SI, BX )
		; dizinin ilk elemnına pivot ı koy.
		push DI
		mov DI, bx
		CALL SWAP
		pop DI

devam:
		xor cx, cx
		mov cx, DI
		sub cx, SI 		; cx = son - ilk

		push SI

		mov BX, AX 		; BX = dizinin bas adresi

		; DI nın işi bitti
		mov DI, SI  	; DI artık newPivot
		inc DI 			; DI = bas + 1
PL1:
		inc SI  		; i = bas + 1'den sona kadar
		cmp [BX + SI], dl ; cmp dizi[i], pivotValue
		jg PL2
		; swap(dizi, i , newPivot)
		; AX = dizi, SI = i, DI = newPivot
		CALL SWAP

		inc DI 	 		; ++newpivot
PL2:
		loop PL1

		dec DI

		; AX = dizi, SI = bas, DI = newPivot
		pop SI
		CALL SWAP

		mov BX, DI  	; BX = newPivot

		; Çıkarken AX'aynı zaten push-pop yapmadık ondan
		; BX üzerindne pivot dönüyoruz o değişiyor her türlü
		; diğerlerini push-pop ile koruduk.
		pop DI
		pop SI
		pop dx
		pop cx
		  ret
partition ENDP




; AX, dizi adresi
; SI, dizinin ilk indisi
; DI, dizinin son indisi
; Returns From BL = BX
PickPivot PROC NEAR
	push DI
	push SI
	push ax
	push cx
	push dx


	mov bx, ax 			; bx = ax
	mov dx, SI 			; dx = bas
	add dx, DI 			; dx = son
	shr dx, 1			; dx = (bas + son) >> 1
						; dx = ortanca indis
	xor cx, cx
	mov cl, [bx + SI] 	; CL = x = dizi[bas]

	mov ch, [bx + DI]   ; ch = y = dizi[son]

	push SI
	mov SI, dx
	mov al, [bx + SI] ; al = z = dizi[ortanca]
	pop SI

	cmp cl, ch   		; cmp x, y
	jg otherControls

	cmp ch, al 			; cmp y, z
	jl returnMiddle

	cmp cl, al
	jl returnSon

	; buraya kadar gelebildiyse
	jmp returnBas

otherControls:
	cmp ch, al 			; cmp y,z
	jg returnMiddle

	cmp cl, al 			; cmp x, z
	jg returnSon

	; Buraya kadar geldiysek
	jmp returnBas

returnMiddle:
	xor bx, bx
	mov bl, dl
	jmp Cikis
returnBas:
	xor bx, bx
	mov cx, SI
	mov bl, cl
	jmp Cikis
returnSon:
	xor bx, bx
	mov cx, DI
	mov bl, cl
	jmp Cikis

Cikis:

	pop dx
	pop cx
	pop ax
	pop SI
	pop DI
		  ret
PickPivot ENDP



my_cs ENDS
	  END MAIN