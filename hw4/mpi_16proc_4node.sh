#!/bin/bash
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --ntasks=16
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-16p4n
#SBATCH -A engr-class-any
#SBATCH --output=./q2_scaling/16p4n.%j

module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
mpirun ./Nbody 512 200.0 1000 0