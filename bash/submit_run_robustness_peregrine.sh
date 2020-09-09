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

git clone https://github.com/Neves-P/DAISIErobustness.git || (cd DAISIErobustness ; git pull)

# See DAISIErobustness::run_robustness() documentation for help.
# Arguments to follow the Rscript are as follows:
param_space_name=$1
replicates=$2
pipeline=$3
distance_method=$4
replicate_range_start=$5
replicate_range_end=$6
load_from_file=$7

for_length= wc -l DAISIErobustness/data/${param_space_name}.csv
for_length=$(( $for_length - 1 ))

for param_set in {1..${for_length}}
do
  sbatch DAISIErobustness/bash/submit_run_robustness_param_set.sh ${param_space_name} \
                                                             $param_set \
                                                             ${replicates} \
                                                             ${pipeline} \
                                                             ${distance_method} \
                                                             ${replicate_range_start} \
                                                             ${replicate_range_end} \
                                                             ${load_from_file}
done
