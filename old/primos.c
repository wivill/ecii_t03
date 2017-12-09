#include <stdio.h>
#include <stdlib.h>

#define length 5000
#define numbers 10000

int * primeList() {

  static int list[length];

  for (int i = 2; i < numbers; i++) {

    for (int j = 2; j < i; j++) {

      if (i % j == 0) {
        break;
      } else {
        list[i-2] = i;
      }

    }

  }


  return list;
}

int main(int argc, char const *argv[]) {

  int *list;

  list = primeList();

  for (int k = 0; k < length; k++) {
    printf("%d\n", list[k]);
  }

  return 0;
}
