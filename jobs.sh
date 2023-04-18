#!/bin/bash

#SBATCH --job-name=SOSAA_JT
#SBATCH --account=project_2004394
#SBATCH --mem-per-cpu=2000M
#SBATCH --partition=small
#SBATCH --mail-type=END
#SBATCH --mail-user=juniper.tyree@helsinki.fi
#SBATCH --output=logs/sosaa/sosaa_%j.out
#SBATCH --tasks=40
#SBATCH -N 1
#SBATCH --array=1-59
#SBATCH --time 08:00:00

module purge

echo "Loading modules"

module load gcc
module load openmpi
module load netcdf-c
module load netcdf-fortran
module load fftw
module load eccodes

echo "Finished loading modules"

cd /projappl/project_2004394/GOS/casedir/sample_aerosol

case $SLURM_ARRAY_TASK_ID in
1)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180514_T06/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180514_T08/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180514_T09/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180514_T10/settings.init
wait
;;
2)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180514_T11/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180514_T12/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180514_T14/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.01/20180514_T10/settings.init
wait
;;
3)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.01/20180514_T10/settings.init
wait
;;
4)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.01/20180514_T10/settings.init
wait
;;
5)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.01/20180514_T10/settings.init
wait
;;
6)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.01/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_0.04K/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_0.04K/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.5/20180514_T10/settings.init
wait
;;
7)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.5/20180514_T10/settings.init
wait
;;
8)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.5/20180514_T10/settings.init
wait
;;
9)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.5/20180514_T10/settings.init
wait
;;
10)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.5/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_2K/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_2K/20180514_T10/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180515_T15/settings.init
wait
;;
11)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180515_T17/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180515_T18/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180515_T20/settings.init
wait
;;
12)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180515_T21/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180515_T23/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.01/20180515_T19/settings.init
wait
;;
13)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.01/20180515_T19/settings.init
wait
;;
14)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.01/20180515_T19/settings.init
wait
;;
15)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.01/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.01/20180515_T19/settings.init
wait
;;
16)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_0.04K/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_0.04K/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.5/20180515_T19/settings.init
wait
;;
17)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.5/20180515_T19/settings.init
wait
;;
18)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.5/20180515_T19/settings.init
wait
;;
19)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.5/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.5/20180515_T19/settings.init
wait
;;
20)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_2K/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_2K/20180515_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180516_T20/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180516_T22/settings.init
wait
;;
21)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180516_T23/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180517_T01/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180517_T02/settings.init
wait
;;
22)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180517_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.01/20180517_T00/settings.init
wait
;;
23)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.01/20180517_T00/settings.init
wait
;;
24)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.01/20180517_T00/settings.init
wait
;;
25)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.01/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_0.04K/20180517_T00/settings.init
wait
;;
26)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_0.04K/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.5/20180517_T00/settings.init
wait
;;
27)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.5/20180517_T00/settings.init
wait
;;
28)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.5/20180517_T00/settings.init
wait
;;
29)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.5/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_2K/20180517_T00/settings.init
wait
;;
30)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_2K/20180517_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180519_T00/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180519_T02/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180519_T03/settings.init
wait
;;
31)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180519_T05/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180519_T06/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180519_T08/settings.init
wait
;;
32)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.01/20180519_T04/settings.init
wait
;;
33)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.01/20180519_T04/settings.init
wait
;;
34)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.01/20180519_T04/settings.init
wait
;;
35)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.01/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_0.04K/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_0.04K/20180519_T04/settings.init
wait
;;
36)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.5/20180519_T04/settings.init
wait
;;
37)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.5/20180519_T04/settings.init
wait
;;
38)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.5/20180519_T04/settings.init
wait
;;
39)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.5/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_2K/20180519_T04/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_2K/20180519_T04/settings.init
wait
;;
40)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180521_T11/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180521_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180521_T14/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180521_T15/settings.init
wait
;;
41)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180521_T16/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180521_T17/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180521_T19/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.01/20180521_T15/settings.init
wait
;;
42)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.01/20180521_T15/settings.init
wait
;;
43)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.01/20180521_T15/settings.init
wait
;;
44)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.01/20180521_T15/settings.init
wait
;;
45)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.01/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_0.04K/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_0.04K/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.5/20180521_T15/settings.init
wait
;;
46)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.5/20180521_T15/settings.init
wait
;;
47)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.5/20180521_T15/settings.init
wait
;;
48)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.5/20180521_T15/settings.init
wait
;;
49)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.5/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_2K/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_2K/20180521_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180523_T09/settings.init
wait
;;
50)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180523_T11/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180523_T12/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180523_T14/settings.init
wait
;;
51)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180523_T15/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/baseline/20180523_T17/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.01/20180523_T13/settings.init
wait
;;
52)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.01/20180523_T13/settings.init
wait
;;
53)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.01/20180523_T13/settings.init
wait
;;
54)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.01/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.01/20180523_T13/settings.init
wait
;;
55)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_0.04K/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_0.04K/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/mul_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/anthropogenic/div_1.5/20180523_T13/settings.init
wait
;;
56)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/mul_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/biogenic/div_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/mul_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/aerosols/div_1.5/20180523_T13/settings.init
wait
;;
57)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/mul_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/monoterpenes/div_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/mul_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/sesquiterpenes/div_1.5/20180523_T13/settings.init
wait
;;
58)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/mul_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/so2/div_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/mul_1.5/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/nox/div_1.5/20180523_T13/settings.init
wait
;;
59)
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/add_2K/20180523_T13/settings.init
srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/perturbation/temperature/sub_2K/20180523_T13/settings.init
wait
;;

esac
