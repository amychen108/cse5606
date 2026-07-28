#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --ntasks=4
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-opt-4p
#SBATCH -A engr-class-any
#SBATCH --output=./q3_optimized/opt_4proc.%j

module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
for run in {1..10}; do
    mpirun ./Nbody 512 200.0 1000 0 >> q3_optimized/opt_4proc_run${run}.txt 2>&1
done