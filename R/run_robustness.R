#' Run robustness analysis pipeline
#'
#' @param param_space_name A string with the parameter space to run. Can
#' be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#' \code{"oceanic_ontogeny_sea_level"},
#' \code{"nonoceanic"}, \code{"nonoceanic_sea_level"}, or
#' \code{"nonoceanic_land_bridge"}.
#' @param param_set A numeric with the line corresponding to parameter set to
#' run, as found in the file named in \code{param_space}.
#' @param replicates number of replicates for the initial simulation.
#'
#' @export
run_robustness <- function(param_space_name,
                           param_set,
                           replicates = 1000) {

  # Selecting parameter space -----------------------------------------------
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/data/"
  file <- paste0(file_domain, param_space_name, ".csv")
  param_space <- readr::read_csv(
    file = file
  )

  set.seed(1)


  # Check input is correct --------------------------------------------------
  testit::assert(param_space_name == "oceanic_ontogeny" ||
                   param_space_name == "oceanic_sea_level" ||
                   param_space_name == "oceanic_ontogeny_sea_level" ||
                   param_space_name == "nonoceanic" ||
                   param_space_name == "nonoceanic_sea_level" ||
                   param_space_name == "nonoceanic_land_bridge")
  testit::assert(param_set >= 1)
  testit::assert(param_set <= nrow(param_space))
  testit::assert(replicates > 1)

  # Initialising objects ----------------------------------------------------
  if (param_space_name == "nonoceanic") {
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
    simulation_pars <- DAISIE::create_default_pars(
      totaltime = param_space$time
    )
    simulation_pars$pars <- pars
    simulation_pars$M <- param_space$M[param_set]
    simulation_pars$time <- param_space$time[param_set]
    simulation_pars$x_s <- param_space$x_s[param_set]
    simulation_pars$x_nonend <- param_space$x_nonend[param_set]
  }
  if (param_space_name == "nonoceanic_land_bridge") {
    area_pars <- NULL
    hyper_pars <- NULL
    dist_pars <- NULL
    ext_pars <- NULL
    pars <- c(param_space$lac_1[param_set],
              param_space$mu_1[param_set],
              param_space$K_1[param_set],
              param_space$gam_1[param_set],
              param_space$laa_1[param_set],
              param_space$lac_2[param_set],
              param_space$mu_2[param_set],
              param_space$K_2[param_set],
              param_space$gam_2[param_set],
              param_space$laa_2[param_set]
    )
    simulation_pars <- DAISIE::create_default_pars(
      totaltime = param_space$time
    )
    simulation_pars$pars <- pars
    simulation_pars$M <- param_space$M[param_set]
    simulation_pars$time <- param_space$time[param_set]
    simulation_pars$x_s <- param_space$x_s[param_set]
    simulation_pars$x_nonend <- param_space$x_nonend[param_set]
    simulation_pars$shift_times <- c()
    for (i in 1:(param_space$shift_times[param_set])) {
      shift_interval <- param_space$time[param_set] / param_space$shift_times[param_set]
      simulation_pars$shift_times[i] <- shift_interval * i
    }
  }
print(simulation_pars$shift_times)
  if (param_space_name == "oceanic_ontogeny" ||
      param_space_name == "oceanic_sea_level" ||
      param_space_name == "oceanic_ontogeny_sea_level" ||
      param_space_name == "nonoceanic_sea_level") {
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
    simulation_pars <- DAISIE::create_default_pars(
      island_ontogeny = DAISIE::translate_island_ontogeny(
        param_space$island_ontogeny[param_set]),
      sea_level = DAISIE::translate_sea_level(
        param_space$sea_level[param_set]),
      area_pars = area_pars,
      hyper_pars = hyper_pars,
      dist_pars = dist_pars,
      ext_pars = ext_pars,
      totaltime = param_space$time
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
    simulation_pars$x_nonend <- param_space$x_nonend[param_set]
    }

  # Geodynamics simulations -------------------------------------------------
  if (param_space_name == "oceanic_ontogeny" ||
      param_space_name == "oceanic_sea_level" ||
      param_space_name == "oceanic_ontogeny_sea_level" ||
      param_space_name == "nonoceanic_sea_level") {
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
  if (param_space_name == "nonoceanic") {
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
  if (param_space_name == "nonoceanic_land_bridge") {
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
    output_file <- "95% of replicates did not have 20 species or did not
    have 5 colonisation to the present"
    output_file_name <- paste0(
      "fail_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata")
  } else {

    # Maximum likelihood estimation 1 DD --------------------------------------
    geodynamics_ML_DD <- list()
    if (param_space_name == "oceanic_ontogeny" ||
        param_space_name == "oceanic_sea_level" ||
        param_space_name == "oceanic_ontogeny_sea_level" ||
        param_space_name == "nonoceanic_sea_level" ) {
      median_rates <- DAISIE::DAISIE_calc_sumstats_pcrates(
        pars = simulation_pars$pars,
        area_pars = simulation_pars$area_pars,
        ext_pars = simulation_pars$ext_pars,
        totaltime = simulation_pars$time
      )
    } else {
      median_rates <- list(medians = c(simulation_pars$pars[1],
                                       simulation_pars$pars[2],
                                       simulation_pars$pars[4]))
    }
    for (i in seq_along(geodynamics_simulations)) {
      try(
        geodynamics_ML_DD[[i]] <- DAISIE::DAISIE_ML_CS(
          datalist = geodynamics_simulations[[i]],
          datatype = "single",
          initparsopt = c(
            median_rates$medians[1],
            median_rates$medians[2],
            40,
            median_rates$medians[3],
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
    if (param_space_name == "oceanic_ontogeny" ||
        param_space_name == "oceanic_sea_level" ||
        param_space_name == "oceanic_ontogeny_sea_level" ||
        param_space_name == "nonoceanic_sea_level" ) {
    median_rates <- DAISIE::DAISIE_calc_sumstats_pcrates(
      pars = simulation_pars$pars,
      area_pars = simulation_pars$area_pars,
      ext_pars = simulation_pars$ext_pars,
      totaltime = simulation_pars$time
    )
    } else {
      median_rates <- list(medians = c(simulation_pars$pars[1],
                                       simulation_pars$pars[2],
                                       simulation_pars$pars[4]))
    }
    DD_AICc <- c()
    DI_AICc <- c()
    n_spec <- c()
    for (i in seq_along(geodynamics_simulations)) {
      try(
        geodynamics_ML_DI[[i]] <- DAISIE::DAISIE_ML_CS(
          datalist = geodynamics_simulations[[i]],
          datatype = "single",
          initparsopt = c(
            median_rates$medians[1],
            median_rates$medians[2],
            median_rates$medians[3],
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
      DD_AICc[i] <- (2 * 5) - (2 * geodynamics_ML_DD[[i]]$loglik) + ((2 * 5^2) + 2 * 5) / n_spec[i] - 5 - 1
      DI_AICc[i] <- (2 * 4) - (2 * geodynamics_ML_DD[[i]]$loglik) + ((2 * 4^2) + 2 * 4) / n_spec[i] - 4 - 1
    }

    mean_DD_AICc <- mean(DD_AICc)
    mean_DI_AICc <- mean(DI_AICc)
    mean_DD_AICc_smaller <- mean_DD_AICc < mean_DI_AICc

    if (mean_DD_AICc_smaller) {
      geodynamics_ML <- geodynamics_ML_DD
    } else {
      geodynamics_ML <- geodynamics_ML_DI
    }

    # Calculate rates error ---------------------------------------------------
    rates_error <- list()
    for (i in 1:length(geodynamics_ML)) {
      rates_error$clado_error[i] <- abs(simulation_pars$pars[1] - geodynamics_ML[[i]]$lambda_c)
      rates_error$ext_error[i] <- abs(simulation_pars$pars[2] - geodynamics_ML[[i]]$mu)
      rates_error$K_error[i] <- abs(simulation_pars$pars[3] - geodynamics_ML[[i]]$K)
      rates_error$immig_error[i] <- abs(simulation_pars$pars[4] - geodynamics_ML[[i]]$gamma)
      rates_error$ana_error[i] <- abs(simulation_pars$pars[5] - geodynamics_ML[[i]]$lambda_a)
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

    # Calculate species and colonists error -----------------------------------
    species_error <- list()
    n_colonists <- c()
    for (n_reps in 1:replicates) {
      geodynamics_event_times <-
        geodynamics_simulations[[n_reps]][[1]]$stt_all[, 1]
      geodynamics_num_spec <-
        geodynamics_simulations[[n_reps]][[1]]$stt_all[, 5]
      constant_1_event_times <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_1_num_spec <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5]
      species_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = geodynamics_event_times,
        species_number = geodynamics_num_spec,
        event_times2 = constant_1_event_times,
        species_number2 = constant_1_num_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
      stt_last_row_geodynamics <-
        length(geodynamics_simulations[[n_reps]][[1]]$stt_all[, 5])
      num_spec_geodynamics <-
        geodynamics_simulations[[n_reps]][[1]]$stt_all[stt_last_row_geodynamics, 5]
      stt_last_row_constant_1 <-
        length(constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5])
      num_spec_constant_1 <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_constant_1, 5]
      species_error$num_spec_error[n_reps] <-
        abs(num_spec_geodynamics - num_spec_constant_1)
      num_colonist_geodynamamics <-
        length(geodynamics_simulations[[n_reps]]) - 1
      num_colonist_constant_1 <-
        length(constant_simulations_1[[n_reps]]) - 1
      species_error$num_colonist_error[n_reps] <-
        abs(num_colonist_geodynamamics - num_colonist_constant_1)
    }

    # Calculate endemic error -----------------------------------------------
    endemic_error <- list()
    for (n_reps in 1:replicates) {
      geodynamics_event_times <- geodynamics_simulations[[n_reps]][[1]]$stt_all[, 1]
      geodynamics_endemic_spec <- geodynamics_simulations[[n_reps]][[1]]$stt_all[, 2]
      constant_1_event_times <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_1_endemic_spec <- constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 2]
      endemic_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = geodynamics_event_times,
        species_number = geodynamics_endemic_spec,
        event_times2 = constant_1_event_times,
        species_number2 = constant_1_endemic_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
    }

    # Calculate nonendemic error ---------------------------------------------
    nonendemic_error <- list()
    n_colonists <- c()
    for (n_reps in 1:replicates) {
      geodynamics_event_times <-
        geodynamics_simulations[[n_reps]][[1]]$stt_all[, 1]
      geodynamics_nonendemic_spec <-
        geodynamics_simulations[[n_reps]][[1]]$stt_all[, 3] +
        geodynamics_simulations[[n_reps]][[1]]$stt_all[, 4]
      constant_1_event_times <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_1_nonendemic_spec <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 3] +
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 4]
      nonendemic_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = geodynamics_event_times,
        species_number = geodynamics_nonendemic_spec,
        event_times2 = constant_1_event_times,
        species_number2 = constant_1_nonendemic_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
    }

    # Maximum likelihood estimation 2 -----------------------------------------
    constant_ML_1 <- list()
    if (mean_DD_AICc_smaller) {
      for (i in seq_along(constant_simulations_1)) {
        for (j in seq_along(constant_simulations_1[[i]]))
          try(
            constant_ML_1[[i]] <- DAISIE::DAISIE_ML_CS(
              datalist = constant_simulations_1[[i]][[j]],
              datatype = "single",
              initparsopt = c(
                median_rates$medians[1],
                median_rates$medians[2],
                40,
                median_rates$medians[3],
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
    } else {
      for (i in seq_along(constant_simulations_1)) {
        for (j in seq_along(constant_simulations_1[[i]]))
          try(
            constant_ML_1[[i]] <- DAISIE::DAISIE_ML_CS(
              datalist = constant_simulations_1[[i]][[j]],
              datatype = "single",
              initparsopt = c(
                median_rates$medians[1],
                median_rates$medians[2],
                median_rates$medians[3],
                1
              ),
              idparsopt = c(1, 2, 4, 5),
              parsfix = Inf,
              idparsfix = 3,
              verbose = 1#0
            )
          )
        if (class(constant_ML_1[[i]]) == "try-error") {
          constant_ML_1[[i]] <- "No convergence"
        }
      }
    }

    # Calculate rates baseline error --------------------------------------------
    rates_baseline_error <- list()
    for (i in 1:length(constant_ML_1)) {
      rates_baseline_error$clado_error[i] <- abs(as.numeric(geodynamics_ML[[i]][1]) - constant_ML_1[[i]]$lambda_c)
      rates_baseline_error$ext_error[i] <- abs(as.numeric(geodynamics_ML[[i]][2]) - constant_ML_1[[i]]$mu)
      rates_baseline_error$K_error[i] <- abs(as.numeric(geodynamics_ML[[i]][3]) - constant_ML_1[[i]]$K)
      rates_baseline_error$immig_error[i] <- abs(as.numeric(geodynamics_ML[[i]][4]) - constant_ML_1[[i]]$gamma)
      rates_baseline_error$ana_error[i] <- abs(as.numeric(geodynamics_ML[[i]][5]) - constant_ML_1[[i]]$lambda_a)
    }

    # Second constant rate simulations ----------------------------------------
    constant_simulations_2 <- list()
    for (i in seq_along(constant_ML_1)) {
      constant_simulations_2[[i]] <- DAISIE::DAISIE_sim_constant_rate(
        time = simulation_pars$time,
        M = simulation_pars$M,
        pars = as.numeric(constant_ML_1[[i]][1:5]),
        replicates = 1,
        area_pars = NULL,
        plot_sims = FALSE,
        verbose = TRUE,#FALSE,
        sample_freq = Inf
      )
    }

    # Calculate baseline species and colonist error ---------------------------
    species_baseline_error <- list()
    n_colonists <- c()
    for (n_reps in 1:replicates) {
      constant_1_event_times <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_1_num_spec <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5]
      constant_2_event_times <-
        constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_2_num_spec <-
        constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 5]
      species_baseline_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = constant_1_event_times,
        species_number = constant_1_num_spec,
        event_times2 = constant_2_event_times,
        species_number2 = constant_2_num_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
      stt_last_row_constant_1 <-
        length(constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5])
      num_spec_constant_1 <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_constant_1, 5]
      stt_last_row_constant_2 <-
        length(constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 5])
      num_spec_constant_2 <-
        constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_constant_2, 5]
      species_baseline_error$num_spec_error[n_reps] <-
        abs(num_spec_constant_1 - num_spec_constant_2)
      num_colonist_constant_1 <-
        length(constant_simulations_1[[n_reps]]) - 1
      num_colonist_constant_2 <-
        length(constant_simulations_2[[n_reps]]) - 1
      species_baseline_error$num_colonist_error[n_reps] <-
        abs(num_colonist_constant_1 - num_colonist_constant_2)
    }

    # Calculate endemic baseline error -----------------------------------------------
    endemic_baseline_error <- list()
    for (n_reps in 1:replicates) {
      constant_1_event_times <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_1_endemic_spec <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 2]
      constant_2_event_times <-
        constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_2_endemic_spec <-
        constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 2]
      endemic_baseline_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = constant_1_event_times,
        species_number = constant_1_endemic_spec,
        event_times2 = constant_2_event_times,
        species_number2 = constant_2_endemic_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
    }

    # Calculate nonendemic baseline error ---------------------------------------------
    nonendemic_baseline_error <- list()
    n_colonists <- c()
    for (n_reps in 1:replicates) {
      constant_1_event_times <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_1_nonendemic_spec <-
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 3] +
        constant_simulations_1[[n_reps]][[1]][[1]]$stt_all[, 4]
      constant_2_event_times <-
        constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 1]
      constant_2_nonendemic_spec <-
        constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 3] +
        constant_simulations_2[[n_reps]][[1]][[1]]$stt_all[, 4]
      nonendemic_baseline_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = constant_1_event_times,
        species_number = constant_1_nonendemic_spec,
        event_times2 = constant_2_event_times,
        species_number2 = constant_2_nonendemic_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
    }

    output_file <- list(
      species_error = species_error,
      endemic_error = endemic_error,
      nonendemic_error = nonendemic_error,
      rates_error = rates_error,
      species_baseline_error = species_baseline_error,
      endemic_baseline_error = endemic_baseline_error,
      nonendemic_baseline_error = nonendemic_baseline_error,
      rates_baseline_error = rates_baseline_error,
      geodynamics_simulations = geodynamics_simulations,
      geodynamics_ML = geodynamics_ML,
      constant_simulations_1 = constant_simulations_1,
      constant_ML_1 = constant_ML_1,
      constant_simulations_2 = constant_simulations_2
    )
    output_file_name <- paste0(
      "passed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata")
  }

  save(output_file, file = output_file_name)
  return(output_file)
}
