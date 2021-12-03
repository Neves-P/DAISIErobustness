#!/bin/bash
#SBATCH --time=0:05:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=start_robustness
#SBATCH --output=logs/start_robustness.log
#SBATCH --mem=2GB
#SBATCH --partition=gelifes

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
#   nonoceanic_land_bridge
#   trait_CES
#   oceanic
# replicates - Total number of replicates to be simulated, or are present in
#   the input simulation.
# distance_method - If the absolute or squared distance between nLTTs should be
#   computed. Options:
#     abs - (default)
#     squ
################################################################################
##### Before running make sure logs folder has been created! ####
## Usage example running simulations for the oceanic_ontogeny param space, 1000
## replicates, entire parameter space:
# git clone https://github.com/Neves-P/DAISIErobustness.git
# cd DAISIErobustness
# sbatch bash/submit_run_robustness_peregrine.sh oceanic_ontogeny 1000 novel_sim abs
#
## Usage example running analysis for the nonoceanic param space, 1000
## replicates, entire parameter space:
# git clone https://github.com/Neves-P/DAISIErobustness.git
# cd DAISIErobustness
# sbatch bash/submit_run_robustness_peregrine.sh nonoceanic 1000 analysis abs
################################################################################



# Start script
ml R

param_space_name=$1
replicates=$2
distance_method=$3

data_path=`Rscript -e "load('inst/extdata/$1.rda'); nrow($1)"`
for_length=`echo $var | awk '{ print substr( $0, 5 ) }'`
for_length=$(( ${for_length} - 1 ))

for (( param_set = 1; param_set <= $for_length; param_set++ ))
do
  sbatch bash/submit_run_robustness_param_set_regular_shorter.sh ${param_space_name} \
                                                             ${param_set} \
                                                             ${replicates} \
                                                             ${distance_method}
done
