#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int num, fact=1, res=1;
	printf("Introduzca el numero del que se quiere conocer el factorial: ");
	scanf_s("%d", &num);
	do
	{
		
		if(fact<num)
		{
			fact++;
			res*=fact;
		}
	} while(fact<num);
	printf("El resultado del factorial es: %d", res);

	_getch();

}