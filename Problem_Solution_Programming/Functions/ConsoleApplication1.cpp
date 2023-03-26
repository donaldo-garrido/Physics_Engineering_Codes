/*
	Título: Sumatorias y Productos
	Descripción: Crear un programa para pedir una secuencia de numeros que termine con 0, el programa deberá calcular las sumatorias y productos tanto de los numeros positivos como de los negativos.
	Nombre: Karen Guadalupe Rodríguez González
	Matrícula: A01273796
	Fecha: octubre 9, 2018
*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int num, negativos=0, positivos=0, productop=1, producton=1;
	
	do
	{
		printf("Introduce el numero: ");
		scanf_s("%d", &num);
		if (num>0)
		{
			positivos+=num;
		    productop*=num;   
		}

		else if (num<0)
		{
			negativos+=num;
			producton*=num;
		}

	}
	while (num!=0);

	printf("\n\nLa sumatoria de los numeros postivos es: %d", positivos);
	printf("\nEl producto de los numeros postivos es: %d",productop);
	printf("\nLa sumatoria de los numeros negativos es: %d", negativos);
	printf("\nEl producto de los numeros negativos es: %d",negativos, producton);

	_getch();

}

