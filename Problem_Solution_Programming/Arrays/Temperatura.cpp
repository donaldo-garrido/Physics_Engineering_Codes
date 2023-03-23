/*Titulo: Temperaturas
Descripción: Almacene en un arreglo la temperatura de cada día de una determinada semana y que realice lo siguiente:

a) La temperatura promedio
b) Un arreglo que contenga las diferencias de cada temperatura con respecto al promedio
c) La menor temperatura y el número de día en que ocurrió
d) La mayor temperatura y el número de día en que ocurrió
Nombre: Donaldo Alfredo Garrido Islas
Matricula: A01275416
Fecha: 07-11-18*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int semana[7], dif[7], may, numay, men, numen, sum=0, i, j;
	float prom;
	printf("Temperatura registrada en cada uno de los dias de la semana: \n\n");
	for(i=0; i<7; i++)
	{
		printf("Introduzca la temperatura del dia %d : ", i+1);
		scanf_s("%d", &semana[i]);
		sum+=semana[i];
	}
	prom=(float)sum/7.0;
	printf("\nEl promedio de temperaturas para la semana es %f", prom);
	for(i=0; i<7; i++)
		dif[i]=prom-semana[i];
	printf("\n\nLas diferencias entre las temperaturas y la temperatura promedio son:");
	for(i=0; i<7; i++)
		printf("\nDiferencia del dia %d: %d", i+1, dif[i]);
	men=semana[0];
	may=semana[0];
	for(i=0; i<7; i++)
	{
		if(men>semana[i])
		{
			men=semana[i];
			numen=i+1;
		}
	}
	for(j=0; j<7; j++)
	{
		if(may<semana[j])
		{
			may=semana[j];
			numay=j+1;
		}
	}

	printf("\n\nLa menor temperatura fue %d y ocurrio en el dia %d", men, numen);
	printf("\nLa mayor temperatura fue %d y ocurrio en el dia %d", may, numay);

	_getch();
}

