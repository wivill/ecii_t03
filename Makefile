src=criba2
CC=gcc
CFLAGS=-Wall -Wpedantic
par=${src}_parallel

all: serial intel pgi_openmp icc_openmp openmp

serial:
	${CC} ${CFLAGS} ${src}.c -o ${src}.o

intel:
	icc ${CFLAGS} ${src}.c -o ${src}.icc

openmp:
	${CC} ${CFLAGS} -fopenmp ${src}_omp.c -o ${par}.omp

icc_openmp:
	icc ${CFLAGS} -qopenmp ${src}_omp.c -o ${par}.iomp

pgi_openmp:
	pgcc -mp ${src}_omp.c -o ${par}.pgomp

clean:
	rm -rf ${src}.o ${src}.icc ${par}.*

test:
	echo "Testing serial code, compiled with gcc."
	time ./${src}.o
	echo "Testing serial code, compiled with icc."
	time ./${src}.o
	echo "Testing parallel code, compiled with gcc."
	time OMP_NUM_THREADS=1 ./${par}.omp
	time OMP_NUM_THREADS=2 ./${par}.omp
	time OMP_NUM_THREADS=4 ./${par}.omp
	time OMP_NUM_THREADS=8 ./${par}.omp
	echo "Testing parallel code, compiled with icc."
	time OMP_NUM_THREADS=1 ./${par}.iomp
	time OMP_NUM_THREADS=2 ./${par}.iomp
	time OMP_NUM_THREADS=4 ./${par}.iomp
	time OMP_NUM_THREADS=8 ./${par}.iomp
	echo "Testing parallel code, compiled with pgcc."
	time OMP_NUM_THREADS=1 ./${par}.pgomp
	time OMP_NUM_THREADS=2 ./${par}.pgomp
	time OMP_NUM_THREADS=4 ./${par}.pgomp
	time OMP_NUM_THREADS=8 ./${par}.pgomp
