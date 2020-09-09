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

# See DAISIErobustness::run_robustness() documentation for help.
# Arguments to follow the Rscript are as follows:
param_space_name=$1
param_set=$2
replicates=$3
pipeline=$4
distance_method=$5
replicate_range_start=$6
replicate_range_end=$7
load_from_file=$8

for_length=wc -l DAISIErobustness/data/${param_space_name}.csv
for_length=for_length-1

Rscript -e "remotes::install_github('Neves-P/DAISIErobustness')"
Rscript DAISIErobustness/scripts/run_robustness_peregrine.R ${param_space_name} \
                                                            ${param_set} \
                                                            ${replicates} \
                                                            ${pipeline} \
                                                            ${distance_method} \
                                                            ${replicate_range_start} \
                                                            ${replicate_range_end} \
                                                            ${load_from_file}


