;carpimda dx:ax carpimin dusuk anlamlý wordu ax te
;yuksek anlamli wordu dx te olusur
ortaksg     SEGMENT PARA 'kod'
            ORG 100H
			ASSUME ss:ortaksg,ds:ortaksg,cs:ortaksg
ANA         PROC NEAR
         
		XOR DX,DX
        MOV AX, WORD PTR [SAYI1]
        MOV BX, WORD PTR [SAYI2]	
        MUL BX		
        MOV WORD PTR[CARPIM],AX
		MOV WORD PTR[CARPIM+2],DX
		
		XOR DX,DX
		MOV AX,WORD PTR[SAYI1+2]
		MUL BX
		ADD WORD PTR[CARPIM+2],AX
		ADC WORD PTR[CARPIM+4],0
		ADD WORD PTR[CARPIM+4],DX
		ADC WORD PTR[CARPIM+6],0

		XOR DX,DX
		MOV BX, WORD PTR[SAYI2+2]
		MOV AX, WORD PTR[SAYI1]
		MUL BX
		ADD WORD PTR[CARPIM+2],AX
		ADC WORD PTR[CARPIM+4],0
		ADD WORD PTR[CARPIM+4],DX
		ADC WORD PTR[CARPIM+6],0
		
		XOR DX,DX
		MOV AX, WORD PTR[SAYI1+2]
		MUL BX
		ADD WORD PTR[CARPIM+4],AX
		ADC WORD PTR[CARPIM+6],0
		ADD WORD PTR[CARPIM+6],DX
		

        RET
ANA     ENDP
SAYI1   dd 0FFFFFFFFH
SAYI2   dd 0FFFFFFFFH
CARPIM  dq 0H
ortaksg ENDS			
        END ANA
