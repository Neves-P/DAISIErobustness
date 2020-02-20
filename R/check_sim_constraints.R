#' Checks for output of param space
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
check_sim_constraints <- function(param_space_name,
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
    simulation_pars$shift_times <- simulation_pars$shift_times[-length(simulation_pars$shift_times)]
  }

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
  prop_rep_over_15_spec <- length(which(n_spec >= 15))
  prop_rep_over_5_cols <- length(which(n_colonists > 5))
  prop_rep_over_100_spec <- length(which(n_spec <= 100))
  if ((prop_rep_over_15_spec / replicates) < 0.95 ||
      (prop_rep_over_5_cols / replicates) < 0.95 ||
      (prop_rep_over_100_spec / replicates) < 0.95) {
    output_file <- "95% of replicates did not meet contraints"
    output_file_name <- paste0(
      "fail_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata")
  } else {
    output_file <- "95% of replicates met constraints"
    output_file_name <- paste0(
      "passed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata")
  }
  output_path <- file.path(param_space_name, output_file_name)
  save(output_file, file = output_path)
  return(output_file)
}
