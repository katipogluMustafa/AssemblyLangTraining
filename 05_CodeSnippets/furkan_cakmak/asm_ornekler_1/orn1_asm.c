#include <stdio.h>
#include <stdlib.h>

int main() {
	short T;
	__asm {
			MOV CX, 6
			MOV SI, 5
			MOV BX, 1
			MOV AX, SI
			MOV DI, 1
			MOV DX, 0
	L1:		PUSH AX
			DIV DI
			ADD BX, AX
			POP AX
			MUL SI
			INC DI
			LOOP L1
			MOV T, BX
	}
	printf("T: %d\n", T);
	system("PAUSE");
	return 0;
}