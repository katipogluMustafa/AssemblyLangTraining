	PAGE 60,80
	TITLE 16 BITLIK POZITIF IKI SAYININ TOPLANMASI
myss SEGMENT STACK PARA 'stack'
     DW 10 DUP (?)
myss ENDS

myds SEGMENT PARA 'data'
	ASAYISI DW 1234H
	BSAYISI DW 0ABCDH
	TOPLAM  DD 0H
myds ENDS

mycs SEGMENT PARA 'code'
		ASSUME SS: myss, DS: myds, CS: mycs

	 MAIN PROC FAR

		 PUSH DS
		 XOR AX, AX
		 PUSH AX

		 MOV AX, myds
		 MOV DS, AX

		 LEA SI, TOPLAM
		 MOV AX, ASAYISI
		 MOV BX, BSAYISI
		 ADD AX, BX
		 mov [SI], AX
		 ADC WORD PTR[SI + 2], 0

		 RETF
	MAIN ENDP

mycs ENDS
	 END MAIN