/* hw1.c
 *
 * Simple vector-matrix multiply code.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#ifndef N
#define N 1024
#endif		// length of vector, length and width of matrix
#define SEED 1		// random number seed
#define REPS 1000	// repetitions
//#define OUT   	// output flag

double vector[N];
double matrix[N][N];
double result[N];

void initialize();
void vm_multiply();
void output();

int main() {
    int i;
    struct timespec start, end;
    double elapsed;

    initialize();

    clock_gettime(CLOCK_MONOTONIC, &start);
    for (i=0; i<REPS; i++) {
        vm_multiply();
    }
    clock_gettime(CLOCK_MONOTONIC, &end);

    elapsed = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
    printf("N=%d, REPS=%d, total time = %.6f sec, time per multiply = %.6f sec\n",
           N, REPS, elapsed, elapsed / REPS);

    output();
    return 0;
}

void initialize() {
	int i,j;

	srand(SEED);
	for (i=0; i<N; i++) {
		vector[i] = (double)rand()/RAND_MAX;
		result[i] = 0.0;
		for (j=0; j<N; j++) {
			matrix[i][j] = (double)rand()/RAND_MAX;
		}
	}
}

void vm_multiply() {
	int i,j;

	for (j=0; j<N; j++) {
		result[j] = 0.0;
		for (i=0; i<N; i++) {
			result[j] += vector[i]*matrix[j][i];
		}
	}
}

void output() {
#ifdef OUT
	int i,j;

	printf("vector:");
	for (i=0; i<N; i++) {
		if (i%10 == 0)
			printf("\n");
		printf(" %6.4f",vector[i]);
	}
	printf("\n");
	printf("matrix:\n");
	for (i=0; i<N; i++) {
		printf("row %d:",i);
		for (j=0; j<N; j++) {
			if (j%10 == 0)
				printf("\n");
			printf(" %6.4f",matrix[i][j]);
		}
		printf("\n");
	}
	printf("result:");
	for (i=0; i<N; i++) {
		if (i%10 == 0)
			printf("\n");
		printf(" %6.4f",result[i]);
	}
	printf("\n");
#else
	return;
#endif
}
