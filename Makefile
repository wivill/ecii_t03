src=criba2
CC=gcc
CFLAGS=-Wall -Wpedantic
par=${src}_parallel

all: serial parallel icc icc_openmp openmp

serial:
	${CC} ${CFLAGS} ${src}.c -o ${src}.o

icc:
	icc ${CFLAGS} ${src}.c -o ${src}.icc

openmp:
	${CC} ${CFLAGS} -fopenmp ${src}_omp.c -o ${par}.omp

icc_openmp:
	icc ${CFLAGS} -qopenmp ${src}_omp.c -o ${par}.iomp

parallel:
	pgcc -ta=tesla -Minfo=accel -g ${src}.acc -o ${par}.acc

clean:
	rm -rf ${src}.o ${src}.icc ${par}.*

test:
	echo "Testing serial code, compiled with gcc."
	./${src}.o
	echo "Testing serial code, compiled with icc."
	./${src}.o
	echo "Testing parallel code, compiled with gcc."
	./${par}.omp
	echo "Testing parallel code, compiled with icc."
	./${par}.iomp
	echo "Testing parallel code, compiled with pgcc for GPU."
	./${par}.acc
