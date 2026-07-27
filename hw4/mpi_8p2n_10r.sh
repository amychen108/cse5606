#!/bin/bash
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --ntasks=8
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-8p2n-10r
#SBATCH -A engr-class-any
#SBATCH --output=./q2_scaling_10runs/8p2n_10r.%j

module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
for run in {1..10}; do
    mpirun ./Nbody 512 200.0 1000 0 >> q2_scaling_10runs/8p2n_run${run}.txt 2>&1
done