# DAISIErobustness

DAISIErobustness is an R package allowing the testing the robustness of the island biogeography model "[DAISIE](https://github.com/rsetienne/DAISIE)" (_Dynamical Assembly of Islands by Speciation, Immigration and Extinction_)  to more complex and potentially more realistic evolutionary models. Different measures of error of   number of species, endemics, non-endemics and evolutionary trajectories are used to determine whether the alternative models can influence the inference capabilities of the current DAISIE model.

## What is DAISIE?
DAISIE allows for the estimation of diversification rates and other relevant diversification parameters on islands. These are:
* Cladogenesis rate
* Anagenesis rate
* (Clade-specific or island-wide) carrying capacity 
* Migration rate
* Extinction

The estimation of such parameters is achieved using Maximum-Likelihood optimization, following the DAISIE likelihood functions described in published literature<sup>1</sup>.
The performance of DAISIE inference given the amount and quality of data has been studied as well. It was shown to perform well, particularly when phylogenitic data is available<sup>2</sup>.

## DAISIErobustness pipeline
DAISIErobustness consists of a pipeline designed to measure the error one creates when extending the standard DAISIE model with new features. Examples of such new additions include the modelling of island ontogeny, as per the General Dynamic Model<sup>3</sup>, sea level changes, and non-oceanic scenarios.

![Figure 1 - The DAISIErobustness pipeline](https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/scripts/Neves_et_al_2020/figure_1.png) 
### Pipeline steps
1. In it's current implementation, DAISIErobustness begins by simulating data using a new model (in this case, a geodyanamical model) (Fig. 1.1). Alternatively, the pipeline could run with a set of previously generated data, yet some minor coding adaptations are required on the current version to enable this featrure. This would allow the focal model and data to be generated externally, even outside of an R environment. Ideally, one would generate many replicates per set of generating parameters. This pipeline supports a **minium** of 2 replicates per generating parameter set, but 1000 is recommended.
Note that one can select from a number of implemented geodynamics simulations. See Appendices for more information.
2. Data is formatted to the DAISIE format, which requires reconstructed phylogenetic information (_sensu_ Nee et al. 1994), under the form of branching times. For an example of acceptable DAISIE, please see **here CHANGE**.
3. The DAISIE likelihood inference routine is applied in the previously generated or supplied data (Fig 1.2). This results in a set of likelihood estimated parameters and log-ikelihood for each of the replicates generated in steps 1-2. Note that this estimation procedure is entirely blind to whichever new processes were introduced to generate the initial data.
4. A new set of simulations is ran. The generating parameters of these simulations are the estimates obtained in step 4, and one replicate is simulated per set of generating parameters. These simulations **do not** include any of the realist features that characterize the simulations in step 1, but instead are a set standard oceanic DAISIE and follow the same model as the inference proceadure. At this stage, the error, _E_ (dashed line in Fig. 1), introduced by using an estimation model (step 4) that does not match the generating model (step 1) can be computed. This error is obtained by comparing the generating data (Fig 1.1) with the data obained in step 4. See Appendices for description of error metrics computed.
5. As in step 3, each resulting simulation is taken only as a reconstructed phylogeny (more precisely, as branching times and endemic status through time).
6. Similarly to step 3, likelihood estimation is performed in each simulation resulting from step 5.
7. As in step 4, each obtained set of parameter estimates is used to simulate a standard, oceanic DAISIE data set. The pairwise baseline error, _E<sub>B</sub>_, (dashed line in Figure 1) is computed between the simulations obtained in steps 4 and 7. The baseline error corresponds to the error inherent in the parameter estimation procedure, and the stochasticity of the simulations. The same metrics as in step 4 are obtained, see Appendices for more information.

## Example of a local run

## Appendices

### Parameters
The parameter currently implemented can be found [here](https://github.com/Neves-P/DAISIErobustness/tree/master/data). New parameter sets can be generated using this [this](https://github.com/Neves-P/DAISIErobustness/blob/master/scripts/Neves_et_al_2020/generate_param_space.R) helpful script.

### Error metrics

### Simulation and likelihood constraints

### University of Groningen Peregrine HPCC integration

## References
<sup>1</sup>DAISIE Galápagos paper
<sup>2</sup>Ecography paper
<sup>2</sup>GDM paper

