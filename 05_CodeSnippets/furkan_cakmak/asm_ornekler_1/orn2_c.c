#include <stdlib.h>
#include <stdio.h>

int main() {
	short A = 21, B = 56, C, tmp;

	if (A < B) {
		tmp = A;
		A = B;
		B = tmp;
	}
	while (A % B != 0) {
		C = A % B;
		A = B;
		B = C;
	}
	printf("EBOB(A, B): %d\n", B);
	system("PAUSE");
	return 0;
}