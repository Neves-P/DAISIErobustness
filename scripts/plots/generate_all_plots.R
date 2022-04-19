# DAISIErobustness: Test the Robustness of DAISIE to Geodynamics and Traits
# Copyright (C) 2022 Joshua W. Lambert, Pedro Neves, Shu Xie
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


#### INSTRUCTIONS ####
# Generates all plots for Santos Neves et al 2022.
# THIS SCRIPT ASSUMES A WINDOWS x64 PLATFORM IS USED!
#
# To run this script ensure that all results files are within a folder named
# /results. This can live anywhere in your system, and you will be prompted for
# the path later.
# The most up-to-date results can be obtained by running the pipeline
# with the most recent version of the packages, or by downloading from the
# following zenodo repository: https://doi.org/10.5281/zenodo.5119924
# Please clone the repository to a local directory by running
# git clone https://github.com/Neves-P/DAISIErobustness.git
# Ensure your current directory is the DAISIErobustness package root
# (i.e. ~/DAISIErobustness/).
# Finally, run the code below. The resulting files will be placed in the
# DAISIErobustness/ directory.

#### RUN ####
rm(list = ls())
library(DAISIErobustness)

source("scripts/plots/area_through_time.R")

rm(list = ls())
library(DAISIErobustness)
source("scripts/plots/ed95_histograms.R")

rm(list = ls())
library(DAISIErobustness)
source("scripts/plots/all_scenarios_stripchart.R")

rm(list = ls())
library(DAISIErobustness)
source("scripts/plots/ontogeny_sea_level_hyperpars_stripchart.R")

rm(list = ls())
library(DAISIErobustness)
source("scripts/plots/oceanic_sea_level_island_gradient_stripchart.R")

rm(list = ls())
library(DAISIErobustness)
source("scripts/plots/continental_land_bridge_multiplier_stripchart.R")

rm(list = ls())
library(DAISIErobustness)
source("scripts/plots/continental_land_bridge_sample_pars_stripchart.R")

rm(list = ls())
library(DAISIErobustness)
source("scripts/plots/continental_sample_pars_stripchart.R")

rm(list = ls())
library(DAISIErobustness)
source("scripts/plots/runtime_correlation_plots.R")

