#include <stdio.h>
#include <stdlib.h>

int main() {

	short a, b;

	__asm {
				cmp AX, 0
				je thenK
				mov BX, 2
				jmp Son
		thenK : mov BX, 1
		Son   : mov CX, 5
				mov a, BX
				mov b, CX
	}
	printf("a: %d, b: %d\n", a, b);
	system("pause");
	return 0;
}

