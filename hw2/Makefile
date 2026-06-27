CC = gcc
LIBS = -lpthread
FLAGS = -O -Wall
EXECS = p_matrix_para

all: $(EXECS)

p_matrix_para: p_matrix_para.c
	$(CC) $(FLAGS) -o $@ $? $(LIBS)

clean:
	rm $(EXECS)
