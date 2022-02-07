# DAISIErobustness 2.3.0

# DAISIErobustness 2.2.1

* Change plot legend to read "colonisation multiplier" rather than "immigration multiplier".

# DAISIErobustness 2.2.0

* Completely rework all plotting functions for Santos Neves, Lambert, Valente, and Etienne  2021. Scripts associated with the paper can be found in the `scripts/folder/` and the necessary functions are found in the sub directory `scripts/folder/functions`.
* Add functions for reading log files and checking checking correlations between error and run time. Functions are `calc_ed95_param_set()`, `read_runtime_log()`, `read_param_space_log()`, `read_param_set_log()`, `get_runtime_params()`, `calc_runtime_ed95_cor()`, and `plot_cor()`.
* Rename `calc_stat_diff()` to `calc_ed_95_for_plot()`. This is the function upon which
the plotting functions for publications rely. Add tests for this function.
* `load_param_space()` no longer uses the function `read_csv2()` from the `readr` package in favour of base R `read.csv2()`. This change was prompted by the release of `readr` v2.0.0, which parses column types in a different way, resulting in the incorrect reading of `K` from the parameter spaces. Either character vectors or `NA`s were returned due to a combination of ',' as decimal and `Inf` in the data set. The change to `read.csv()` is functionally the same.
* Improve `run_robustness()` documentation.


# DAISIErobustness 2.1.1

* Depend on DAISIE v4.0.2 to make use of all of it's corrections. See [here](https://github.com/rsetienne/DAISIE/blob/master/NEWS.md#daisie-402) for  DAISIE v4.0.0, v4.0.1 and v4.0.2 patch notes for details on the changes.

# DAISIErobustness 2.1.0

* RNG is no longer seeded it `1L` by default. The seed used for each parameter set is now chosen from the current system time and parameter set index.
* ML runs again fail when computed loglikelihood is `Inf`.
* Depend on DAISIE v3.2.1.
* Add a number of plotting functions and scripts, which live on `scripts/plots/`.
* Change traits, nonoceanic (termed continental island on the paper), and nonoceanic sea-level parameter spaces.
* Add better metadata on HPCC log files.
* Move analysis scripts files from `scripts/` to `scripts/analysis/`.

# DAISIErobustness 2.0.0

* Rework pipeline flow. `pipeline`, `load_from_file`, `replicate_range` removed as arguments from `run_robustness()`. No longer possible to run the simulation part of the pipeline separately from the analysis part.
* Failed ML runs will now result in a new generating simulation being run to overcome numerical issues in MLE. This results in the output of `run_robustness()` directly matching the number of replicates (barring run time constraints).
* New traits parameter space. These are now split into two files called `trait_CES.csv` and `trait_trans.csv`.
* Add regular partition job scripts for Peregrine HPCC.
* Improved geodynamics plots in `scripts/`.
* Add new `calc_stat_diff()` unexported function in `scripts/`for data analysis.
* Add new `extract_error_metrics()` unexported function in `scripts/`for data analysis.
* Fix bug in calculation of number of mainland species in the traits model.
* Minor documentation improvements.

# DAISIErobustness 1.1.2

* Rework `decide_best_pars()` to intelligently salvage failed ML convergence whenever possible.
* Request less memory from the Peregrine HPCC.

# DAISIErobustness 1.1.1

* Pipeline now conditions all simulations and MLE on a minimum of 5 colonising
lineages.
* Removed `sim_constraints()`.
* New traits parameter space.

# DAISIErobustness 1.1.0

* Rework [Peregrine HPC](https://www.rug.nl/society-business/centre-for-information-technology/research/services/hpc/facilities/peregrine-hpc-cluster?lang=en) job submission. Job submissions done by calling `sbatch`
on `/DAISIErobustness/bash/submit_run_robustness_peregrine.sh`.
* `run_robustness_peregrine.R` is no longer a function, but an R script that
runs the pipeline on Peregrine.
* Include improved DAISIE traits parameter space.
* Depend on rsetienne/DAISIE@v3.0.1 (which is also the CRAN release).

# DAISIErobustness 1.0.3

* Use correct diversity-dependence settings when estimating using `calc_ml()`.
See #43.
* Depend on rsetienne/DAISIE@25d0285, which is DAISIE v3.0.0 but prior to CRAN
release.

# DAISIErobustness 1.0.2

* Finalize nonoceanic land bridge parameter space.
* Improve Peregrine HPCC job submission scripts `simulation_run_script` and add 
`analysis_run_script`. Can now choose number of max concurrent jobs. 
Improvements to parameter set range selection.
* Remove deprecated code from scripts folder.
* Move and add images to `/pics/`.

# DAISIErobustness 1.0.1

* Fix bug in `ml_constraints` when one of the `initpars` attempts in 
`run_analysis()` did not converge, which prevented some `failed_cond_` results 
from being saved on Peregrine.
* Depend on rsetienne/DAISIE@dd54db2.
* Add revised geodynamics parameter spaces for robustness study.
* Slightly better test coverage in the pipeline when ML convergence fails.
* Vignette is in correct location.

# DAISIErobustness 1.0.0

* Package to test the robustness of island biogeography models.
* Simulate new geodynamics and trait dependent models using the
DAISIE model.
* Pipeline to analyse the robustness of the DAISIE ML inference to the newly 
implemented models.
* Can read any new model input in the DAISIE format regardless of generating 
model from a file.
* Store intermediate simulation output and read said output to finish analyses
and save to file.
* Interact and submit jobs to the Peregrine HPCC at the RUG.
* Generate parameter spaces used for geodynamics and trait dependence robustness
studies.
