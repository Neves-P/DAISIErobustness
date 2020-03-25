#' Calcualtes error in rates, number of species-through-time, number
#' of endemics-through-time and non-endemics-through-time
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return A list with four error metrics
#' @family error calculations
#' @export
calc_error <- function(sim_1,
                       sim_2,
                       replicates) {
  spec_error <- list()
  for (n_reps in 1:replicates) {
    if (is.character(sim_1[[n_reps]]) ||
        is.character(sim_2[[n_reps]])) {
      spec_error[[n_reps]] <- skip_failed_convergence()
    } else {
      sim_1_event_times <-
        sim_1[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      sim_1_num_spec <-
        sim_1[[n_reps]][[1]][[1]]$stt_all[, "nI"] +
        sim_1[[n_reps]][[1]][[1]]$stt_all[, "nA"] +
        sim_1[[n_reps]][[1]][[1]]$stt_all[, "nC"]
      sim_2_event_times <-
        sim_2[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      sim_2_num_spec <-
        sim_2[[n_reps]][[1]][[1]]$stt_all[, "nI"] +
        sim_2[[n_reps]][[1]][[1]]$stt_all[, "nA"] +
        sim_2[[n_reps]][[1]][[1]]$stt_all[, "nC"]
      spec_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = sim_1_event_times,
        species_number = sim_1_num_spec,
        event_times2 = sim_2_event_times,
        species_number2 = sim_2_num_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
      stt_last_row_sim_1 <-
        length(sim_1[[n_reps]][[1]][[1]]$stt_all[, "present"])
      num_spec_sim_1 <-
        sim_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_sim_1, "nI"] +
        sim_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_sim_1, "nA"] +
        sim_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_sim_1, "nC"]
      stt_last_row_sim_2 <-
        length(sim_2[[n_reps]][[1]][[1]]$stt_all[, "present"])
      num_spec_sim_2 <-
        sim_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_sim_2, "nI"] +
        sim_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_sim_2, "nA"] +
        sim_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_sim_2, "nC"]
      spec_error$num_spec_error[n_reps] <-
        abs(num_spec_sim_1 - num_spec_sim_2)
      num_col_sim_1 <-
        sim_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_sim_1, "present"]
      num_col_sim_2 <-
        sim_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_sim_2, "present"]
      spec_error$num_col_error[n_reps] <-
        abs(num_col_sim_1 - num_col_sim_2)
    }
  }
  endemic_error <- list()
  for (n_reps in 1:replicates) {
    if (is.character(sim_1[[n_reps]]) ||
        is.character(sim_2[[n_reps]])) {
      endemic_error[[n_reps]] <- skip_failed_convergence()
    } else {
      sim_1_event_times <-
        sim_1[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      sim_1_endemic_spec <-
        sim_1[[n_reps]][[1]][[1]]$stt_all[, "nA"] +
        sim_1[[n_reps]][[1]][[1]]$stt_all[, "nC"]
      sim_2_event_times <-
        sim_2[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      sim_2_endemic_spec <-
        sim_2[[n_reps]][[1]][[1]]$stt_all[, "nA"] +
        sim_2[[n_reps]][[1]][[1]]$stt_all[, "nC"]
      endemic_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = sim_1_event_times,
        species_number = sim_1_endemic_spec,
        event_times2 = sim_2_event_times,
        species_number2 = sim_2_endemic_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
    }
  }
  nonendemic_error <- list()
  for (n_reps in 1:replicates) {
    if (is.character(sim_1[[n_reps]]) ||
        is.character(sim_2[[n_reps]])) {
      nonendemic_error[[n_reps]] <- skip_failed_convergence()
    } else {
      sim_1_event_times <-
        sim_1[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      sim_1_nonendemic_spec <-
        sim_1[[n_reps]][[1]][[1]]$stt_all[, "nI"]
      sim_2_event_times <-
        sim_2[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      sim_2_nonendemic_spec <-
        sim_2[[n_reps]][[1]][[1]]$stt_all[, "nI"]
      nonendemic_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = sim_1_event_times,
        species_number = sim_1_nonendemic_spec,
        event_times2 = sim_2_event_times,
        species_number2 = sim_2_nonendemic_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
    }
  }

  return(
    list(spec_error = spec_error,
         endemic_error = endemic_error,
         nonendemic_error = nonendemic_error))
}
