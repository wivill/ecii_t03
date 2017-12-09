src=criba2
CC=gcc
CFLAGS=-Wall -Wpedantic
bin=${src}.o
par=${src}_parallel.o

all: serial parallel

serial:
	${CC} ${CFLAGS} ${src}.c -o ${bin}

parallel:
	pgcc -ta=tesla -Minfo=accel -g ${src}.acc -o ${par}

clean:
	rm -rf ${bin} ${par}
