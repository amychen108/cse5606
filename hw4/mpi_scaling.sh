#!/bin/bash

#SBATCH -p ib-linuxlab
#SBATCH -J hw4-scaling
#SBATCH -A engr-class-any
#SBATCH -c 1
#SBATCH --output=./q2_scaling/scaling.%j

# Test configurations
nodes_list=(1 1 1 2 4)
ntasks_per_node=(2 4 8 4 4)
ntasks=(2 4 8 8 16)

for i in "${!nodes_list[@]}"; do
    nodes=${nodes_list[$i]}
    ntpn=${ntasks_per_node[$i]}
    ntasks=${ntasks[$i]}
    
    echo "Testing: nodes=$nodes, ntasks-per-node=$ntpn, ntasks=$ntasks"
    
    # Create a temporary script for this config
    cat > temp_scaling_$i.sh << EOF
#!/bin/bash
#SBATCH --nodes=$nodes
#SBATCH --ntasks-per-node=$ntpn
#SBATCH --ntasks=$ntasks
#SBATCH -c 1
#SBATCH -p ib-linuxlab
#SBATCH -J hw4-scaling-$i
#SBATCH -A engr-class-any
#SBATCH --output=./q2_scaling/output_${nodes}n_${ntasks}p.%j

echo "Running: nodes=$nodes, ntasks-per-node=$ntpn, ntasks=$ntasks"
module add mpi/mpich-x86_64
cd /home/compute/cyue/cse5606/hw4
mpirun ./Nbody 512 200.0 1000 0
EOF

    sbatch temp_scaling_$i.sh
done