#!/bin/bash
#SBATCH --time=0:05:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=start_robustness
#SBATCH --output=logs/start_robustness.log
#SBATCH --mem=1GB
#SBATCH --partition=short

# DAISIErobustness: Test the Robustness of DAISIE to Geodynamics and Traits
# Copyright (C) 2020 Joshua W. Lambert, Pedro Neves, Shu Xie
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

################################ Usage #########################################
# This bash script submits one entire DAISIErobustness parameter space as a    #
# set of individual jobs. Submissions are made to the GELIFES partition. Note  #
# that only up to 1000 jobs may be running/pending in the GELIFES partition    #
# per user.                                                                    #
################################################################################
### Arguments ###
# param_space_name - Name of parameter space to run. Options:
#   oceanic_ontogeny
#   oceanic_sea_level
#   oceanic_ontogeny_sea_level
#   nonoceanic
#   nonoceanic_sea_level
#   nonoceanic_land_bridge
#   trait_CES
#   trait_trans
#   oceanic
# replicates - Total number of replicates to be simulated, or are present in
#   the input simulation.
# pipeline - Whether the full pipeline should run, only the simulations, or only
#   the analysis. Options:
#     full - runs simulations followed analysis.
#     novel_sim - runs only simulation portion of pipeline and returns output.
#     analysis - runs only analysis portion of pipeline and returns output.
# distance_method - If the absolute or squared distance between nLTTs should be
#   computed. Options:
#     abs - (default)
#     squ
# replicate_range_start - NULL or integer. If NULL, analysis will be done on all
#   replicates. If an integer, then the value will mark the start of the window
#   of replicates to be analysed.
# replicate_range_end - NULL or integer. If NULL, analysis will be done on all
#   replicates. If an integer, then the value will mark the end of the window
#   of replicates to be analysed.
# load_from_file - Boolean. FALSE indicates the simulations used in the analysis
#   portion of the pipeline will not be loaded from a file and are expected to
#   be created beforehand or by the pipeline call itself. TRUE indicates
#   simulations are to be read from disk in the home/$USER/sims/ directory.
#   For a "full" or "novel_sim" pipeline, the normal use is FALSE.
#   For an "analysis" run, TRUE is usually used.
#   This argument allows decoupling simulation and analysis jobs.
################################################################################
##### Before running make sure logs folder has been created! ####
## Usage example running simulations for the oceanic_ontogeny param space, 1000
## replicates, entire parameter space:
# git clone https://github.com/Neves-P/DAISIErobustness.git
# sbatch DAISIErobustness/bash/submit_run_robustness_peregrine.sh oceanic_ontogeny 1000 novel_sim abs NULL NULL FALSE
#
## Usage example running analysis for the nonoceanic param space, 1000
## replicates, entire parameter space:
# git clone https://github.com/Neves-P/DAISIErobustness.git
# sbatch DAISIErobustness/bash/submit_run_robustness_peregrine.sh nonoceanic 1000 analysis abs NULL NULL TRUE
################################################################################



# Start script
ml R
Rscript -e "remotes::install_github('Neves-P/DAISIErobustness')"

param_space_name=$1
replicates=$2
pipeline=$3
distance_method=$4
replicate_range_start=$5
replicate_range_end=$6
load_from_file=$7

for_length=`wc -l DAISIErobustness/data/${param_space_name}.csv | cut -f1 -d' '`
for_length=$(( ${for_length} - 1 ))

for (( param_set = 1; param_set <= $for_length; param_set++ ))
do
  sbatch DAISIErobustness/bash/submit_run_robustness_param_set.sh ${param_space_name} \
                                                             ${param_set} \
                                                             ${replicates} \
                                                             ${pipeline} \
                                                             ${distance_method} \
                                                             ${replicate_range_start} \
                                                             ${replicate_range_end} \
                                                             ${load_from_file}
done
