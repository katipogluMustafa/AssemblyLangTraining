PUBLIC TOPLAMA
CODES SEGMENT PARA 'CODE'
		ASSUME CS:CODES

TOPLAMA PROC FAR

		XOR ax,ax
		ADD AL, BL
		ADD AL, BH
		ADC AH, 0

		RETF
TOPLAMA ENDP
CODES   ENDS
		END