# DAISIE Analysis pipeline specifications

This document aims to layout a standardized structure for analysis pipeline runs in future DAISIE studies.
DAISIE simulation output objects currently consist of nested lists. These lists always contain the following information.

1) `island_age` - The island age (numeric scalar) of a simulation.
2) `not_present` - The number of mainland species that did not colonize the island (numeric scalar).
3) `stt_all` - The species-through-time table with the number of immigrant, anagenetic, cladogenetic and total species 
present on the island (matrix).

For clade-specific simulations, the following levels of the list are a set of the following elements per each colonizing lineage:
1) `branching_times` - The branching (or colonization) times of extant species on the island at present.
The first element always corresponds to the island age.
2) `stac` - The status of the clade formed by the immigrant (numeric scalar).  
   `stac` = 1 : immigrant is present but has not formed an extant clade  
   `stac` = 2 : immigrant is not present but has formed an extant clade  
   `stac` = 3 : immigrant is present and has formed an extant clade  
   `stac` = 4 : immigrant is present but has not formed an extant clade,  
   and it is known when it immigrated.  
   `stac` = 5 : immigrant is not present and has not formed an extant clade,
   but only an endemic species  
   `stac` = 6 : like 2, but with max colonization time  
   `stac` = 7 : like 3, but with max colonization time
3) `missing_species` - The number of species that were not sampled for a particular clade (only applicable for endemic clades) (numeric scalar).

The final output of a pipeline run should be a list.  
Each top level of this list should refer to one `novel_sim` replicate.
