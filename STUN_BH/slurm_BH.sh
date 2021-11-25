#!/bin/sh
#sed_anchor01
#SBATCH --output=STUN_BH.out
#SBATCH --job-name=BH
#SBATCH --nodes=1
##SBATCH --ntasks-per-node=8
##SBATCH --partition=16Cores
##SBATCH --exclude=node18,node20
rm -rf STUN_BH_out #remove old folders created by the previous lammps job
threads=`lscpu|grep "^CPU(s):" | sed 's/^CPU(s): *//g'`
export OMP_NUM_THREADS=$threads
export LD_LIBRARY_PATH=/opt/mpich-3.4.2/lib:$LD_LIBRARY_PATH
export PATH=/opt/mpich-3.4.2/bin:$PATH
#mpiexec /opt/lammps-mpich-3.4.2/lmp_20211104 -in ./BH-DNAPRo_85850.in
#mpiexec /opt/lammps-mpich-3.4.2/lmp_20211104 -in ./BH-genStr.in
/opt/lammps-mpich-3.4.2/lmp_20211104 -sf omp -pk omp $threads -in STUN_BH_main.in
