#include <stdlib.h>
#include <stdio.h>

int main() {
	short ebob;

	__asm {
			MOV AX, 5000
			MOV BX, 350
			CMP AX, BX
			JAE L2
			XCHG AX, BX
	L2:		MOV DX, 0
			DIV BX
			CMP DX, 0
			JE L3
			MOV AX, BX
			MOV BX, DX
			JMP L2
	L3:		MOV ebob, BX
	}
	printf("EBOB(A, B): %d\n", ebob);
	system("PAUSE");
	return 0;
}