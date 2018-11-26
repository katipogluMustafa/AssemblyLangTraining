ortaksg SEGMENT PARA 'kod'
        ORG 100h
	ASSUME ss:ortaksg,ds:ortaksg,cs:ortaksg
ANA     PROC NEAR			
   
		MOV AX, WORD PTR [sayi1]   ;8 clock cycle
		MOV CX, WORD PTR [sayi2]   ;8 clock cycle
		ADD AX,CX                  ;3 clock cycle 
		MOV WORD PTR [toplam],AX   ;9 clock cycle +EA clock cycle _EA is RAM speed
		MOV AX, WORD PTR [sayi1+2] ;8 clock cycle
		MOV CX,WORD PTR [sayi2+2]  ;8 clock cycle
		ADC AX,CX                  ;3 clock cycle
		MOV WORD PTR [toplam+2],AX ;9 clock cycle +EA clock cycle _EA is RAM speed
		ADC WORD PTR [toplam+4],0  ;17+EA
                                           ;73 clock cycle
        RET
ANA     ENDP
        sayi1 dd 0FFFFFFFFH
		sayi2 dd 0FFFFFFFFH
		toplam dq 0H
ortaksg ENDS
        END ANA
