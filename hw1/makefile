CC = gcc
CFLAGS = -Wall -O2
CLIBS = 
#CLIBS = -lblas

all:	hw1.c

gprof:
	$(CC) $(CFLAGS) -pg -o hw1 hw1.c $(CLIBS)

operf:
	$(CC) $(CFLAGS) -g -o hw1 hw1.c $(CLIBS)

perf:
	$(CC) $(CFLAGS) -ggdb -o hw1 hw1.c $(CLIBS)

clean:
	rm -rf hw1
