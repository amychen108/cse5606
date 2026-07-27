#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --ntasks=2
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-test
#SBATCH -A engr-class-any
#SBATCH --output=./run-outputs/mpi-Nbody.%j

echo "Running on host: $(hostname)"
module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
mpirun ./Nbody 512 200.0 1000 0