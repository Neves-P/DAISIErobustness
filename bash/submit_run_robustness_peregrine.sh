#!/bin/bash
#SBATCH --time=9-23:05:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=robustness
#SBATCH --output=logs/robustness.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

# Before running make sure logs folder has been created.
mkdir -p results
ml R

# Arguments to follow the Rscript are as follows:
# See DAISIErobustness::run_robustness() documentation for help.
# param_space_name <- args[1]
# param_set <- args[2]
# replicates <- args[3]
# pipeline <- args[4]
# distance_method <- args[5]
# replicate_range_start <- args[6]
# replicate_range_end <- args[7]
# load_from_file <- args[8]

param_space_name=$1

git clone https://github.com/Neves-P/DAISIErobustness.git || (cd DAISIErobustness ; git pull)
Rscript -e "remotes::install_github('Neves-P/DAISIErobustness')"
Rscript DAISIErobustness/scripts/run_robustness_peregrine.R param_space_name