src=criba2
CC=gcc
CFLAGS=-Wall -Wpedantic
bin=${src}.o
par=${src}_parallel.o

all: serial parallel

serial:
	${CC} ${CFLAGS} ${src}.c -o ${bin}

icc:
	${CC} ${CFLAGS} ${src}.c -o ${bin}.icc

openmp:
	${CC} ${CFLAGS} -qopenmp ${src}.c -o ${bin}.omp


parallel:
	pgcc -ta=tesla -Minfo=accel -g ${src}.acc -o ${par}

clean:
	rm -rf ${bin} ${par}
