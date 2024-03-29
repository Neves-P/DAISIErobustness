# DAISIErobustness
DAISIErobustness is an R package for testing of the robustness of the island biogeography model "[DAISIE](https://github.com/rsetienne/DAISIE)" (_Dynamical Assembly of Islands by Speciation, Immigration and Extinction_)  to more complex and potentially more realistic evolutionary models. Different measures of error of number of species, endemics, non-endemics and evolutionary trajectories are used to determine whether the alternative models can influence the inference capabilities of the current DAISIE model.

## What is DAISIE?
DAISIE is an evolutionary island biogeography model that allows for the estimation of diversification rates and other relevant diversification parameters on islands using phylogenetic data. These are:
* Cladogenesis rate
* Anagenesis rate
* (Clade-specific or island-wide) carrying capacity 
* Migration rate
* Extinction rate

The estimation of such parameters is achieved using Maximum-Likelihood optimization, following the DAISIE likelihood functions described in published literature<sup>1</sup>.
The performance of DAISIE inference given the amount and quality of data has been studied as well. It was shown to perform well, particularly when phylogenetic data is available<sup>2</sup>.

Furthermore, DAISIE includes simulation code allowing for the simulation of data following the above mentioned parameters.

## DAISIErobustness pipeline
DAISIErobustness consists of a pipeline designed to measure the error one creates when extending the standard DAISIE model with new features. Examples of such new additions include the modelling of island ontogeny, as per the General Dynamic Model<sup>3</sup>, sea level changes<sup>4</sup>, and non-oceanic scenarios. The error measure is obtained by simulating and comparing DAISIE data using simulation code that builds upon the existing DAISIE simulations by including geodynamic processes.

![Figure 1 - The DAISIErobustness pipeline](https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/scripts/Neves_et_al_2020/figure_1.png) 
### Pipeline steps
1. In its current implementation, DAISIErobustness begins by simulating data using a new model (in this case, a geodyanamical or trait dependent model) (Fig. 1.1). Alternatively, the pipeline could run with a set of previously generated data, yet some minor coding adaptations are required on the current version to enable this feature. This would allow the focal model and data to be generated externally, even outside of an R environment. Ideally, one would generate many replicates per set of generating parameters. This pipeline supports a **minimum** of 2 replicates per generating parameter set, but simulating 1000 replicates is recommended.
Note that one can select from a number of implemented geodynamics simulations. See Appendices for more information.
2. Data is formatted to the DAISIE format, which requires reconstructed phylogenetic information (_sensu_ Nee et al. 1994), under the form of branching times. For an example of acceptable DAISIE output, please see the output of the function `run_robustness()` with the argument `pipeline = novel_sim` in DAISIErobustness or `DAISIE_sim()` in the DAISIE package.
3. The DAISIE likelihood inference routine is applied to the previously generated or supplied data (Fig 1.2). This results in a set of likelihood estimated parameters and log-ikelihood for each of the replicates generated in steps 1-2. Note that this estimation procedure is entirely blind to whichever new processes were introduced to generate the initial data.
4. A new set of simulations is ran. The generating parameters of these simulations are the estimates obtained in step 4, and one replicate is simulated per set of generating parameters. These simulations **do not** include any of the realistic features that characterize the simulations in step 1, but instead are a set standard oceanic DAISIE simulations and follow the same model as the inference procedure. At this stage, the error, _E_ (dashed line in Fig. 1), introduced by using an estimation model (step 4) that does not match the generating model (step 1) can be computed. This error is obtained by comparing the generating data (Fig 1.1) with the data obtained in step 4. See Appendices for description of error metrics computed.
5. As in step 3, each resulting simulation is taken only as a reconstructed phylogeny (more precisely, as branching times and endemic status through time).
6. Similarly to step 3, likelihood estimation is performed in each simulation resulting from step 5.
7. As in step 4, each obtained set of parameter estimates is used to simulate a standard, oceanic DAISIE data set. The pairwise baseline error, _E<sub>B</sub>_, (dashed line in Figure 1) is computed between the simulations obtained in steps 4 and 7. The baseline error corresponds to the error inherent in the parameter estimation procedure, and the stochasticity of the simulations. The same metrics as in step 4 are obtained, see Appendices for more information.

## Example of a local run
The already available models can easily be run by calling the main function `run_robustness()`.  The parameter space and models this function can accept are stored in the [data](https://github.com/Neves-P/DAISIErobustness/tree/master/data) folder, and were generated by running the [`generate_param_space.R`](https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/scripts/Neves_et_al_2020/generate_param_space.R) script. The available parameter spaces are:
* Continental: `continental` 
* Continental with land bridges: `continental_land_bridge`
* Oceanic ontogeny: `oceanic_ontogeny`
* Oceanic ontogeny with sea-level changes: `oceanic_ontogeny_sea_level`
* Oceanic with sea-level changes: `oceanic_sea_level`
* Trait dependency with CES(colonization,extinction and speciation) rates changes:  `trait_CES`

The codes in mono-spaced font serve as arguments for the `run_robustness()` function. Then, the corresponding csv parameter space is read from the GitHub repository to the function scope, so that the pipeline can begin.

### Loading a new parameter set onto DAISIErobustness

The currently implemented DAISIE parameter sets are stored in the folder mentioned in the previous section. The easiest way to run additional parameter sets using the current geodynamics simulations is to fork this repository and change or upload new files to the `/data` folder. Do note that if this is done, the `load_param_space()` function should be changed so that the domain URL reflects the user's fork.

An example of an edited `load_param_space()` function to run of a fork owned by joshwlambert:

```r
load_param_space <- function(param_space_name) {
  file_domain <-
    "https://raw.githubusercontent.com/joshwlambert/DAISIErobustness/master/data/"
  file <- paste0(file_domain, param_space_name, ".csv")
  param_space <- readr::read_csv2(
    file = file
  )
  return(param_space)
}
```
`load_param_space()` should now read the correct files from the folder in the fork at the joshwlambert account.

### Using a different generating model
TBC, maybe break into another page

### Example pipeline for oceanic ontogeny 
````r
run_robustness(
   param_space_name = "oceanic_ontogeny",
   param_set = 1,
   replicates = 10,
   save_output = TRUE
  )
````

This code will start the pipeline for the first parameter set in the oceanic ontogeny parameter space. The first parameter set corresponds to the first line in the matching csv file. 10 oceanic ontogeny repicates will run.

When `save_output = TRUE`, all the objects generated by the pipeline will be stored in the package's root folder, into `/results/param_space_name`, `param_space_name` corresponding to parameter spaced given when the function is called. **At the moment, if saving is desired, these folders must be present in the system beforehand!**
If `save_output = FALSE`, then the objects will be returned by the function, allowing them to be saved to an R object and handled in an interactive session.

## Appendices

### Parameters
The parameter currently implemented can be found [here](https://github.com/Neves-P/DAISIErobustness/tree/master/data). New parameter sets can be generated using this [this](https://github.com/Neves-P/DAISIErobustness/blob/master/scripts/Neves_et_al_2020/generate_param_space.R) helpful script.

### Error metrics

The following results are used to determine the error between models:
* The nLTT<sup>5</sup> statistic for endemic species, non-endemic species and all species.
* The difference at the end of the simulation of the number of species, endemic and nonendemic species.

These metrics are then aggregated between all replicates of a given parameter space in the following way:
* Mean and standard deviation in the difference of all nLTTs
* Mean and standard deviation of number of species, endemics and nonendemics

### Simulation and likelihood constraints

Given the stochastic nature of the simulation models, and that given the very nature of these studies the properties of the simulated output are not known, some constraints must be made on the simulated data and likelihood estimates. When the data generated by a simulations of a certain parameter space does not respect the constraints, these data are saved (to the degree they are generated) but not analysed.

#### Simulation constraints

To ensure that appropriate data is simulated by the model in study, i.e. the data has enough phylogenetic information but is not so large as to become unwieldy and unrealistic simulations are constrained in total number of species and total number of colonising lineages. These constraints are computed by `sim_constraints()`.

The currently implemented constraints for the simulations are:
* Proportion of replicates with 15 or more species must be > 95%
* Proportion of replicates with 5 or more colonizations (independent lineages) must be > 95%
* Proportion of replicates with 100 or less species must be < 95%

#### ML constraints

As occasionally the MLE routine may crash or not converge, we also restrict the the pipeline on the number of successful parameter estimations. These constraints are checked by `ml_constraints()`. A parameter set will be skipped if any of the MLE runs crashed or failed to converge.

### University of Groningen Peregrine HPCC integration

This package contains code that interfaces directly with the [Peregrine HPCC](https://wiki.hpc.rug.nl/peregrine/start) available for use by researchers and students at the University of Groningen. To make use of such functionality, it is required to have a University of Groningen account, with access to Peregrine. The interface was developed and implemented by using Giovanni Laudanno's ([@Giappo](https://github.com/Giappo/)) [jap package](https://github.com/Giappo/jap). As such, this package is required for using this functionality. Please refer to the package's homepage for more documentation, and contact any of DAISIErobustness' authors for help setting this up on your end, assuming you have Peregrine access.

## References
<sup>1</sup>Valente, Luis M., Albert B. Phillimore, and Rampal S. Etienne. "Equilibrium and non‐equilibrium dynamics simultaneously operate in the Galápagos islands." _Ecology letters_ 18.8 (2015): 844-852.

<sup>2</sup>Valente, Luis, Albert B. Phillimore, and Rampal S. Etienne. "Using molecular phylogenies in island biogeography: it’s about time." _Ecography_ 182 (2018): 820.

<sup>3</sup>Whittaker, Robert J., Kostas A. Triantis, and Richard J. Ladle. "A general dynamic theory of oceanic island biogeography." _Journal of Biogeography_ 35.6 (2008): 977-994.

<sup>4</sup>Fernández‐Palacios, José María, et al. "Towards a glacial‐sensitive model of island biogeography." _Global Ecology and Biogeography_ 25.7 (2016): 817-830.

<sup>5</sup>Janzen, Thijs, Sebastian Höhna, and Rampal S. Etienne. "Approximate Bayesian Computation of diversification rates from molecular phylogenies: introducing a new efficient summary statistic, the nLTT." _Methods in Ecology and Evolution_ 6.5 (2015): 566-575.
