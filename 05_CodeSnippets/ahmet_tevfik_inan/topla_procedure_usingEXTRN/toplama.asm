PUBLIC Toplama

CODESG SEGMENT PARA 'CODE'
		ASSUME CS:CODESG
Toplama PROC FAR
		
		XOR AX, AX
		ADD AL, BL
		ADD AL, BH
		ADC AH, 0
		
		RETF
Toplama ENDP
CODESG  ENDS
	    END