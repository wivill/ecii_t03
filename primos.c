#include <stdio.h>
#include <stdlib.h>

#define length 5000000
#define numbers 10000000

int * primeList() {

  static int list[length];

  for (int i = 2; i < numbers; i++) {

    for (int j = 2; j < i; j++) {

      if (i % j == 0) {
        break;
      } else {
        
      }

    }

  }


  return list;
}

void criba() {


}

int main(int argc, char const *argv[]) {

  int *list;

  list = primeList();

  return 0;
}
