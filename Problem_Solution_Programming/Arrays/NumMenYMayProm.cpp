/*Titulo: Numeros Mayores y Menores al promedio
Descripción: Desarrollar un programa que pida N numeros y calcule el promedio de dichos numeros y que muestre dos listas, la lista de numeros por encima del promedio y la lista de numeros debajo del promedio
Nombre: Donaldo Alfredo Garrido Islas
Matricula: A01275416
Fecha: 04-11-18*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"

void main()
{
	int n=0, i, sumpro=0, k, lista[1000];
	float prom;
	printf("Introduce la cantidad de números  a promediar: ");
	scanf_s("%d", &n);

	for(i=0; i<n;i++)
	{
		printf("Introduzca el numero %d de la lista: ", i+1);
		scanf_s("%d", &lista[i]);
		sumpro+=lista[i];
	}
	prom=(float)sumpro/(float)n;
	printf("\n\nEl promedio de la lista anteriormente introducida es: %f", prom);

	printf("\n\nLos numeros que se encuentran por debajo del promedio son: ");
	for(i=0; i<n; i++)
	{
		if(lista[i]<(int)prom)
			printf("\n%d", lista[i]);
	}
	printf("\n\nLos numeros que se encuentran por encima del promedio son: ");
	
	for(i=0; i<n; i++)
	{
		if(lista[i]>(int)prom)
			printf("\n%d", lista[i]);
	}
	printf("\n\nLos numeros que son iguales que el promedio son: ");
	
	for(i=0; i<n; i++)
	{
		if(lista[i]==(int)prom)
			printf("\n%d", lista[i]);
	}

	_getch();
}

