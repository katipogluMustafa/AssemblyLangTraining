;dosboxta -u komutu kodunuzu gosterir
;kodunuzu ilerletmis olmadiginizdan hemen sonucu goremezsiniz
;sonucu gormek icin trace atmaya devam edin
ortaksg    SEGMENT PARA 'kod'
           ORG 100h
		   ASSUME ss:ortaksg,ds:ortaksg,cs:ortaksg
Basla:	   JMP ANA
		   sayi1 dd 0FFFFFFFFh
		   sayi2 dd 0FFFFFFFFh
		   toplam dq 0
ANA         PROC NEAR
            LEA si,sayi1           ;2+EA
	    LEA di,sayi2           ;2+EA
	    LEA bx,toplam          ;2+EA
            MOV ax,[si]            ;8+EA
            MOV dx,[di]            ;8+EA
            ADD ax,dx              ;3
            MOV [bx],ax            ;9+EA
	    MOV ax,[si+2]          ;8+EA
	    MOV dx,[di+2]          ;8+EA
	    ADC ax,dx              ;3
	    MOV [bx+2],ax          ;9+EA
	    ADC WORD PTR [bx+4],0  ;17+EA
	                           ;79 clock cycle
           RET
ANA        ENDP
ortaksg    ENDS
           END Basla
