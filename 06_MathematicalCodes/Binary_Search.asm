my_ss       SEGMENT PARA STACK 'yigin'
            dw 20 dup(?)
my_ss       ENDS
my_ds       SEGMENT PARA 'veri'
            n dw 5
			dizi db 25,34,67,78,92
			mark db 34             ;aranan not
			min dw 0               ;minimum indis degeri
			max dw 0               ;maksimum indis degeri
			mid dw 0               ;orta indis degeri
			here db "The Value Has Founded$"
			absent db "The Value Has Not Been Founded$"
my_ds       ENDS 
my_cs       SEGMENT PARA 'kod'
            ASSUME ss:my_ss,ds:my_ds,cs:my_cs
ANA         PROC FAR			
			
		    PUSH DS
		    XOR AX,AX
		    PUSH AX
		    MOV AX,my_ds
		    MOV DS,AX
		
			XOR BX,BX   ;dizimizin indisi olacak
			MOV CL,mark  ;cx i dongude kullanmayacagimiz icin aranan notu ona atiyorum
			MOV AX,n  ;maksimum indis AX te
			MOV DX,min   ;minimum indis DX te
whilee:     PUSH AX
			PUSH DX
            SUB AX,1
			CMP AX,DX 
			JNA cik
			POP DX      ;min indisi cagirdik
			POP AX      ;max indisi cagirdik
			PUSH AX
			PUSH DX
		    ADD AX,DX   ;AX te max ve min indis toplami var 
			SHR AX,1      ;toplam indisi yarýya boluyoruz, ax te mid indis olustu
            MOV BX,AX   ;orta indis degerini dizi indis degerine atiyoruz
			POP DX
			POP AX
			CMP CL,dizi[BX] ;orta indisteki dizi degeriyle aranan sayi karsilastiriliyor			
			JE bulcik
			JA mindegis; asagý koda inerse maxý degisecegiz
			MOV AX,BX   ;orta indisi maksimum yaptim
			JMP son
mindegis:   MOV DX,BX   ;orta indisi minimum yaptim
  	son:    JMP whilee
    cik:    MOV AH,09H
	        LEA DX,absent
	        INT 21H
			jmp bitir
 bulcik:    MOV AH,09H
            LEA DX,here
            INT 21H			
  bitir:    RETF
			
			
ANA    ENDP
my_cs  ENDS 
       END ANA			
