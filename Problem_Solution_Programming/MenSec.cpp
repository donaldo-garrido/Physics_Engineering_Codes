/*
T�tulo: Menor de la secuencia
Descripci�n: Realizar un algoritmo que dada una secuencia de n�meros positivos que acabe con el n�mero 0, obtenga el menor de ellos y el n�mero de veces que aparece en la secuencia.
Nombre: Donaldo Alfredo Garrido Islas
Matr�cula: A01275416
Fecha: 07-10-18
*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int x=1, cont=1, numen;
	numen=99999999999;
	do
	{
		printf("Introduzca un n�mero: ");
		scanf_s("%d", &x);
		if(x>0 && x<numen)
		{
			numen=x;
			cont =1;
			
		}
		else if(x==numen)
				cont++;
	}
	while(x>0);
		printf("El n�mero menor en la secuencia es: %d", numen);
		printf("\nEl n�mero de veces que apareci� el n�mero es: %d", cont);

	_getch();
}

