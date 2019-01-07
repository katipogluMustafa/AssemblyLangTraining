;n elemanli (n <= 250) word buyuklugunde pozitif sayilardan olusan bir dizide
;tek ve cift sayilarin ortalamasini bulan asm kodunu yaziniz.
stackseg 	SEGMENT PARA STACK 'stack'
			DW 20 DUP(?)
stackseg 	ENDS
dataseg 	SEGMENT PARA 'data'
n	 		DW 10 
dizi		DW 7FFFh, 7AB2h, 70ABh, 7111h, 71FAh, 7232h, 7AF8h, 78C6h, 753Dh, 70E0h
			  ;32767, 31410, 28843, 28945, 29178, 29234, 31480, 30918, 30013, 28896
tek_top		DD 0
cift_top	DD 0
tek_say		DW 0
cift_say	DW 0
tek_ort		DW ?
cift_ort	DW ?
dataseg 	ENDS
codeseg		SEGMENT PARA 'code'
			ASSUME CS: codeseg, DS: dataseg, SS: stackseg
ANA	 		PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, dataseg
			MOV DS, AX
			
			MOV CX, n
			LEA SI, dizi
don:		MOV AX, [SI]
			TEST AX, 0001h  
			JZ cift_label
			ADD WORD PTR [tek_top], AX
			ADC WORD PTR [tek_top+2], 0
			INC tek_say
			JMP artir
cift_label:	ADD WORD PTR [cift_top], AX
			ADC WORD PTR [cift_top+2], 0
			INC cift_say
artir:		ADD SI, 2
			LOOP don
			
			MOV DX, WORD PTR [cift_top+2]
			MOV AX, WORD PTR [cift_top]
			DIV cift_say
			MOV cift_ort, AX
			
			MOV DX, WORD PTR [tek_top+2]
			MOV AX, WORD PTR [tek_top]
			DIV tek_say
			MOV tek_ort, AX
			
			RETF
ANA			ENDP
codeseg 	ENDS
			END ANA