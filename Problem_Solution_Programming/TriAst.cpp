/*
T�tulo: Tri�ngulo de asteriscos
Descripci�n: Implemente un algoritmo para imprimir un tri�ngulo de '*' con tantos '*' como se indique.  

Ejemplo: Un tri�ngulo de 3 *  ser�:         

 *       

 *       *       

 *       *        *

Nombre: Donaldo Alfredo Garrido Islas
Matr�cula: A01275416
Fecha: 10-10-18
*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int lado, fila, col;
	printf("Introduce el numero de asteriscos por lado: ");
	scanf_s("%d", &lado);
	for(fila=1; fila<=lado; fila++)
	{
		for(col=1;col<=fila; col++)
			printf("*");
			printf("\n");
	}
	_getch();
}

