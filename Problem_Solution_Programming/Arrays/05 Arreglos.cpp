// 05 Arreglos.cpp: define el punto de entrada de la aplicación de consola.
//
/*
Titulo: Arregos de Pares e Impares
Descripcion: Leer una lista con un máximo de 30 elementos, crear dos vectores, 
el vector par contendrá los números pares de la lista original y el non los impares. 
Al final imprima los tres vectores.
Nombre: Luz Elena Ibarra Ayala
Matricula: A01731036		
Fecha: 07/11/2018
*/
#include "stdafx.h"
#include "stdio.h"
#include "conio.h"
#define tam 30

void main()
{
	int i, n, num[tam];
	do
	{
		printf("Introduzca el numero de datos que desea valorar:");
		scanf_s("%d", &n);
	}
	while (n<0 || n>30);
	for (i=0; i<n;i++)
	{
		printf("Introduzca el valor %d: ", i+1);
		scanf_s("%d", &num[i]);
	}
	for(i=0;i<n;i++)
		printf("\nEl numero %d es %d", i+1, num[i]);
	printf("\n");
	for (i=0;i<n;i++)
		if (num[i] %2 ==0)
		printf("\nEl numero %d es Par", num[i]);
	printf("\n");
	for (i=0;i<n;i++)
		if (num[i] %2 !=0)
			printf("\nEl numero %d es Impar", num[i]);
	printf("\n");
	_getch();
}


