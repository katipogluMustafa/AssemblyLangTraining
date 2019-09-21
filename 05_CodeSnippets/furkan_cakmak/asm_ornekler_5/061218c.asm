			PUBLIC ALAN_BUL
mycode		SEGMENT PARA 'kod'
			ASSUME CS:mycode
ALAN_BUL	PROC FAR
			PUSH BX
			PUSH CX
			PUSH DI
			PUSH BP
			MOV BP, SP
			
			XOR AX, AX
			ADD AX, [BP+12]
			ADD AX, [BP+14]
			ADD AX, [BP+16]		; AX'te u var.
			
			SHR AX, 1
			
			MOV BX, AX
			SUB BX, [BP+12]
			MOV CX, AX
			SUB CX, [BP+14]
			MOV DI, AX
			SUB DI, [BP+16]
			
			MUL BX
			MUL CX
			MUL DI
			
			POP BP
			POP DI
			POP CX
			POP BX
			RETF 6
ALAN_BUL	ENDP
mycode 		ENDS
			END