import datetime

dates = [
    datetime.datetime(year=2018, month=5, day=14, hour=10),
    datetime.datetime(year=2018, month=5, day=15, hour=19),
    datetime.datetime(year=2018, month=5, day=17, hour=0),
    datetime.datetime(year=2018, month=5, day=19, hour=4),
    datetime.datetime(year=2018, month=5, day=21, hour=15),
    datetime.datetime(year=2018, month=5, day=23, hour=13),
]

print("#!/bin/bash")
print()
print("#SBATCH --job-name=SOSAA_JT")
print("#SBATCH --account=project_2004394")
print("#SBATCH --mem-per-cpu=2000M")
print("#SBATCH --partition=small")
print("#SBATCH --mail-type=END")
print("#SBATCH --mail-user=juniper.tyree@helsinki.fi")
print("#SBATCH --output=logs/sosaa/sosaa_%j.out")
print("#SBATCH --tasks=40")
print("#SBATCH -N 1")
print(f"#SBATCH --array=1-{(3 + len(dates)*(7+32))//4}")
print("#SBATCH --time 08:00:00")
print()
print("module purge")
print()
print('echo "Loading modules"')
print()
print("module load gcc")
print("module load openmpi")
print("module load netcdf-c")
print("module load netcdf-fortran")
print("module load fftw")
print("module load eccodes")
print()
print('echo "Finished loading modules"')
print()
print("cd /projappl/project_2004394/GOS/casedir/sample_aerosol")
print()
print("case $SLURM_ARRAY_TASK_ID in")

i = 0

for traj_date in dates:
    for dh in [-4, -2, -1, 0, 1, 2, 4]:
        date = traj_date + datetime.timedelta(hours=dh)

        if i % 4 == 0:
            if i > 0:
                print("wait\n;;")
            print(f"{i//4 + 1})")

        print(
            f"srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/{'baseline'}/{date.strftime('%Y%m%d_T%H')}/settings.init"
        )

        i += 1

    for perturbation in [
        "perturbation/anthropogenic/mul_1.01",
        "perturbation/anthropogenic/div_1.01",
        "perturbation/biogenic/mul_1.01",
        "perturbation/biogenic/div_1.01",
        "perturbation/aerosols/mul_1.01",
        "perturbation/aerosols/div_1.01",
        "perturbation/monoterpenes/mul_1.01",
        "perturbation/monoterpenes/div_1.01",
        "perturbation/sesquiterpenes/mul_1.01",
        "perturbation/sesquiterpenes/div_1.01",
        "perturbation/so2/mul_1.01",
        "perturbation/so2/div_1.01",
        "perturbation/nox/mul_1.01",
        "perturbation/nox/div_1.01",
        "perturbation/temperature/add_0.04K",
        "perturbation/temperature/sub_0.04K",
        "perturbation/anthropogenic/mul_1.5",
        "perturbation/anthropogenic/div_1.5",
        "perturbation/biogenic/mul_1.5",
        "perturbation/biogenic/div_1.5",
        "perturbation/aerosols/mul_1.5",
        "perturbation/aerosols/div_1.5",
        "perturbation/monoterpenes/mul_1.5",
        "perturbation/monoterpenes/div_1.5",
        "perturbation/sesquiterpenes/mul_1.5",
        "perturbation/sesquiterpenes/div_1.5",
        "perturbation/so2/mul_1.5",
        "perturbation/so2/div_1.5",
        "perturbation/nox/mul_1.5",
        "perturbation/nox/div_1.5",
        "perturbation/temperature/add_2K",
        "perturbation/temperature/sub_2K",
    ]:
        if i % 4 == 0:
            if i > 0:
                print("wait\n;;")
            print(f"{i//4 + 1})")

        print(
            f"srun -n 10 --exclusive /projappl/project_2004394/GOS/casedir/sample_aerosol/SOSAA_ARCA.exe /scratch/project_2004394/JUNIPER/trajectories/settings/{perturbation}/{traj_date.strftime('%Y%m%d_T%H')}/settings.init"
        )

        i += 1

print("wait\n;;")
print()
print("esac")
