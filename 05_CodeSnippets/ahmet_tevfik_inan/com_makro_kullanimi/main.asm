CODESG SEGMENT PARA 'CODE'
		ORG 100h
		ASSUME CS:CODESG, DS:CODESG, SS:CODESG, ES:CODESG

SIL		MACRO
		mov CX, 0000H	; Ekranın sol üst köşesi satır/sütun adresi
		mov DX, 184FH 	; Ekranın sağ alt köşesi satır/sütun adresi
		mov BX, 07h 	; öznitelik değeri(attribute byte)
		mov AX, 0600h   ; AH = 06H pencereyi yukarı kaydırma
		INT 10h 		; 10h no'lu interrupt'i çağırır
		ENDM

YAZDIR MACRO text

		LEA DX, text
		mov ah, 09h
		INT 21h

		ENDM

MAIN PROC NEAR
		SIL
		YAZDIR MESAJ
		RET
MAIN   ENDP
	MESAJ DB 'Ekran silindi ve bu mesaj yazildi...', '$'
CODESG ENDS
	   END MAIN