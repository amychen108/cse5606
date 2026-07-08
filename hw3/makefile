CC = gcc
LIBS = -lm
FLAGS = -O2 -Wall -fopenmp

heated_plate: heated_plate_open_mp.c
	$(CC) $(FLAGS) -o heated_plate heated_plate_open_mp.c $(LIBS)

clean:
	rm heated_plate
