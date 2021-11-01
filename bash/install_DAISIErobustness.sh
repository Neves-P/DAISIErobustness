#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_DAISIEmainland
#SBATCH --output=/data/$USER/DAISIErobustness/install_DAISIEmainland.log
#SBATCH --mem=1GB

mkdir -p logs
mkdir -p results
ml R
Rscript -e "remotes::install_github('Neves-P/DAISIErobustness@revision_rates')"
