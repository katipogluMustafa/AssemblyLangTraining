		INCLUDE silYazdir.mac
CODESG SEGMENT PARA 'CODE'
		ORG 100h
		ASSUME CS:CODESG, DS:CODESG, SS:CODESG, ES:CODESG
		
MAIN PROC NEAR
		SIL
		YAZDIR MESAJ
		RET
MAIN   ENDP
	MESAJ DB 'Ekran silindi ve bu mesaj yazildi...', '$'
CODESG ENDS
	   END MAIN