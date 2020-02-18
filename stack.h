/**
 * Funciones de stack
 * @file
 */

#ifndef STACK_H
#define STACK_H
/*! \def max(a,b)
    \brief Valor maximo aceptado
*/
#define max 10

/**
 * Añade elemento a stack
 * @param m elemento a almacenar
 */
void push(int m);

/**
 * Extrae elemento del stack
 */
int pop();
#endif