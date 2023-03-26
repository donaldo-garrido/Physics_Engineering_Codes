/*
Título: Triángulo de asteriscos
Descripción: Implemente un algoritmo para imprimir un triángulo de '*' con tantos '*' como se indique.  

Ejemplo: Un triángulo de 3 *  será:         

 *       

 *       *       

 *       *        *

Nombre: Donaldo Alfredo Garrido Islas
Matrícula: A01275416
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

