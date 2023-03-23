/*Titulo: Arreglos de pares e impares
Descripción: Leer una lista con un máximo de 30 elementos, crear dos vectores, el vector par contendrá los números pares de la lista original y el non los impares. Al final imprima los tres vectores.
Nombre: Donaldo Alfredo Garrido Islas
Matricula: A01275416
Fecha: 07-11-18*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int original[30], par[30], non[30], i, j, k=0, n, p=0, q=0;
	
		printf("Introduzca el numero de datos (menos que 30) a usar: ");
		scanf_s("%d", &n);
	for(i=0; i<n; i++)
	{
		printf("Introduce el valor numero %d de la lista: ", i+1);
		scanf_s("%d", &original[i]);
	}
	for(j=0; j<n; j++)
	{
		if(original[j]%2==0)
		{
			par[k]=original[j];
			k++;
			p++;
		}
	}
	k=0;
	for(j=0; j<n; j++)
	{
		if(original[j]%2!=0)
		{
			non[k]=original[j];
			k++;
			q++;
		}
	}
	printf("\n\nLa lista original es:");
	for(i=0; i<n; i++)
		printf("\n%d", original[i]);
	printf("\n\nLos numeros pares son:");
	for(i=0; i<p; i++)
		printf("\n%d", par[i]);
	printf("\n\nLos numeros impares son:");
	for(i=0; i<q; i++)
		printf("\n%d", non[i]);

	_getch();

}

