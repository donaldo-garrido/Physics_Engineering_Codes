/*
T�tulo: N�meros pares e impares
Descripci�n: Realizar un algoritmo que detecte si un n�mero es par o impar. El an�lisis deber� hacerse en una funci�n a la cual se le env�a el n�mero y �sta regresar� 0 si es par o 1 en caso impar.
Nombre: Donaldo Alfredo Garrido Islas
Matr�cula: A01275416
Fecha: 13-10-18
*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"

int verificador(int parimp);
void main()
{
	int n, confirm;
	printf("Introduzca el numero a analizar: ");
	scanf_s("%d", &n);
	confirm=verificador(n);
	if (confirm==0)
		printf("El n�mero %d es par", n);
	else printf("El n�mero %d es impar", n);

	_getch();
}
	int verificador(int parimp)
	{
		if (parimp%2==0)
			return 0;
		return 1;
	}
