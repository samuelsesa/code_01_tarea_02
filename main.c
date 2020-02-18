/**
 * Programa que comprueba si un número es un número de Armstrong.
 * @file
 */

# include <stdio.h>
# include <math.h>
# include "stack.h"

extern int top;
/**
 * Calcula si un número es amstrong o no 
 * @param numb
 * @return false si no es numero amstrong
 */
int is_armstrong_number(int numb);

/**
 * Comienzo del proceso 
 * 
 * @return false si no es numero amstrong
 */
int main(){   
	int n;   
	printf("Introduce un número entero");   
	scanf("%d",&n);   
	if (is_armstrong_number(n))      
		printf("%d es un número de armstrong \U0001F60E \n", n);   
	else printf("%d no es un número de armstrong \U0001F622 \n", n);
	return 0;
}

int is_armstrong_number(int numb){   
	int temp, count, value;   
	temp=numb;   
	count=0;   
	while(numb >0)   {      
		int remainder;
		remainder=numb%10;      
		push(remainder);      
		count++;      
		numb=numb/10;   
	}   numb=temp;   
	value=0;   
	while(top >=0)   {   
		int j;   
		j=pop();      
		value=value+pow(j,count);   
	}   

	if(value==numb)
		return 1;   
	else 
		return 0;
}
