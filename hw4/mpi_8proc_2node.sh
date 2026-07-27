#!/bin/bash
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --ntasks=8
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-8p2n
#SBATCH -A engr-class-any
#SBATCH --output=./q2_scaling/8p2n.%j

module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
mpirun ./Nbody 512 200.0 1000 0