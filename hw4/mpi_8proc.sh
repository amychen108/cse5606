#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --ntasks=8
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-8proc
#SBATCH -A engr-class-any
#SBATCH --output=./q2_scaling/8proc.%j

module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
mpirun ./Nbody 512 200.0 1000 0