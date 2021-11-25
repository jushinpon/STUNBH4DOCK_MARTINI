#!/bin/bash
#SBATCH -J test_2
#SBATCH -p GPU_nodes #Sumit Partition
#SBATCH -o test_2.out #Log file (maybe u don't need it)
#SBATCH -N 1 #how many nodes u want 2 use
###SBATCH -w node[08]

export PATH=/opt/mpich-3.4.2/bin/:$PATH
export LD_LIBRARY_PATH=/opt/mpich-3.4.2/lib:$LD_LIBRARY_PATH
/opt/lammps-mpich-3.4.2/lmp_20210915 -sf omp -pk omp 8 -in BH-genStr.in
#mpirun -np 8 /opt/lammps-mpich-3.4.2/lmp_20210915 -in BH-genStr.in  # The total cpu have to match with the nodes cpu quantity you had use

#squeue       # qstat
#scancel  1   # Delete JOB NO. 1 
#scontrol show job 1  # Check job NO.1 detail



################################################## DEBUG
#yum install dos2unix  #######   install this when you got as follows error messages
#sbatch: error: Batch script contains DOS line breaks (\r\n)
#sbatch: error: instead of expected UNIX line breaks (\n).
#dos2unix filename 
