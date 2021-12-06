#!/bin/bash
#SBATCH --time=03:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=short_robustness
#SBATCH --output=logs/robustness-%j.log
#SBATCH --mem=2GB
#SBATCH --partition=regular

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

################################################################################
# This script is not to be called directly, but by the                         #
# submit_run_robustness_peregrine.sh script found in the same folder.          #
################################################################################

# See DAISIErobustness::run_robustness() documentation for help.
# See also DAISIErobustness/bash/submit_run_robustness_peregrine.sh for help.
# Arguments to follow the Rscript are as follows:
param_space_name=$1
param_set=$2
replicates=$3
distance_method=$4

ml R
Rscript scripts/analysis/run_robustness_peregrine.R ${param_space_name} \
                                                    ${param_set} \
                                                    ${replicates} \
                                                    ${distance_method}


