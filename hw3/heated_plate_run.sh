#!/bin/bash
#
#  Compile the program with gcc
#
make heated_plate
#
#
#  Run with 1, 2, and 4 threads.
#
echo "Run with 1 thread."
export OMP_NUM_THREADS=1
./heated_plate > heated_plate_output.txt
#
echo "Run with 2 threads."
export OMP_NUM_THREADS=2
./heated_plate >> heated_plate_output.txt
#
echo "Run with 4 threads."
export OMP_NUM_THREADS=4
./heated_plate >> heated_plate_output.txt
#
#  Discard the executable file.
#
make clean
#
echo "Program output written to heated_plate_output.txt"
