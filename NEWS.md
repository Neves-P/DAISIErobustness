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
* Interact and submit jobs to the Pergrine HPCC at the RUG.
* Generate parameter spaces used for geodynamics and trait dependence robustness
studies.
