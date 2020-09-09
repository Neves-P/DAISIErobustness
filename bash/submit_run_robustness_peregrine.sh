#!/bin/bash
#SBATCH --time=0:05:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=start_robustness
#SBATCH --output=logs/start_robustness.log
#SBATCH --mem=1GB
#SBATCH --partition=short


# Before running make sure logs folder has been created.
mkdir -p results
ml R

git clone https://github.com/Neves-P/DAISIErobustness.git || (cd DAISIErobustness ; git pull)

# See DAISIErobustness::run_robustness() documentation for help.
# Arguments to follow the Rscript are as follows:
param_space_name=$1
param_set=$2
replicates=$3
pipeline=$4
distance_method=$5
replicate_range_start=$6
replicate_range_end=$7
load_from_file=$7


  sbatch DAISIErobustness/submit_run_robustness_param_set.sh ${param_space_name} \
                                                             $pararm_set \
                                                             ${replicates} \
                                                             ${pipeline} \
                                                             ${distance_method} \
                                                             ${replicate_range_start} \
                                                             ${replicate_range_end} \
                                                             ${load_from_file}
done
