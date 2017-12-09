/*
Algoritmo de criba para encontrar números primos
Estructuras de computadoras II
Tarea Programada III 
Carolina Obando González		B14747
Willy Gerardo Villalobos Marrero	B17170
*/

/*Biblioteca estándar de C para operaciones
 de entrada y salida*/
#include<stdio.h>

/*Biblioteca estándar de C para gestión de
memoria dinámica, control de procesos y otras*/
#include <stdlib.h>

/*Para medir eltiempo de ejecucion*/
#include <time.h>


/*Prototipos de funciones*/
void criba(int *n, int length);


/*La siguiente definición describe el contenedor que
usaremos para guardar datos y resultados*/
struct contenedor_datosresultados
{

	int *n;
	int length;
};


/*El siguiente puntero global apuntara al contenedor
que usaremos para guardar resultados*/
struct contenedor_datosresultados *datosresultados;


/*Las siguientes son variables globales*/

int i=0;
int h=0;

/*Inicio de programa principal*/
int main(int argc, char *argv[])
{


	printf("Programa para encontrar números primos\n");

    	/*Reservando memoria para la estructura */
	datosresultados = (struct contenedor_datosresultados *)malloc(sizeof(struct contenedor_datosresultados));
	datosresultados->n=NULL;
	datosresultados->length=86028122;


	/*Reservando e inicializando memoria de la matriz de rotación*/
	datosresultados->n=(int *)malloc(datosresultados->length*sizeof(int));
	for (i=0;i<datosresultados->length;i++) {
        datosresultados->n[i]=i;
	}
	
	clock_t t_inicial, t_final;
	double seg;

	t_inicial = clock();
	criba(datosresultados->n, datosresultados->length);
	t_final = clock();

	seg = (double)(t_final - t_inicial) / CLOCKS_PER_SEC;

	printf("%.16g  milisegundos\n",seg * 1000.0);

	free(datosresultados);

	return 0;

}

void criba(int *n, int length) {

	length=datosresultados->length;

	datosresultados->n[0] = 0;
	datosresultados->n[1] = 0;

	int count = 0;

	if(count<=5000000){
		for(i = 2; i <= length; ++i);
			datosresultados->n[i] = 1;

		for(i = 2; i*i <= length; ++i) {
			if(datosresultados->n[i]) {
				for(h = 2; i*h <= length; ++h)
					datosresultados->n[i*h] = 0;
			}
		}
	}

	printf("Numeros Primos\n");
	for(i = 0; i <= length; ++i) {
		if (datosresultados->n[i]!=0) {
			count++;
		}
	}
	printf("count=%d\n", count);
}

