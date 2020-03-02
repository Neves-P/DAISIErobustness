#' Calcualtes error in rates, number of species-through-time, number
#' of endemics-through-time and non-endemics-through-time
#'
#' @inheritParams default_params_doc
#'
#' @return A list with four error metrics
#' @export
calc_error <- function(
  simulation_pars,
  ml,
  simulations_1,
  simulations_2,
  replicates) {

  rates_error <- list()
  for (i in seq_along(ml)) {
    rates_error$clado_error[i] <-
      abs(simulation_pars$pars[1] - ml[[i]]$lambda_c)
    rates_error$ext_error[i] <- abs(simulation_pars$pars[2] - ml[[i]]$mu)
    rates_error$K_error[i] <-
      abs(simulation_pars$pars[3] - ml[[i]]$K)
    rates_error$immig_error[i] <-
      abs(simulation_pars$pars[4] - ml[[i]]$gamma)
    rates_error$ana_error[i] <-
      abs(simulation_pars$pars[5] - ml[[i]]$lambda_a)
  }
  species_error <- list()
  for (n_reps in 1:replicates) {
    simulations_1_event_times <-
      simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
    simulations_1_num_spec <-
      simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5]
    simulations_2_event_times <-
      simulations_2[[n_reps]][[1]][[1]]$stt_all[, 1]
    simulations_2_num_spec <-
      simulations_2[[n_reps]][[1]][[1]]$stt_all[, 5]
    species_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
      event_times = simulations_1_event_times,
      species_number = simulations_1_num_spec,
      event_times2 = simulations_2_event_times,
      species_number2 = simulations_2_num_spec,
      distance_method = "abs",
      time_unit = "ago",
      normalize = FALSE
    )
    stt_last_row_simulations_1 <-
      length(simulations_1[[n_reps]][[1]][[1]]$stt_all[, 5])
    num_spec_simulations_1 <-
      simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_1, 2] +
      simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_1, 3] +
      simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_1, 4]
    stt_last_row_simulations_2 <-
      length(simulations_2[[n_reps]][[1]][[1]]$stt_all[, 5])
    num_spec_simulations_2 <-
      simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_2, 2] +
      simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_2, 3] +
      simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_2, 4]
    species_error$num_spec_error[n_reps] <-
      abs(num_spec_simulations_1 - num_spec_simulations_2)
    num_colonists_simulations_1 <-
      simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_1, 5]
    num_colonists_simulations_2 <-
      simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_2, 5]
    species_error$num_colonists_error[n_reps] <-
      abs(num_colonists_simulations_1 - num_colonists_simulations_2)
  }

endemic_error <- list()
for (n_reps in 1:replicates) {
  simulations_1_event_times <- simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
  simulations_1_endemic_spec <- simulations_1[[n_reps]][[1]][[1]]$stt_all[, 2]
  simulations_2_event_times <- simulations_2[[n_reps]][[1]][[1]]$stt_all[, 1]
  simulations_2_endemic_spec <- simulations_2[[n_reps]][[1]][[1]]$stt_all[, 2]
  endemic_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
    event_times = simulations_1_event_times,
    species_number = simulations_1_endemic_spec,
    event_times2 = simulations_2_event_times,
    species_number2 = simulations_2_endemic_spec,
    distance_method = "abs",
    time_unit = "ago",
    normalize = FALSE
  )
}

nonendemic_error <- list()
for (n_reps in 1:replicates) {
  simulations_1_event_times <-
    simulations_1[[n_reps]][[1]][[1]]$stt_all[, 1]
  simulations_1_nonendemic_spec <-
    simulations_1[[n_reps]][[1]][[1]]$stt_all[, 3] +
    simulations_1[[n_reps]][[1]][[1]]$stt_all[, 4]
  simulations_2_event_times <-
    simulations_2[[n_reps]][[1]][[1]]$stt_all[, 1]
  simulations_2_nonendemic_spec <-
    simulations_2[[n_reps]][[1]][[1]]$stt_all[, 3] +
    simulations_2[[n_reps]][[1]][[1]]$stt_all[, 4]
  nonendemic_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
    event_times = simulations_1_event_times,
    species_number = simulations_1_nonendemic_spec,
    event_times2 = simulations_2_event_times,
    species_number2 = simulations_2_nonendemic_spec,
    distance_method = "abs",
    time_unit = "ago",
    normalize = FALSE
  )
}
return(
  list(rates_error = rates_error,
       species_error = species_error,
       endemic_error = endemic_error,
       nonendemic_error = nonendemic_error))
}
