		EXTRN SIRALI_MI: FAR
		PUBLIC n, dizi
myds	SEGMENT PARA 'd'
dizi	DB 12, 14, 16, 18, 20, 22, 24
n		DW 7
s		DB 0	
myds	ENDS
myss	SEGMENT PARA STACK 'y'
		DW 20 DUP(?)
myss	ENDS
mycs	SEGMENT PARA 'k'
		ASSUME DS:myds, CS:mycs, SS:myss
ANA		PROC FAR
		PUSH DS
		XOR AX, AX
		PUSH AX
		MOV AX, myds
		MOV DS, AX
		CALL SIRALI_MI
		CMP AL, 0
		JZ sirali
		MOV s, 1
sirali:	RETF
ANA		ENDP
mycs	ENDS
		END ANA