/*
Título: Sumatorias y productos
Descripción: Crear un programa para pedir una secuencia de numeros que termine con 0, el programa deberá calcular las sumatorias y productos tanto de los numeros positivos como de los negativos.
Nombre: Donaldo Alfredo Garrido Islas
Matrícula: A01275416
Fecha: 09-10-18
*/

#include "stdafx.h"
#include "conio.h"
#include "stdio.h"

void main()
{
	int n=1, sumpar=0, sumimp=0, prodpar=1, prodimp=1;
	while(n!=0)
	{
		printf("Introduce un numero: ");
		scanf_s("%d", &n);
		if (n%2==0 && n!=0)
		{
			sumpar+=n;
			prodpar*=n;
		}
		else if (n%2!=0 && n!=0)
		{
			sumimp+=n;
			prodimp*=n;
		}
	}
	
		printf("La sumatoria de los numeros pares es: %d, y su producto es: %d", sumpar, prodpar);
		printf("\n\nLa sumatoria de los numeros impares es: %d, y su producto es: %d", sumimp, prodimp);


_getch();
}