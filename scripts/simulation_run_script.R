# nonoceanic has already ran

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

total_runs <- nrow(param_space_oceanic_ontogeny) + nrow(param_space_oceanic_ontogeny_sea_level)+
  nrow(param_space_oceanic_sea_level)


params <- vector("list", total_runs)

indices <- c(
  seq(nrow(param_space_oceanic_ontogeny)),
  seq(nrow(param_space_oceanic_ontogeny_sea_level)),
  seq(nrow(param_space_oceanic_sea_level))
)

param_space_names <- c(
  rep("oceanic_ontogeny", nrow(param_space_oceanic_ontogeny)),
  rep("oceanic_ontogeny_sea_level", nrow(param_space_oceanic_ontogeny_sea_level)),
  rep("oceanic_sea_level", nrow(param_space_oceanic_sea_level))
)


# 20-5-20 now just doing oceanic_ontogeny_sea_level because github failed on oceanic_ontogeny_sea_level param set 290
param_space_names <- c(
  rep("oceanic_ontogeny_sea_level", 95)
)
290:384
for (i in 290:384) {
  params[[i]] <- list(
    param_space_name = param_space_names[i],
    param_set = i,
    replicates = 1000,
    save_output = TRUE
  )
}


jap::pocket_experiment(
  github_name = "Neves-P",
  project_name = "DAISIErobustness",
  function_name = "run_geodynamic_section",
  params = params,
  cluster_folder = "data",
  cluster_partition = "gelifes"
)


