/*
Título: Números pares e impares
Descripción: Realizar un algoritmo que detecte si un número es par o impar. El análisis deberá hacerse en una función a la cual se le envía el número y ésta regresará 0 si es par o 1 en caso impar.
Nombre: Donaldo Alfredo Garrido Islas
Matrícula: A01275416
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
		printf("El número %d es par", n);
	else printf("El número %d es impar", n);

	_getch();
}
	int verificador(int parimp)
	{
		if (parimp%2==0)
			return 0;
		return 1;
	}
