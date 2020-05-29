# Template for the geodynamics study nonoceanic has already ran
## First load up all the parameter spaces in the study



#### oceanic_ontogeny
param_space_name_oceanic_ontogeny <- "oceanic_ontogeny"
# Create params for the experiment
param_space_oceanic_ontogeny <- DAISIErobustness::load_param_space(
  param_space_name = param_space_name_oceanic_ontogeny
)


#### oceanic_sea_level
param_space_name_oceanic_sea_level <- "oceanic_sea_level"
# Create params for the experiment
param_space_oceanic_sea_level <- DAISIErobustness::load_param_space(
  param_space_name = param_space_name_oceanic_sea_level
)

#### oceanic_ontogeny_sea_level
param_space_name_oceanic_ontogeny_sea_level <- "oceanic_ontogeny_sea_level"
# Create params for the experiment
param_space_oceanic_ontogeny_sea_level <- DAISIErobustness::load_param_space(
  param_space_name = param_space_name_oceanic_ontogeny_sea_level
)

#### nonoceanic
param_space_name_nonoceanic <- "nonoceanic"
# Create params for the experiment
param_space_nonoceanic <- DAISIErobustness::load_param_space(
  param_space_name = param_space_name_nonoceanic
)

#### nonoceanic_sea_level
param_space_name_nonoceanic_sea_level <- "nonoceanic_sea_level"
# Create params for the experiment
param_space_nonoceanic_sea_level <- DAISIErobustness::load_param_space(
  param_space_name = param_space_name_nonoceanic_sea_level
)

#### oceanic_sea_level
param_space_name_nonoceanic_land_bridge <- "nonoceanic_land_bridge"
# Create params for the experiment
param_space_nonoceanic_land_bridge <- DAISIErobustness::load_param_space(
  param_space_name = param_space_name_nonoceanic_land_bridge
)

## Calculate number of jobs to run
total_runs <- nrow(param_space_oceanic_ontogeny) +
  nrow(param_space_oceanic_ontogeny_sea_level) +
  nrow(param_space_oceanic_sea_level) +
  nrow(param_space_nonoceanic) +
  nrow(param_space_nonoceanic_sea_level) +
  nrow(param_space_nonoceanic_land_bridge)


# Make replicate_range vectors
## Run 1:200 batch
replicate_range_list <- list()

for (i in seq_len(total_runs)) {
  replicate_range_list[[i]] <- c(1, 200)
}

# Make params list
params <- vector("list", total_runs)

# Make indices of each job
indices <- c(
  seq(nrow(param_space_oceanic_ontogeny)),
  seq(nrow(param_space_oceanic_ontogeny_sea_level)),
  seq(nrow(param_space_oceanic_sea_level)),
  seq(nrow(param_space_nonoceanic)),
  seq(nrow(param_space_nonoceanic_sea_level)),
  seq(nrow(param_space_nonoceanic_land_bridge))
)

# Assign a param_space_name to each job
param_space_names <- c(
  rep("oceanic_ontogeny", nrow(param_space_oceanic_ontogeny)),
  rep(
    "oceanic_ontogeny_sea_level",
    nrow(param_space_oceanic_ontogeny_sea_level
    )),
  rep("oceanic_sea_level", nrow(param_space_oceanic_sea_level)),
  rep("nonoceanic", nrow(param_space_nonoceanic)),
  rep("nonoceanic_sea_level", nrow(param_space_nonoceanic_sea_level)),
  rep("nonoceanic_land_bridge", nrow(param_space_nonoceanic_land_bridge))
)

# Populate params list with necessary arguments
for (i in seq_len(total_runs)) {
  params[[i]] <- list(
    param_space_name = param_space_names[i],
    param_set = indices[i],
    replicates = 1000,
    pipeline = "analysis",
    save_output = TRUE,
    replicate_range = replicate_range_list[[i]]
  )
}
