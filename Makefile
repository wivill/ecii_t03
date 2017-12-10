src=criba2
CC=gcc
CFLAGS=-Wall -Wpedantic
par=${src}_parallel

all: serial intel openacc icc_openmp openmp

serial:
	${CC} ${CFLAGS} ${src}.c -o ${src}.o

intel:
	icc ${CFLAGS} ${src}.c -o ${src}.icc

openmp:
	${CC} ${CFLAGS} -fopenmp ${src}_omp.c -o ${par}.omp

icc_openmp:
	icc ${CFLAGS} -qopenmp ${src}_omp.c -o ${par}.iomp

openacc:
	pgcc -mp -Minfo=accel -fast -ta=multicore ${src}_acc.c -o ${par}.acc

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
	time OMP_NUM_THREADS=1 ./${par}.omp
	echo " "
	echo "Threads=2"
	time OMP_NUM_THREADS=2 ./${par}.omp
	echo " "
	echo "Threads=4"
	time OMP_NUM_THREADS=4 ./${par}.omp
	echo " "
	echo "Threads=8"
	time OMP_NUM_THREADS=8 ./${par}.omp
	echo " "
	echo "Threads=16"
	time OMP_NUM_THREADS=16 ./${par}.omp
	echo " "
	echo "Threads=32"
	time OMP_NUM_THREADS=32 ./${par}.omp
	echo " "
	echo "Threads=64"
	time OMP_NUM_THREADS=64 ./${par}.omp
	echo " "
	echo "Threads=128"
	time OMP_NUM_THREADS=128 ./${par}.omp
	echo " "
	echo "Threads=256"
	time OMP_NUM_THREADS=256 ./${par}.omp
	echo " "
	echo "Testing parallel code, compiled with icc."
	echo " "
	echo "Threads=1"
	time OMP_NUM_THREADS=1 ./${par}.iomp
	echo " "
	echo "Threads=2"
	time OMP_NUM_THREADS=2 ./${par}.iomp
	echo " "
	echo "Threads=4"
	time OMP_NUM_THREADS=4 ./${par}.iomp
	echo " "
	echo "Threads=8"
	time OMP_NUM_THREADS=8 ./${par}.iomp
	echo " "
	echo "Threads=16"
	time OMP_NUM_THREADS=16 ./${par}.iomp
	echo " "
	echo "Threads=32"
	time OMP_NUM_THREADS=32 ./${par}.iomp
	echo " "
	echo "Threads=64"
	time OMP_NUM_THREADS=64 ./${par}.iomp
	echo " "
	echo "Threads=128"
	time OMP_NUM_THREADS=128 ./${par}.iomp
	echo " "
	echo "Threads=256"
	time OMP_NUM_THREADS=256 ./${par}.iomp
	echo " "
	echo "Testing parallel code, compiled with pgcc."
	echo " "
	echo "Threads=1"
	time OMP_NUM_THREADS=1 ./${par}.acc
	echo " "
	echo "Threads=2"
	time OMP_NUM_THREADS=2 ./${par}.acc
	echo " "
	echo "Threads=4"
	time OMP_NUM_THREADS=4 ./${par}.acc
	echo " "
	echo "Threads=8"
	time OMP_NUM_THREADS=8 ./${par}.acc
	echo " "
	echo "Threads=16"
	time OMP_NUM_THREADS=16 ./${par}.acc
	echo " "
	echo "Threads=32"
	time OMP_NUM_THREADS=32 ./${par}.acc
	echo " "
	echo "Threads=64"
	time OMP_NUM_THREADS=64 ./${par}.acc
	echo " "
	echo "Threads=128"
	time OMP_NUM_THREADS=128 ./${par}.acc
	echo " "
	echo "Threads=256"
	time OMP_NUM_THREADS=256 ./${par}.acc
