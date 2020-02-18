# include <math.h>
#include "stack.h"

/*! \var top
    \brief Valor maximo aceptado
*/
int top=-1;
/*! \var stack[max]
    \brief Puntero al último elemento
*/
int stack[max];

void push(int m){   
	top++;   
	stack[top]=m;
}

int pop(){
	if(top==-1)
		return(top);   
	else   
	{      
	int j; 
		j=stack[top];      
		top--;      
		return(j);   
	}
}
