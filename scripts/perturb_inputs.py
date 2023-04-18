import datetime
import os
import shutil

from functools import partial
from pathlib import Path

import netCDF4
from netCDF4 import Dataset


def perturb_input_data(date, perturb, name):
    # path to the trajectories dataset
    base = Path.cwd().parent

    aer_path = (
        base
        / "inputs"
        / "baseline"
        / "HYDE_BASE_Y2018"
        / f"OUTPUT_bwd_{date.strftime('%Y%m%d')}"
        / "EMISSIONS_0422"
        / f"{date.strftime('%Y%m%d')}_7daybwd_Hyde_traj_AER_{24-date.hour:02}_L3.nc"
    )
    ant_path = (
        base
        / "inputs"
        / "baseline"
        / "HYDE_BASE_Y2018"
        / f"OUTPUT_bwd_{date.strftime('%Y%m%d')}"
        / "EMISSIONS_0422"
        / f"{date.strftime('%Y%m%d')}_7daybwd_Hyde_traj_ANT_{24-date.hour:02}_L3.nc"
    )
    bio_path = (
        base
        / "inputs"
        / "baseline"
        / "HYDE_BASE_Y2018"
        / f"OUTPUT_bwd_{date.strftime('%Y%m%d')}"
        / "EMISSIONS_0422"
        / f"{date.strftime('%Y%m%d')}_7daybwd_Hyde_traj_BIO_{24-date.hour:02}_L3.nc"
    )
    met_path = (
        base
        / "inputs"
        / "baseline"
        / "HYDE_BASE_Y2018"
        / f"OUTPUT_bwd_{date.strftime('%Y%m%d')}"
        / "METEO"
        / f"METEO_{date.strftime('%Y%m%d')}_R{24-date.hour:02}.nc"
    )
    ini_path = (
        base / "settings" / "baseline" / date.strftime("%Y%m%d_T%H") / "settings.init"
    )

    if (
        (not aer_path.exists())
        or (not ant_path.exists())
        or (not bio_path.exists())
        or (not met_path.exists())
        or (not ini_path.exists())
    ):
        raise Exception(aer_path, ant_path, bio_path, met_path, ini_path)

    new_aer_path = (
        base
        / "inputs"
        / name
        / "HYDE_BASE_Y2018"
        / f"OUTPUT_bwd_{date.strftime('%Y%m%d')}"
        / "EMISSIONS_0422"
        / f"{date.strftime('%Y%m%d')}_7daybwd_Hyde_traj_AER_{24-date.hour:02}_L3.nc"
    )
    new_ant_path = (
        base
        / "inputs"
        / name
        / "HYDE_BASE_Y2018"
        / f"OUTPUT_bwd_{date.strftime('%Y%m%d')}"
        / "EMISSIONS_0422"
        / f"{date.strftime('%Y%m%d')}_7daybwd_Hyde_traj_ANT_{24-date.hour:02}_L3.nc"
    )
    new_bio_path = (
        base
        / "inputs"
        / name
        / "HYDE_BASE_Y2018"
        / f"OUTPUT_bwd_{date.strftime('%Y%m%d')}"
        / "EMISSIONS_0422"
        / f"{date.strftime('%Y%m%d')}_7daybwd_Hyde_traj_BIO_{24-date.hour:02}_L3.nc"
    )
    new_met_path = (
        base
        / "inputs"
        / name
        / "HYDE_BASE_Y2018"
        / f"OUTPUT_bwd_{date.strftime('%Y%m%d')}"
        / "METEO"
        / f"METEO_{date.strftime('%Y%m%d')}_R{24-date.hour:02}.nc"
    )
    new_ini_path = (
        base / "settings" / name / date.strftime("%Y%m%d_T%H") / "settings.init"
    )

    new_aer_path.parent.mkdir(parents=True, exist_ok=True)
    new_met_path.parent.mkdir(parents=True, exist_ok=True)
    new_ini_path.parent.mkdir(parents=True, exist_ok=True)

    shutil.copy2(aer_path, new_aer_path)
    shutil.copy2(ant_path, new_ant_path)
    shutil.copy2(bio_path, new_bio_path)
    shutil.copy2(met_path, new_met_path)

    aerds = Dataset(new_aer_path, "r+", format="NETCDF4")
    antds = Dataset(new_ant_path, "r+", format="NETCDF4")
    biods = Dataset(new_bio_path, "r+", format="NETCDF4")
    metds = Dataset(new_met_path, "r+", format="NETCDF4")

    perturb(aerds=aerds, antds=antds, biods=biods, metds=metds)

    aerds.sync()
    aerds.close()
    antds.sync()
    antds.close()
    biods.sync()
    biods.close()
    metds.sync()
    metds.close()

    with open(ini_path, "r") as file:
        settings = (
            file.read()
            .replace(
                f"INPUT_DIR  = '/scratch/project_2004394/JUNIPER/trajectories/inputs/{'baseline'}/HYDE_BASE_Y2018',",
                f"INPUT_DIR  = '/scratch/project_2004394/JUNIPER/trajectories/inputs/{name}/HYDE_BASE_Y2018',",
            )
            .replace(
                f"OUTPUT_DIR = '/scratch/project_2004394/JUNIPER/trajectories/outputs/{'baseline'}/{date.strftime('%Y%m%d_T%H')}',",
                f"OUTPUT_DIR = '/scratch/project_2004394/JUNIPER/trajectories/outputs/{name}/{date.strftime('%Y%m%d_T%H')}',",
            )
        )

    with open(new_ini_path, "w") as file:
        file.write(settings)


def assign_multiply_small(ds, v):
    ds[v][:] *= 1.01


def assign_divide_small(ds, v):
    ds[v][:] /= 1.01


def assign_add_small(ds, v):
    ds[v][:] += 0.04


def assign_subtract_small(ds, v):
    ds[v][:] -= 0.04


def assign_multiply_large(ds, v):
    ds[v][:] *= 1.5


def assign_divide_large(ds, v):
    ds[v][:] /= 1.5


def assign_add_large(ds, v):
    ds[v][:] += 2.0


def assign_subtract_large(ds, v):
    ds[v][:] -= 2.0


def perturb_anthropogenic(aerds, antds, biods, metds, perturb=lambda x: x):
    variables = [
        "co2",
        "nmvoc",
        "alcohols",
        "ethane",
        "propane",
        "butanes",
        "pentanes",
        "hexanes",
        "ethene",
        "propene",
        "acetylene",
        "isoprene",
        "monoterpenes",
        "other-alkenes-and-alkynes",
        "benzene",
        "toluene",
        "xylene",
        "trimethylbenzene",
        "other-aromatics",
        "esters",
        "ethers",
        "formaldehyde",
        "other-aldehydes",
        "total-ketones",
        "total-acids",
        "other-VOCs",  # "ch4", "so2", "nh3", "nox", "co",
    ]

    for v in variables:
        perturb(antds, v)


def perturb_biogenic(aerds, antds, biods, metds, perturb=lambda x: x):
    variables = [
        "acetaldehyde",
        "acetone",
        "butanes-and-higher-alkanes",
        "butenes-and-higher-alkenes",
        "ethane",
        "ethanol",
        "ethene",
        "formaldehyde",
        "hydrogen-cyanide",
        "isoprene",
        "MBO",
        "methanol",
        "methyl-bromide",
        "methyl-chloride",
        "methyl-iodide",
        "other-aldehydes",
        "other-ketones",
        "propane",
        "propene",
        "toluene",
        # "CH4", "CO", "DMS", "CH2Br2", "CHBr3", "CH3I",
        # "other-monoterpenes", "pinene-a", "pinene-b", "sesquiterpenes",
    ]

    for v in variables:
        perturb(biods, v)


def perturb_aerosols(aerds, antds, biods, metds, perturb=lambda x: x):
    variables = [
        "3-10nm",
        "10-20nm",
        "20-30nm",
        "30-50nm",
        "50-70nm",
        "70-100nm",
        "100-200nm",
        "200-400nm",
        "400-1000nm",
    ]

    for v in variables:
        perturb(aerds, v)


def perturb_monoterpenes(aerds, antds, biods, metds, perturb=lambda x: x):
    variables = [
        "other-monoterpenes",
        "pinene-a",
        "pinene-b",
    ]

    for v in variables:
        perturb(biods, v)


def perturb_sesquiterpenes(aerds, antds, biods, metds, perturb=lambda x: x):
    perturb(biods, "sesquiterpenes")


def perturb_anthropogenic_so2(aerds, antds, biods, metds, perturb=lambda x: x):
    perturb(antds, "so2")


def perturb_anthropogenic_nox(aerds, antds, biods, metds, perturb=lambda x: x):
    perturb(antds, "nox")


def perturb_temperature(aerds, antds, biods, metds, perturb=lambda x: x):
    perturb(metds, "t")


dates = [
    datetime.datetime(year=2018, month=5, day=14, hour=10),
    datetime.datetime(year=2018, month=5, day=15, hour=19),
    datetime.datetime(year=2018, month=5, day=17, hour=0),
    datetime.datetime(year=2018, month=5, day=19, hour=4),
    datetime.datetime(year=2018, month=5, day=21, hour=15),
    datetime.datetime(year=2018, month=5, day=23, hour=13),
]

for date in dates:
    perturb_input_data(
        date,
        partial(perturb_anthropogenic, perturb=assign_multiply_small),
        "perturbation/anthropogenic/mul_1.01",
    )
    perturb_input_data(
        date,
        partial(perturb_anthropogenic, perturb=assign_divide_small),
        "perturbation/anthropogenic/div_1.01",
    )

    perturb_input_data(
        date,
        partial(perturb_biogenic, perturb=assign_multiply_small),
        "perturbation/biogenic/mul_1.01",
    )
    perturb_input_data(
        date,
        partial(perturb_biogenic, perturb=assign_divide_small),
        "perturbation/biogenic/div_1.01",
    )

    perturb_input_data(
        date,
        partial(perturb_aerosols, perturb=assign_multiply_small),
        "perturbation/aerosols/mul_1.01",
    )
    perturb_input_data(
        date,
        partial(perturb_aerosols, perturb=assign_divide_small),
        "perturbation/aerosols/div_1.01",
    )

    perturb_input_data(
        date,
        partial(perturb_monoterpenes, perturb=assign_multiply_small),
        "perturbation/monoterpenes/mul_1.01",
    )
    perturb_input_data(
        date,
        partial(perturb_monoterpenes, perturb=assign_divide_small),
        "perturbation/monoterpenes/div_1.01",
    )

    perturb_input_data(
        date,
        partial(perturb_sesquiterpenes, perturb=assign_multiply_small),
        "perturbation/sesquiterpenes/mul_1.01",
    )
    perturb_input_data(
        date,
        partial(perturb_sesquiterpenes, perturb=assign_divide_small),
        "perturbation/sesquiterpenes/div_1.01",
    )

    perturb_input_data(
        date,
        partial(perturb_anthropogenic_so2, perturb=assign_multiply_small),
        "perturbation/so2/mul_1.01",
    )
    perturb_input_data(
        date,
        partial(perturb_anthropogenic_so2, perturb=assign_divide_small),
        "perturbation/so2/div_1.01",
    )

    perturb_input_data(
        date,
        partial(perturb_anthropogenic_nox, perturb=assign_multiply_small),
        "perturbation/nox/mul_1.01",
    )
    perturb_input_data(
        date,
        partial(perturb_anthropogenic_nox, perturb=assign_divide_small),
        "perturbation/nox/div_1.01",
    )

    perturb_input_data(
        date,
        partial(perturb_temperature, perturb=assign_add_small),
        "perturbation/temperature/add_0.04K",
    )
    perturb_input_data(
        date,
        partial(perturb_temperature, perturb=assign_subtract_small),
        "perturbation/temperature/sub_0.04K",
    )

    perturb_input_data(
        date,
        partial(perturb_anthropogenic, perturb=assign_multiply_large),
        "perturbation/anthropogenic/mul_1.5",
    )
    perturb_input_data(
        date,
        partial(perturb_anthropogenic, perturb=assign_divide_large),
        "perturbation/anthropogenic/div_1.5",
    )

    perturb_input_data(
        date,
        partial(perturb_biogenic, perturb=assign_multiply_large),
        "perturbation/biogenic/mul_1.5",
    )
    perturb_input_data(
        date,
        partial(perturb_biogenic, perturb=assign_divide_large),
        "perturbation/biogenic/div_1.5",
    )

    perturb_input_data(
        date,
        partial(perturb_aerosols, perturb=assign_multiply_large),
        "perturbation/aerosols/mul_1.5",
    )
    perturb_input_data(
        date,
        partial(perturb_aerosols, perturb=assign_divide_large),
        "perturbation/aerosols/div_1.5",
    )

    perturb_input_data(
        date,
        partial(perturb_monoterpenes, perturb=assign_multiply_large),
        "perturbation/monoterpenes/mul_1.5",
    )
    perturb_input_data(
        date,
        partial(perturb_monoterpenes, perturb=assign_divide_large),
        "perturbation/monoterpenes/div_1.5",
    )

    perturb_input_data(
        date,
        partial(perturb_sesquiterpenes, perturb=assign_multiply_large),
        "perturbation/sesquiterpenes/mul_1.5",
    )
    perturb_input_data(
        date,
        partial(perturb_sesquiterpenes, perturb=assign_divide_large),
        "perturbation/sesquiterpenes/div_1.5",
    )

    perturb_input_data(
        date,
        partial(perturb_anthropogenic_so2, perturb=assign_multiply_large),
        "perturbation/so2/mul_1.5",
    )
    perturb_input_data(
        date,
        partial(perturb_anthropogenic_so2, perturb=assign_divide_large),
        "perturbation/so2/div_1.5",
    )

    perturb_input_data(
        date,
        partial(perturb_anthropogenic_nox, perturb=assign_multiply_large),
        "perturbation/nox/mul_1.5",
    )
    perturb_input_data(
        date,
        partial(perturb_anthropogenic_nox, perturb=assign_divide_large),
        "perturbation/nox/div_1.5",
    )

    perturb_input_data(
        date,
        partial(perturb_temperature, perturb=assign_add_large),
        "perturbation/temperature/add_2K",
    )
    perturb_input_data(
        date,
        partial(perturb_temperature, perturb=assign_subtract_large),
        "perturbation/temperature/sub_2K",
    )
