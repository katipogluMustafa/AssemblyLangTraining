#include <stdio.h>
#include <stdlib.h>

int main() {
	short d1[5] = { 2, 4, 6, 8, 10 };
	unsigned char d2[10] = { 1, 3, 5, 7, 9, 11, 13, 15, 17, 19 };
	short d3[15];
	short n1 = 5, n2 = 10, n3 = 15;
	
	__asm {
		LEA EDI, d1
		LEA ESI, d2
		XOR EBX, EBX

		MOV CX, n1
	L1:	MOV AX, [EDI]
		MOV d3[EBX], AX
		ADD EDI, 2
		ADD EBX, 2
		LOOP L1

		MOV CX, n2
	L2:	MOV AL, [ESI]
		CBW
		MOV d3[EBX], AX
		ADD EBX, 2
		INC ESI
		LOOP L2
	}

	int i;
	for (i = 0; i < n3-1; i++)
		printf("%hu, ", d3[i]);
	printf("%hu\n", d3[n3 - 1]);

	system("PAUSE");
	return 0;
}