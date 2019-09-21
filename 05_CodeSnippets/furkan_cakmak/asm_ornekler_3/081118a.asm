;280 ogrencinin oldugu bir sinifta yil sonu notu esik degerin altinda olan ogrenciler dersten kalmaktadir. 
;Esik degerin ustunde notu olan ogrencilerin notlarinin ortalamasi bulunur. 
;Bu ortalamadan yuksek notu olan ogrenciler dersten basarili ogrenciler, 
;dusuk olanlar ise butunleme sinavina girmesi gereken ogrencilerdir. 
;Bu dersten kalan, bütünleme sinavina girecek ve basarili olan ogrencilerin sayilarini bulunuz.


datasg		SEGMENT PARA 'veri'
;notlar		DB 280 DUP(?)
;ogr_say	DB 280
notlar		DB 25,94,30,60,75,89,11,11,66,6,96,40,17,95,10,77,9,97,52,47,38,19,24,16,66,60,96,47
ogr_say		DW 28
kalan		DW 0
basarili	DW 0
butunleme	DW 0
esik		DB 40
topNot		DW ?
datasg		ENDS
stacksg		SEGMENT PARA STACK 'yigin'
			DW 20 DUP(?)
stacksg		ENDS
codesg		SEGMENT PARA 'kod'
			ASSUME DS:datasg, CS: codesg, SS:stacksg
ANA			PROC FAR
			
			PUSH DS
			XOR AX, AX
			PUSH AX
			
			MOV AX, datasg
			MOV DS, AX
			
			XOR SI, SI
			MOV CX, ogr_say
			
L1:			MOV AL, notlar[SI]
			CMP AL, esik
			JAE esikustu
			INC kalan
			JMP d1
esikustu:	CBW
			ADD topNot, AX
d1:			INC SI
			LOOP L1			
			
			MOV CX, ogr_say
			SUB CX, kalan
			
			XOR DX, DX
			MOV AX, topNot

			DIV CX
			
			XOR SI, SI
			MOV CX, ogr_say
			
L2:			MOV AH, notlar[SI]
			CMP AL, AH
			JBE gecti
			CMP AH, esik
			JB kaldi
			INC butunleme
			JMP kaldi
gecti:		INC basarili
kaldi:		INC SI
			LOOP L2
			RETF
ANA			ENDP
codesg		ENDS
			END ANA