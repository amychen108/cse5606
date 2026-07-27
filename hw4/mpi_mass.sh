#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --ntasks=2
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-mass
#SBATCH -A engr-class-any
#SBATCH --output=./q1_mass_mpi/mass.%j

echo "Running on host: $(hostname)"
module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
mkdir -p q1_mass_mpi

for mass in 50 100 200 500 1000; do
    for run in {1..10}; do
        mpirun ./Nbody 512 $mass 1000 0 >> q1_mass_mpi/output_mass_${mass}_run${run}.txt 2>&1
    done
done