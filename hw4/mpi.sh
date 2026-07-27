#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --ntasks=8
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw-4-test
#SBATCH -A engr-class-any
#SBATCH --output=./run-outputs/mpi-Nbody.%j

echo "Running on host: $(hostname)"
module add tau-mpi
cd /<PATH>/<TO>/hw4
#parameters are: numstars starmass t_final display (display may be 1 for local run)
mpirun /<PATH>/<TO>/hw4/Nbody 1024 200.0 1000 0
