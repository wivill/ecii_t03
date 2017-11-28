#include <stdio.h>


int main(int argc, char const *argv[]) {

  if (argc == 2) {
    printf("Cantidad de números primos a calcular: %s\n", argv[1]);
    int cantidad = atoi(argv[1]);
  }
  else if (argc > 2) {
    printf("Se han proprcionado demasiados argumentos.\n");
  } else {
    printf("Solo se debe proporcionar como argumento la cantidad de números primos al calcular.\n");
  }

  return 0;
}
