/*
Título: Menor de la secuencia
Descripción: Realizar un algoritmo que dada una secuencia de números positivos que acabe con el número 0, obtenga el menor de ellos y el número de veces que aparece en la secuencia.
Nombre: Donaldo Alfredo Garrido Islas
Matrícula: A01275416
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
		printf("Introduzca un número: ");
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
		printf("El número menor en la secuencia es: %d", numen);
		printf("\nEl número de veces que apareció el número es: %d", cont);

	_getch();
}

