#include <stdlib.h>
#include <stdio.h>

int main() {
	char a = 224;
	__asm {
		MOV AL, a
		MOV CX, 8
	L1:	SHR AL, 1
		RCL AH, 1
		LOOP L1
		MOV a, AH
	}
	printf("a: %d\n", a);
	system("PAUSE");
	return 0;
}