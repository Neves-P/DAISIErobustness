#' Run robustness analysis pipeline
#'
#' @param param_space A string with the parameter space to run. Can
#' be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#' \code{"oceanic_ontogeny_sea_level"},
#' \code{"nonoceanic"}, \code{"nonoceanic_sea_level"}, or
#' \code{"nonoceanic_land_bridge"}.
#' @param param_set A numeric with the line corresponding to parameter set to
#' run, as found in the file named in \code{param_space}.
#' @param rates A string with set of rates to be tested, can either be
#' \code{"const"} for a constant rate simulation, \code{"time_dep"} for a
#' time-dependent simulation, or \code{"rate_shift"} for a rate-shift
#' simulation.
#'
#' @export
run_robustness <- function(param_space, param_set, rates) {

  # Selecting parameter space -----------------------------------------------
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/data/"
  file <- paste0(file_domain, param_space, ".txt")
  param_space <- readr::read_delim(
    file = file, delim = "  "
  )

  set.seed(1)

  # Initialising objects ----------------------------------------------------
  error <- list()
  baseline_error <- list()

  if (rates == "const") {
    area_pars <- NULL
    hyper_pars <- NULL
    dist_pars <- NULL
    ext_pars <- NULL
    pars <- c(param_space$lac[param_set],
              param_space$mu[param_set],
              param_space$K[param_set],
              param_space$gam[param_set],
              param_space$laa[param_set]
    )
  }
  if (rates == "time_dep") {
  area_pars <- DAISIE::create_area_pars(
    max_area = param_space$max_area[param_set],
    proportional_peak_t = param_space$peak_time[param_set],
    peak_sharpness = param_space$sharpness[param_set],
    total_island_age = param_space$total_island_age[param_set],
    sea_level_amplitude = param_space$sea_level_amplitude[param_set],
    sea_level_frequency = param_space$sea_level_frequency[param_set],
    island_gradient_angle = param_space$island_gradient_angle[param_set]
  )
  hyper_pars <- NULL
  dist_pars <- NULL
  ext_pars <- c(param_space$mu_min[param_set], param_space$mu_p[param_set])
  pars <- c(param_space$lac[param_set],
            1,
            param_space$K[param_set],
            param_space$gam[param_set],
            param_space$laa[param_set]
  )
  }
  simulation_pars <- DAISIE::create_default_pars(
    island_ontogeny = DAISIE::translate_island_ontogeny(
      param_space$island_ontogeny),
    sea_level = DAISIE::translate_sea_level(param_space$sea_level),
    area_pars = area_pars,
    hyper_pars = hyper_pars,
    dist_pars = dist_pars,
    ext_pars = ext_pars,
    totaltime = param_space$time,
    pars = pars
  )
  simulation_pars$pars <- pars
  simulation_pars$M <- param_space$M[param_set]
  simulation_pars$time <- param_space$time[param_set]
  simulation_pars$island_ontogeny <- param_space$island_ontogeny[param_set]
  simulation_pars$sea_level <- param_space$sea_level[param_set]
  simulation_pars$sea_level_amplitude <- param_space$sea_level_amplitude[param_set]
  simulation_pars$sea_level_frequency <- param_space$sea_level_frequency[param_set]
  simulation_pars$extcutoff <- param_space$extcutoff[param_set]
  simulation_pars$x_s <- param_space$x_s[param_set]
  simulation_pars$x_nonend <- param_spec$x_nonend[param_set]

  replicates <- 2

  # Geodynamics simulations -------------------------------------------------
  if (rates == "time_dep") {
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
      verbose = TRUE,#FALSE,
      sample_freq = Inf
    )
  }

# Nonoceanic simulations --------------------------------------------------
  if (rates == "const") {
    geodynamics_simulations <- DAISIE::DAISIE_sim_constant_rate(
      time = simulation_pars$time,
      M = simulation_pars$M,
      pars = simulation_pars$pars,
      replicates = replicates,
      nonoceanic_pars = c(simulation_pars$x_s, simulation_pars$x_nonend),
      sample_freq  = Inf,
      plot_sims = FALSE,
      verbose = TRUE#FALSE
    )
  }


# Land-bridge simulation --------------------------------------------------
  if (rates == "rate_shift") {
    geodynamics_simulations <- DAISIE::DAISIE_sim_constant_rate_shift(
      time = simulation_pars$time,
      M = simulation_pars$M,
      pars = simulation_pars$pars,
      replicates = replicates,
      nonoceanic_pars = c(simulation_pars$x_s, simulation_pars$x_nonend),
      shift_times = simulation_pars$shift_times,
      sample_freq  = Inf,
      plot_sims = FALSE,
      verbose = TRUE#FALSE
    )
  }

  # Conditioning simulation -------------------------------------------------
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

    # Maximum likelihood estimation 1 DD --------------------------------------
    geodynamics_ML_DD <- list()
    mean_medians <- DAISIE::DAISIE_calc_sumstats_pcrates(
      pars = simulation_pars$pars,
      area_pars = simulation_pars$area_pars,
      ext_pars = simulation_pars$ext_pars,
      totaltime = simulation_pars$time
    )
    for (i in seq_along(geodynamics_simulations)) {
      try(
        geodynamics_ML_DD[[i]] <- DAISIE::DAISIE_ML_CS(
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
          verbose = 1#0
        )
      )
      if (class(geodynamics_ML_DD[[i]]) == "try-error") {
        geodynamics_ML_DD[[i]] <- "No convergence"
      }
    }

    # Maximum likelihood estimation 1 DI --------------------------------------
    geodynamics_ML_DI <- list()
    mean_medians <- DAISIE::DAISIE_calc_sumstats_pcrates(
      pars = simulation_pars$pars,
      area_pars = simulation_pars$area_pars,
      ext_pars = simulation_pars$ext_pars,
      totaltime = simulation_pars$time
    )
    DD_AICc <- list()
    DI_AICc <- list()
    n_spec <- c()
    for (i in seq_along(geodynamics_simulations)) {
      try(
        geodynamics_ML_DI[[i]] <- DAISIE::DAISIE_ML_CS(
          datalist = geodynamics_simulations[[i]],
          datatype = "single",
          initparsopt = c(
            mean_medians$medians[1],
            mean_medians$medians[2],
            mean_medians$medians[3],
            1
          ),
          idparsopt = c(1, 2, 4, 5),
          parsfix = Inf,
          idparsfix = 3,
          verbose = 1#0
        )
      )
      if (class(geodynamics_ML_DI[[i]]) == "try-error") {
        geodynamics_ML_DI[[i]] <- "No convergence"
      }
      stt_rows[i] <- nrow(geodynamics_simulations[[i]][[1]]$stt_all)
      n_spec[i] <- as.numeric(geodynamics_simulations[[i]][[1]]$stt_all[stt_rows[i], "present"])
      DD_AICc[[i]] <- (2 * 5) - (2 * geodynamics_ML_DD[[i]]$loglik) + ((2 * 5^2) + 2 * 5) / n_spec[i] - 5 - 1
      DI_AICc[[i]] <- (2 * 4) - (2 * geodynamics_ML_DD[[i]]$loglik) + ((2 * 4^2) + 2 * 4) / n_spec[i] - 4 - 1
    }

    mean_DD_AICc <- mean(unlist(DD_AICc))
    mean_DI_AICc <- mean(unlist(DI_AICc))
    mean_DD_AICc_smaller <- mean_DD_AICc < mean_DI_AICc

    if (mean_DD_AICc_smaller) {
      geodynamics_ML <- geodynamics_ML_DD
    } else {
      geodynamics_ML <- geodynamics_ML_DI
    }

    # First constant rate simulations -----------------------------------------
    constant_simulations_1 <- list()
    for (i in seq_along(geodynamics_ML)) {
      constant_simulations_1[[i]] <- DAISIE::DAISIE_sim_constant_rate(
        time = simulation_pars$time,
        M = simulation_pars$M,
        pars = as.numeric(geodynamics_ML[[i]][1:5]),
        replicates = 1,
        island_type = "oceanic",
        island_ontogeny = "const",
        sea_level = "const",
        area_pars = NULL,
        plot_sims = FALSE,
        verbose = TRUE,#FALSE,
        sample_freq = Inf
      )
    }

    # Calculate error -----------------------------------------------------------
    error[[param_set]] <- list()
    n_colonists <- c()
    for (n_reps in 1:replicates) {
      geodynamics_event_times <- geodynamics_simulations[[n_reps]][[1]]$stt_all[, 1]
      geodynamics_num_spec <- geodynamics_simulations[[n_reps]][[1]]$stt_all[, 5]
      constant_1_event_times <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_1_num_spec <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5]
      error[[param_set]][n_reps] <- nLTT::nltt_diff_exact_extinct(
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


    # Maximum likelihood estimation 2 -----------------------------------------
    constant_ML_1 <- list()
    for (i in seq_along(constant_simulations_1)) {
      for (j in seq_along(constant_simulations_1[[i]]))
        try(
          constant_ML_1[[i]] <- DAISIE::DAISIE_ML_CS(
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
            verbose = 1#0
          )
        )
      if (class(constant_ML_1[[i]]) == "try-error") {
        constant_ML_1[[i]] <- "No convergence"
      }
    }


# Calculate rates error ---------------------------------------------------
    rates_error <- list()
    for (i in seq_len(geodynamics_ML)) {
      rates_error$clado_error <- geodynamics_ML[[i]]$lambda_c - constant_ML_1[[i]]$lambda_c
      rates_error$ext_error <- geodynamics_ML[[i]]$mu - constant_ML_1[[i]]$mu
      rates_error$K_error <- geodynamics_ML[[i]]$K - constant_ML_1[[i]]$K
      rates_error$immig_error <- geodynamics_ML[[i]]$gamma - constant_ML_1[[i]]$gamma
      rates_error$ana_error <- geodynamics_ML[[i]]$lambda_a - constant_ML_1[[i]]$lambda_a
    }

    # Second constant rate simulations ----------------------------------------
    constant_simulations_2 <- list()
    for (i in seq_along(constant_ML_1)) {
      constant_simulations_2[[i]] <- DAISIE::DAISIE_sim_constant_rate(
        time = simulation_pars$time,
        M = simulation_pars$M,
        pars = as.numeric(constant_ML_1[[i]][1:5]),
        replicates = 1,
        island_type = "oceanic",
        island_ontogeny = "const",
        sea_level = "const",
        area_pars = NULL,
        plot_sims = FALSE,
        verbose = TRUE,#FALSE,
        sample_freq = Inf
      )
    }


    # Calculate baseline error --------------------------------------------------
    baseline_error[[param_set]] <- list()
    for (n_reps in 1:replicates) {
      constant_1_event_times <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_1_num_spec <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5]
      constant_2_event_times <- constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_2_num_spec <- constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 5]
      baseline_error[[param_set]][n_reps] <- nLTT::nltt_diff_exact_extinct(
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

# Maximum likelihood estimation 3 -------------------------------------------
  constant_ML_2 <- list()
  for (i in seq_along(constant_simulations_2)) {
    for (j in seq_along(constant_simulations_2[[i]]))
      try(
        constant_ML_2[[i]] <- DAISIE::DAISIE_ML_CS(
          datalist = constant_simulations_2[[i]][[j]],
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
          verbose = 1#0
        )
      )
    if (class(constant_ML_2[[i]]) == "try-error") {
      constant_ML_2[[i]] <- "No convergence"
    }
  }

  # Calculate rates baseline error --------------------------------------------
  rates_baseline_error <- list()
  for (i in seq_len(constant_ML_1)) {
    rates_error$clado_error <- constant_ML_1[[i]]$lambda_c - constant_ML_2[[i]]$lambda_c
    rates_error$ext_error <- constant_ML_1[[i]]$mu - constant_ML_2[[i]]$mu
    rates_error$K_error <- constant_ML_1[[i]]$K - constant_ML_2[[i]]$K
    rates_error$immig_error <- constant_ML_1[[i]]$gamma - constant_ML_2[[i]]$gamma
    rates_error$ana_error <- constant_ML_1[[i]]$lambda_a - constant_ML_2[[i]]$lambda_a
  }

  output_list <- list(
    error = error,
    baseline_error = baseline_error,
    rates_error = rates_error,
    rates_baseline_error = rates_baseline_error,
    geodynamics_simulations = geodynamics_simulations,
    geodynamics_ML = geodynamics_ML,
    constant_simulations_1 = constant_simulations_1,
    constant_ML_1 = constant_ML_1,
    constant_simulations_2 = constant_simulations_2,
    constant_ML_2 = constant_ML_2
  )
  save(output_list, file = "pipeline_result.RData")
  return(output_list)
}
