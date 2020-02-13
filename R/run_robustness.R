#' Run robustness analysis pipeline
#'
#' @param parameter_space A string with the parameter space to run. Can
#' be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#' \code{"oceanic_ontogeny_sea_level"},
#' \code{"nonoceanic"}, \code{"nonoceanic_sea_level"}, or
#' \code{"nonoceanic_land_bridge"}
#'
#' @export
run_robustness <- function(parameter_space) {


# Selecting parameter space -----------------------------------------------
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/data/"
  file <- paste0(file_domain, parameter_space, ".txt")
  parameters <- readr::read_delim(
    file = file, delim = "  "
  )

  set.seed(1)

# Initialising objects ----------------------------------------------------
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
  error <- list()
  baseline_error <- list()

  for (l in seq_len(nrow(parameters))) {
    cat("parameter set", l, "\n")
    area_pars <- DAISIE::create_area_pars(
      max_area = parameters$max_area[l],
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
    simulation_pars <- DAISIE::create_default_pars(
      island_ontogeny = DAISIE::translate_island_ontogeny(
        parameters$island_ontogeny),
      sea_level = DAISIE::translate_sea_level(parameters$sea_level),
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

    replicates <- 1000

# Geodynamics simulations -------------------------------------------------
    geodynamics_simulations <- DAISIE::DAISIE_sim_time_dependent(
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
      verbose = FALSE,
      sample_freq = Inf
    )

# Conditioning simulation -------------------------------------------------
    stt_rows <- c()
    n_spec <- c()
    n_colonists <- c()
    for (n_reps in seq_len(geodynamics_simulations)) {
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

# Maximum likelihood estimation -------------------------------------------
      geodynamics_ML_results <- list()
      mean_medians <- DAISIE::DAISIE_calc_sumstats_pcrates(
        pars = simulation_pars$pars,
        area_pars = simulation_pars$area_pars,
        ext_pars = simulation_pars$ext_pars,
        totaltime = simulation_pars$time
      )
      for (i in seq_along(geodynamics_simulations)) {
        try(
          geodynamics_ML_results[[i]] <- DAISIE::DAISIE_ML_CS(
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
            verbose = 0
          )
        )
        if (class(geodynamics_ML_results[[i]]) == "try-error") {
          geodynamics_ML_results[[i]] <- "No convergence"
        }
      }


# First constant rate simulations -----------------------------------------
      constant_simulations_1 <- list()
      for (i in seq_along(geodynamics_ML_results)) {
        constant_simulations_1[[i]] <- DAISIE::DAISIE_sim_constant_rate(
          time = simulation_pars$time,
          M = simulation_pars$M,
          pars = as.numeric(geodynamics_ML_results[[i]][1:5]),
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

      # Calculate error -----------------------------------------------------------
      error[[l]] <- list()
      n_colonists <- c()
      for (n_reps in 1:replicates) {
        geodynamics_event_times <- geodynamics_simulations[[n_reps]][[1]]$stt_all[, 1]
        geodynamics_num_spec <- geodynamics_simulations[[n_reps]][[1]]$stt_all[, 5]
        constant_1_event_times <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
        constant_1_num_spec <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5]
        error[[l]][n_reps] <- nLTT::nltt_diff_exact_extinct(
          event_times = geodynamics_event_times,
          species_number = geodynamics_num_spec,
          event_times2 = constant_1_event_times,
          species_number2 = constant_1_num_spec,
          distance_method = "abs",
          time_unit = "ago",
          normalize = FALSE
        )
        stt_last_row_geodynamics <- nrow(geodynamics_simulations[[n_reps]][[1]]$stt_all[, 5])
        num_spec_geodynamics <- geodynamics_simulations[[n_reps]][[1]]$stt_all[stt_last_row_geodynamics, 5]

        stt_last_row_constant_1 <- nrow(constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5])
        num_spec_constant_1 <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_constant_1, 5]

        #TODO: Better error calculations
        error$num_spec_error <- num_spec_geodynamics - num_spec_constant_1


        num_colonist_geodynamamics <- length(geodynamics_simulations[[n_reps]]) - 1
        num_colonist_constant_1 <- length(constant_simulations_1[[n_reps]]) - 1
        error$num_colonist_error <- num_colonist_geodynamamics - num_colonist_constant_1
      }


# Maximum likelihood estimation -------------------------------------------
      constant_results <- list()
      for (i in seq_along(constant_simulations_1)) {
        for (j in seq_along(constant_simulations_1[[i]]))
          try(
            constant_results[[i]] <- DAISIE::DAISIE_ML_CS(
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
        if (class(constant_results[[i]]) == "try-error") {
          constant_results[[i]] <- "No convergence"
        }
      }


# Second constant rate simulations ----------------------------------------
      constant_simulations_2 <- list()
      for (i in seq_along(constant_results)) {
        constant_simulations_2[[i]] <- DAISIE::DAISIE_sim_constant_rate(
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

      # Calculate baseline error --------------------------------------------------
      baseline_error[[l]] <- list()
      for (n_reps in 1:replicates) {
        constant_1_event_times <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
        constant_1_num_spec <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5]
        constant_2_event_times <- constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 1]
        constant_2_num_spec <- constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 5]
        baseline_error[[l]][n_reps] <- nLTT::nltt_diff_exact_extinct(
          event_times = constant_1_event_times,
          species_number = constant_1_num_spec,
          event_times2 = constant_2_event_times,
          species_number2 = constant_2_num_spec,
          distance_method = "abs",
          time_unit = "ago",
          normalize = FALSE
        )
        stt_last_row_constant_1 <- nrow(constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5])
        num_spec_constant_1 <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_geodynamics, 5]

        stt_last_row_constant_1 <-
          nrow(constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 5])
        num_spec_constant_1 <-
          constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_constant_1, 5]

        #TODO: Better error calculations
        baseline_error$num_spec_error$num_spec_error <- num_spec_geodynamics - num_spec_constant_1


        num_colonist_geodynamamics <-
          length(geodynamics_simulations[[n_reps]]) - 1
        num_colonist_constant_1 <-
          length(constant_simulations_1[[n_reps]]) - 1
        baseline_error$num_colonist_error <-
          num_colonist_geodynamamics - num_colonist_constant_1
      }
    }
  }

  output_list <- list(
    error = error,
    baseline_error = baseline_error,
    geodynamics_simulations_output = geodynamics_simulations_output,
    geodynamics_ML_output = geodynamics_ML_output,
    constant_simulations_1 = constant_simulations_1,
    constant_results = constant_results,
    constant_simulations_2 = constant_simulations_2
  )
  return(output_list)
}
