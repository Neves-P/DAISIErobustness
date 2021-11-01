#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_DAISIErobustness
#SBATCH --output=/home/$USER/DAISIErobustness/install_DAISIErobustness.log
#SBATCH --mem=1GB

mkdir -p logs
mkdir -p results
ml R
Rscript -e "remotes::install_github('Neves-P/DAISIErobustness@revision_rates')"
