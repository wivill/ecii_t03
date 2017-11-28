# ecii_t03
Tarea programada 3 del curso Estructuras de Computadoras Digitales II.

La idea de este proyecto es crear un programa que pueda determinar los
números primos de una lista determinada por el usuario como entrada,
utilizando el algoritmo de la criba de Eratóstenes. 

Posteriormente ala programación del algoritmo, este será paralelizado 
utilizando uno de los paradigmas y estándares que existe. En este caso 
particular se propone utilizar OpenACC, el cual son pragmas para utilizar 
las GPU Nvidia y acelerar la ejecución de algoritmos.

OpenACC también permite la ejecución con arquitecturas multinúcleo al
modificar las banderas de compilación del PGI Compiler, por lo que se
puede portar el código más fácilmente de GPU a memoria compartida en CPU.

Estudiantes:
	Carolina Obando González
	Willy Villalobos Marrero

Profesora:
	Katherine Nuñez
