#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --ntasks=4
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-4proc
#SBATCH -A engr-class-any
#SBATCH --output=./q2_scaling/4proc.%j

module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
mpirun ./Nbody 512 200.0 1000 0