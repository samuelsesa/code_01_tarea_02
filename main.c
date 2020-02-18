/**
 * Programa que comprueba si un número es un número de Armstrong.
 * @file
 */

# include <stdio.h>
# include <math.h>
/*! \def max(a,b)
    \brief Valor maximo aceptado
*/
#define max 10
/*! \var top
    \brief Valor maximo aceptado
*/
int top=-1;
/*! \var stack[max]
    \brief Puntero al último elemento
*/
int stack[max];
/**
 * Añade elemento a stack
 * @param a elemento a almacenar
 */
void push(int a);

/**
 * Extrae elemento del stack
 */
int pop();

/**
 * Calcula si un número es amstrong o no 
 * @param a
 * @return false si no es numero amstrong
 */
int is_armstrong_number(int a);

/**
 * Comienzo del proceso 
 * 
 * @return false si no es numero amstrong
 */
void main(){   
	int n;   
	printf("Introduce un número entero");   
	scanf("%d",&n);   
	if (is_armstrong_number(n))      
		printf("%d es un número de armstrong \U0001F60E \n", n);   
	else printf("%d no es un número de armstrong \U0001F622 \n", n);
}

int is_armstrong_number(int numb){   
	int j, remainder, temp, count, value;   
	temp=numb;   
	count=0;   
	while(numb >0)   {      
		remainder=numb%10;      
		push(remainder);      
		count++;      
		numb=numb/10;   
	}   numb=temp;   
	value=0;   
	while(top >=0)   {      
		j=pop();      
		value=value+pow(j,count);   
	}   

	if(value==numb)
		return 1;   
	else 
		return 0;
}

void push(int m){   
	top++;   
	stack[top]=m;
}

int pop(){   
	int j;   
	if(top==-1)
		return(top);   
	else   
	{      
		j=stack[top];      
		top--;      
		return(j);   
	}
}
