src=primos
CC=gcc
CFLAGS=-Wall -Wpedantic -o
bin=${src}.o
par=${src}_parallel.o

all: serial parallel

serial:
	${CC} ${CFLAGS} ${bin}

parallel:
	pgcc -ta=tesla -Minfo=accel -g ${src}.acc -o ${par}

clean:
	rm -rf ${bin} ${par}
