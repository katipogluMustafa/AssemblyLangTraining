			PUBLIC SAYveBOL
mycs		SEGMENT PARA PUBLIC 'code'
			ASSUME CS:mycs
SAYveBOL	PROC NEAR
			
			PUSH BX
			PUSH CX
			PUSH BP
			PUSH DX
			MOV BP, SP
			
			MOV AX, [BP+10]
			
			XOR BX, BX
			MOV CX, 16
L1:			SHR AX, 1
			ADC BX, 0
			LOOP L1
			
			CMP BX, 0
			JE sorun
			
			XOR DX, DX
			MOV AX, [BP+10]
			IDIV BX
			
			JMP atla
			
sorun:		MOV AX, 0
			
atla:		POP DX
			POP BP
			POP CX
			POP BX
			RET 2
SAYveBOL	ENDP
mycs		ENDS
			END