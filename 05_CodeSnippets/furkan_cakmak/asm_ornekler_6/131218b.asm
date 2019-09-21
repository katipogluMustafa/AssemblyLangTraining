			PUBLIC SAY
mycs		SEGMENT PARA PUBLIC 'code'
			ASSUME CS:mycs
SAY			PROC FAR
			
			PUSH BX
			PUSH CX
			PUSH BP
			MOV BP, SP
			MOV BX, [BP+14]		; aranan
			MOV DI, [BP+12]		; dizinin adresi
			MOV CX, [BP+10]		; dizinin eleman sayisi
			
			XOR AX, AX
			
L1:			CMP BX, [DI]
			JNE atla
			INC AX
atla:		ADD DI, 2
			LOOP L1	

			POP BP
			POP CX
			POP BX
			RETF 6
SAY			ENDP
mycs		ENDS
			END