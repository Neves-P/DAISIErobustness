### Pre-pilot ###

user <- "Josh"
user <- "Pedro"

parameter_space <- "oceanic_ontogeny"
parameter_space <- "oceanic_sea_level"
parameter_space <- "oceanic_ontogeny_sea_level"
parameter_space <- "nonoceanic"
parameter_space <- "nonoceanic_sea_level"
parameter_space <- "nonoceanic_land_bridge"


### Pilot ###

require(DAISIE)
require(nLTT)
set.seed(1)
if (user == "Pedro") {
  if (parameter_space == "oceanic_ontogeny") {
    parameters <- read.csv(
      "D:/code/eustatgeo/R/oceanic_ontogeny.csv",
      stringsAsFactors = FALSE
    )
  }
}

if (user == "Josh") {
  if (parameter_space == "oceanic_ontogeny") {
    parameters <- read.csv(
      "C:/Users/user/Documents/github/eustatgeo/data/oceanic_ontogeny.csv",
      stringsAsFactors = FALSE
    )
  }
  if (parameter_space == "oceanic_sea_level") {
    parameters <- read.csv(
      "C:/Users/user/Documents/github/eustatgeo/R/oceanic_sea_level.csv",
      stringsAsFactors = FALSE
    )
  }
  if (parameter_space == "oceanic_ontogeny_sea_level") {
    parameters <- read.csv(
      "C:/Users/user/Documents/github/eustatgeo/R/oceanic_ontogeny_sea_level.csv",
      stringsAsFactors = FALSE
    )
  }
  if (parameter_space == "nonoceanic") {
    parameters <- read.csv(
      "",
      stringsAsFactors = FALSE
    )
  }
  if (parameter_space == "nonoceanic_sea_level") {
    parameters <- read.csv(
     "",
     stringsAsFactors = FALSE
   )
  }
  if (parameter_space == "nonoceanic_land_bridge") {
    parameters <- read.csv(
      "",
      stringsAsFactors = FALSE
    )
  }
}

geodynamics_simulations_output <- list()
geodynamics_ML_output <- list()
constant_simulations_output <- list()
constant_results_output <- list()
constant_simulations_2_output <- list()
geodynamics_simulations_output <- list()
geodynamics_ML_output <- list()
constant_simulations_output <- list()
constant_results_output <- list()
constant_simulations_2_output <- list()
num_spec_error <- list()
num_spec_baseline_error <- list()
for (l in seq_len(nrow(parameters))) {
  area_pars <- create_area_pars(
    max_area = parameters$max_are[l],
    proportional_peak_t = parameters$peak_time[l],
    peak_sharpness = parameters$sharpness[l],
    total_island_age = parameters$total_island_age[l],
    sea_level_amplitude = parameters$sea_level_amplitude[l],
    sea_level_frequency = parameters$sea_level_frequency[l],
    island_gradient_angle = parameters$island_gradient_angle[l]
  )
  hyper_pars <- NULL
  dist_pars <- NULL
  ext_pars <- c(parameters$mu_min[l], parameters$mu_p[l])
  pars <- c(parameters$lac[l],
            1,
            parameters$K[l],
            parameters$gam[l],
            parameters$laa[l]
  )
  simulation_pars <- create_default_pars(
    island_ontogeny = translate_island_ontogeny(parameters$island_ontogeny),
    sea_level = translate_sea_level(parameters$sea_level),
    area_pars = area_pars,
    hyper_pars = hyper_pars,
    dist_pars = dist_pars,
    ext_pars = ext_pars,
    totaltime = parameters$time,
    pars = pars
  )
  simulation_pars$pars <- pars
  simulation_pars$M <- parameters$M[l]
  simulation_pars$time <- parameters$time[l]
  simulation_pars$island_ontogeny <- parameters$island_ontogeny[l]
  simulation_pars$sea_level <- parameters$sea_level[l]
  simulation_pars$sea_level_amplitude <- parameters$sea_level_amplitude[l]
  simulation_pars$sea_level_frequency <- parameters$sea_level_frequency[l]
  simulation_pars$extcutoff <- parameters$extcutoff

  replicates <- 1

  geodynamics_simulations <- DAISIE_sim_time_dependent(
    time = simulation_pars$time,
    M = simulation_pars$M,
    pars = simulation_pars$pars,
    replicates = replicates,
    island_type = simulation_pars$island_type,
    island_ontogeny = simulation_pars$island_ontogeny,
    sea_level = simulation_pars$sea_level,
    area_pars = simulation_pars$area_pars,
    ext_pars = simulation_pars$ext_pars,
    extcutoff = simulation_pars$extcutoff,
    plot_sims = FALSE,
    verbose = TRUE, #FALSE
    sample_freq = Inf
  )

  stt_rows <- c()
  n_spec <- c()
  n_colonists <- c()
  for (n_reps in 1:length(geodynamics_simulations)) {
    stt_rows[n_reps] <- nrow(geodynamics_simulations[[n_reps]][[1]]$stt_all)
    n_spec[n_reps] <- as.numeric(geodynamics_simulations[[n_reps]][[1]]$stt_all[stt_rows[n_reps], "present"])
    n_colonists[n_reps] <- length(geodynamics_simulations[[n_reps]])
  }

  prop_rep_over_20_spec <- length(which(n_spec >= 20))
  prop_rep_over_5_cols <- length(which(n_colonists > 5))
  if ((prop_rep_over_20_spec / replicates) < 0.95 ||
      (prop_rep_over_5_cols / replicates) < 0.95) {
      print("95% of replicates did not have 20 species or
            did not have 5 colonisation to the present")
  } else {
  geodynamics_ML_results <- list()
  mean_medians <- DAISIE_calc_sumstats_pcrates(
    pars = simulation_pars$pars,
    area_pars = simulation_pars$area_pars,
    ext_pars = simulation_pars$ext_pars,
    totaltime = simulation_pars$time
  )
  for (i in seq_along(geodynamics_simulations)) {
    try(
      geodynamics_ML_results[[i]] <- DAISIE_ML_CS(
        datalist = geodynamics_simulations[[i]],
        datatype = "single",
        initparsopt = c(
          mean_medians$medians[1],
          mean_medians$medians[2],
          40,
          mean_medians$medians[3],
          1
        ),
        idparsopt = c(1:5),
        parsfix = NULL,
        idparsfix = NULL,
        verbose = 1 #0
      )
    )
    if (class(geodynamics_ML_results[[i]]) == 'try-error') {
      geodynamics_ML_results[[i]] <- "No convergence"
    }
  }

  constant_simulations_1 <- list()
  for (i in seq_along(geodynamics_ML_results)) {
    constant_simulations_1[[i]] <- DAISIE_sim_constant_rate(
      time = simulation_pars$time,
      M = simulation_pars$M,
      pars = as.numeric(geodynamics_ML_results[[i]][1:5]),
      replicates = 1,
      island_type = "oceanic",
      island_ontogeny = "const",
      sea_level = "const",
      area_pars = NULL,
      plot_sims = FALSE,
      verbose = TRUE, #FALSE
      sample_freq = Inf
    )
  }

  num_spec_error[[l]] <- list()
  for (n_reps in 1:replicates) {
    geodynamics_event_times <- geodynamics_simulations[[n_reps]][[1]]$stt_all[, 1]
    geodynamics_num_spec <- geodynamics_simulations[[n_reps]][[1]]$stt_all[, 5]
    constant_1_event_times <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
    constant_1_num_spec <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5]
    num_spec_error[[l]][n_reps] <- nLTT::nltt_diff_exact_extinct(
      event_times = geodynamics_event_times,
      species_number = geodynamics_num_spec,
      event_times2 = constant_1_event_times,
      species_number2 = constant_1_num_spec,
      distance_method = "abs",
      time_unit = "ago",
      normalize = FALSE
    )
    }

constant_results <- list()
  for (i in seq_along(constant_simulations_1)) {
    for(j in seq_along(constant_simulations_1[[i]]))
      try(
        constant_results[[i]] <- DAISIE_ML_CS(
          datalist = constant_simulations_1[[i]][[j]],
          datatype = "single",
          initparsopt = c(
            mean_medians$medians[1],
            mean_medians$medians[2],
            40,
            mean_medians$medians[3],
            1
          ),
          idparsopt = c(1:5),
          parsfix = NULL,
          idparsfix = NULL,
          verbose = 0
        )
      )
    if (class(constant_results[[i]]) == 'try-error') {
      constant_results[[i]] <- "No convergence"
    }
  }


  constant_simulations_2 <- list()
  for (i in seq_along(constant_results)) {
    constant_simulations_2[[i]] <- DAISIE_sim_constant_rate(
      time = simulation_pars$time,
      M = simulation_pars$M,
      pars = as.numeric(constant_results[[i]][1:5]),
      replicates = 1,
      island_type = "oceanic",
      island_ontogeny = "const",
      sea_level = "const",
      area_pars = NULL,
      plot_sims = FALSE,
      verbose = FALSE,
      sample_freq = Inf
    )
  }
  geodynamics_simulations_output[l] <- geodynamics_simulations
  geodynamics_ML_output[l] <- geodynamics_ML_results
  constant_simulations_output[l] <- constant_simulations_1
  constant_results_output[l] <- constant_results
  constant_simulations_2_output[l] <- constant_simulations_2
  #   save.image(file = "pilot_results.RData")

  num_spec_baseline_error[[l]] <- list()
  for (n_reps in 1:replicates) {
    constant_1_event_times <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
    constant_1_num_spec <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5]
    constant_2_event_times <- constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 1]
    constant_2_num_spec <- constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 5]
    num_spec_baseline_error[[l]][n_reps] <- nLTT::nltt_diff_exact_extinct(
       event_times = constant_1_event_times,
       species_number = constant_1_num_spec,
       event_times2 = constant_2_event_times,
       species_number2 = constant_2_num_spec,
       distance_method = "abs",
       time_unit = "ago",
       normalize = FALSE
     )
  }
  }
  cat("parameter set", l, "\n")
  }

# save.image(file = "pilot_results.RData")
