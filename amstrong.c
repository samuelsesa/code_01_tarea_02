/**
 * Funciones de amstrong
 * @file
 */
# include <math.h>
#include "stack.h"
#include "amstrong.h"

extern int top;

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
		return 0;   
	else 
		return 1;
}
