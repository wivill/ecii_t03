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
	echo " "
	time ./${src}.o
	echo " "
	echo "Testing serial code, compiled with icc."
	echo " "
	time ./${src}.o
	echo " "
	echo "Testing parallel code, compiled with gcc."
	echo " "
	echo "Threads=1"
	OMP_NUM_THREADS=1 time ./${par}.omp
	echo " "
	echo "Threads=2"
	OMP_NUM_THREADS=2 time ./${par}.omp
	echo " "
	echo "Threads=4"
	OMP_NUM_THREADS=4 time ./${par}.omp
	echo " "
	echo "Threads=8"
	OMP_NUM_THREADS=8 time ./${par}.omp
	echo " "
	echo "Threads=16"
	OMP_NUM_THREADS=16 time ./${par}.omp
	echo " "
	echo "Threads=32"
	OMP_NUM_THREADS=32 time ./${par}.omp
	echo " "
	echo "Threads=64"
	OMP_NUM_THREADS=64 time ./${par}.omp
	echo " "
	echo "Threads=128"
	OMP_NUM_THREADS=128 time ./${par}.omp
	echo " "
	echo "Threads=256"
	OMP_NUM_THREADS=256 time ./${par}.omp
	echo " "
	echo "Testing parallel code, compiled with icc."
	echo " "
	echo "Threads=1"
	OMP_NUM_THREADS=1 time ./${par}.iomp
	echo " "
	echo "Threads=2"
	OMP_NUM_THREADS=2 time ./${par}.iomp
	echo " "
	echo "Threads=4"
	OMP_NUM_THREADS=4 time ./${par}.iomp
	echo " "
	echo "Threads=8"
	OMP_NUM_THREADS=8 time ./${par}.iomp
	echo " "
	echo "Threads=16"
	OMP_NUM_THREADS=16 time ./${par}.iomp
	echo " "
	echo "Threads=32"
	OMP_NUM_THREADS=32 time ./${par}.iomp
	echo " "
	echo "Threads=64"
	OMP_NUM_THREADS=64 time ./${par}.iomp
	echo " "
	echo "Threads=128"
	OMP_NUM_THREADS=128 time ./${par}.iomp
	echo " "
	echo "Threads=256"
	OMP_NUM_THREADS=256 time ./${par}.iomp
	echo " "
	echo "Testing parallel code, compiled with pgcc."
	echo " "
	echo "Threads=1"
	OMP_NUM_THREADS=1 time ./${par}.pgomp
	echo " "
	echo "Threads=2"
	OMP_NUM_THREADS=2 time ./${par}.pgomp
	echo " "
	echo "Threads=4"
	OMP_NUM_THREADS=4 time ./${par}.pgomp
	echo " "
	echo "Threads=8"
	OMP_NUM_THREADS=8 time ./${par}.pgomp
	echo " "
	echo "Threads=16"
	OMP_NUM_THREADS=16 time ./${par}.pgomp
	echo " "
	echo "Threads=32"
	OMP_NUM_THREADS=32 time ./${par}.pgomp
	echo " "
	echo "Threads=64"
	OMP_NUM_THREADS=64 time ./${par}.pgomp
	echo " "
	echo "Threads=128"
	OMP_NUM_THREADS=128 time ./${par}.pgomp
	echo " "
	echo "Threads=256"
	OMP_NUM_THREADS=256 time ./${par}.pgomp
