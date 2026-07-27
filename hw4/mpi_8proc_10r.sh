#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --ntasks=8
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-8p-10r
#SBATCH -A engr-class-any
#SBATCH --output=./q2_scaling_10runs/8proc_10r.%j

module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
for run in {1..10}; do
    mpirun ./Nbody 512 200.0 1000 0 >> q2_scaling_10runs/8proc_run${run}.txt 2>&1
done