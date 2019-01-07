; 15 yasindan kucuk ve 50 yasindan buyuk 10 tane kisinin oldugu kuyruga yas kosulunu bozan 
; 11. kisi karismistir. Kuyruktaki tum kisilerin yaslari bilindigine gore, kuyruga sonradan
; karisan kisinin bastan kacinci sirada oldugunu bulunuz.
mys			SEGMENT PARA 'kod'
			ORG 100h
			ASSUME DS:mys, SS:mys, CS:mys
kaynak_nul	PROC NEAR
			XOR BX, BX
			MOV AL, k_esik
			MOV AH, b_esik
don:		CMP kuyruk[BX], AL
			JB sonraki
			CMP kuyruk[BX], AH
			JBE bulundu
sonraki:	INC BX
			JMP don
bulundu:	MOV indis, BL
son:		RET
kaynak_nul	ENDP
kuyruk		DB 14, 11, 54, 62, 11, 3, 8, 63, 81, 5, 16
k_esik		DB 15
b_esik		DB 50
indis		DB ?
mys			ENDS
			END kaynak_nul