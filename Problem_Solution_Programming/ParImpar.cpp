/*
Título: Pares e impares.
Descripción:Desarrollar un ejercicio para pedir un número al usuario, y generar como resultado 2 listas, la primera con los números pares entre 0 y el número introducido y la segunda con los números impares.
Nombre: Donaldo Alfredo Garrido Islas
Matrícula: A01275416
Fecha: 09-10-18
*/
#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int num=0, par=0, impar=1;
	printf("Escriba un numero: ");
	scanf_s("%d", &num);
	do
	{
		
		printf("\n%d", par);
		printf("\t%d", impar);
		par+=2;
		impar+=2;
	}
	while (par<=num && impar<=num);

	_getch();
}

