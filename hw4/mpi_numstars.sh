#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --ntasks=2
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-numstars
#SBATCH -A engr-class-any
#SBATCH --output=./q1_stars_mpi/numstars.%j

echo "Running on host: $(hostname)"
module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
mkdir -p q1_stars_mpi

for stars in 128 256 512 1024 2048; do
    for run in {1..10}; do
        mpirun ./Nbody $stars 200.0 1000 0 >> q1_stars_mpi/output_${stars}_run${run}.txt 2>&1
    done
done