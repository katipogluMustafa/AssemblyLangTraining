; 1 yil suresince gunluk en dusuk hava sicakligi bilgileri bulunan bir dizide -20 nin altinda
; sicaklik degeri olup olmadigini bulunuz. 
;(Not: Dunya uzerinde olculmus en dusuk sicaklik: -90, en yuksek: 57 derecedir.)
codesg		SEGMENT PARA 'kod'
			ORG 100h
			ASSUME DS:codesg, SS:codesg, CS:codesg
basla:		JMP SICAKLIK
;n			DW 365
;dizi		DB 365 DUP(?)
n			DW 12
dizi		DB -12, -19, 13, 40, 32, 43, 56, -21, -3, 43, 12, -9
esik		DB -20
sonuc		DB ?
SICAKLIK	PROC NEAR
			XOR SI, SI
			MOV CX, n
			MOV AL, esik
don:		CMP SI, CX
			JAE yanlis
			CMP AL, dizi[SI]
			JG dogru
			INC SI
			JMP don
yanlis:		MOV sonuc, 0
			JMP son
dogru:		MOV sonuc, 1
son:		RET
SICAKLIK	ENDP
codesg		ENDS
			END basla