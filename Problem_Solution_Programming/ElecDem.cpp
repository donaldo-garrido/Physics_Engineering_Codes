/*
T�tulo: Elecciones Democr�ticas
Descripci�n: Se cuenta con los votos obtenidos por Juan, Pedro y Mar�a en una elecci�n democr�tica a la presidencia de un club. Para ganar la elecci�n se debe obtener como m�nimo el 50% de los votos m�s 1. En caso que no haya un ganador se repite la elecci�n en una segunda vuelta y as� sucesivamente. Dise�e un algoritmo que determine el resultado de la elecci�n.
Nombre: Donaldo Alfredo Garrido Islas
Matr�cula: A01275416
Fecha: 09-10-18
*/

#include "stdafx.h"
#include "conio.h"
#include "stdio.h"


void main()
{
	int vm=0, vp=0, vj=1, min=1, total=0;
	do
	{
	printf("\n\nIntroduce la cantidad de votos por Maria: ");
	scanf_s("%d", &vm);
	printf("\nIntroduce la cantidad de votos por Pedro: ");
	scanf_s("%d", &vp);
	printf("\nIntroduce la cantidad de votos por Juan: ");
	scanf_s("%d", &vj);
	total=vm+vp+vj;
	min=(total/2)+1;
	if (vm>=min && vm>vp && vm>vj)
		printf("\n\tMaria fue elegida presidenta");
	else if (vp>=min && vp>vm && vp>vj)
		printf("\n\tPedro fue elegido presidente");
	else if(vj>=min && vj>vm && vj>vp)
		printf("\n\tJuan fue elegido presidente");
	else printf("\n\tSe debe repetir la eleccion");
	}
	while (vm<min && vp<min && vj<min);
	
	

	_getch();
}

