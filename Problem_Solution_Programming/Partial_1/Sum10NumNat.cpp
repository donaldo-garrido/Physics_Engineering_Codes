/*
T�tulo: Suma de 10 n�meros naturales
Descripci�n: Realizar un algoritmo para obtener la suma de los primeros 10 n�meros naturales.
Nombre: Donaldo Alfredo Garrido Islas
Matr�cula: A01275416
Fecha: 01-10-18
*/
#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main ()
{
	int num=1, signum=0;
	while(num<=10)
	{
		signum+=num;
		printf("\nNumero: %d	La suma es: %d", num, signum);
		num++;

	}
	_getch();
}