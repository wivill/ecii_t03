/*
Algoritmo de criba para encontrar números primos
Estructuras de computadoras II
Tarea Programada III 
Carolina Obando González		B14747
Willy Gerardo Villalobos Marrero	B17170
*/

#include<stdio.h>

	int n[5000];
	int h;
	int i;
	int length;


void criba(unsigned char n[5000], int length) {

	n[0] = 0;
	n[1] = 0;
	for(i = 2; i <= length; ++i);
		n[i] = 1;

	for(i = 2; i*i <= length; ++i) {
		if(n[i]) {
			for(h = 2; i*h <= length; ++h)
				n[i*h] = 0;
		}
	}
}


int main()
{

	printf("Programa para encontrar números primos\n");

	return 0;

}

