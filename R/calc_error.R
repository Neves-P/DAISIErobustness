#' Calcualtes error in rates, number of species-through-time, number
#' of endemics-through-time and non-endemics-through-time
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return A list with four error metrics
#' @family error calculations
#' @export
calc_error <- function(simulations_1,
                       simulations_2,
                       replicates) {
  spec_error <- list()
  for (n_reps in 1:replicates) {
    if (is.character(simulations_1[[n_reps]]) ||
        is.character(simulations_2[[n_reps]])) {
      spec_error[[n_reps]] <- "ML didn't converge"
    } else {
      simulations_1_event_times <-
        simulations_1[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      simulations_1_num_spec <-
        simulations_1[[n_reps]][[1]][[1]]$stt_all[, "nI"] +
        simulations_1[[n_reps]][[1]][[1]]$stt_all[, "nA"] +
        simulations_1[[n_reps]][[1]][[1]]$stt_all[, "nC"]
      simulations_2_event_times <-
        simulations_2[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      simulations_2_num_spec <-
        simulations_2[[n_reps]][[1]][[1]]$stt_all[, "nI"] +
        simulations_2[[n_reps]][[1]][[1]]$stt_all[, "nA"] +
        simulations_2[[n_reps]][[1]][[1]]$stt_all[, "nC"]
      spec_error$nltt[n_reps] <- nLTT::nltt_diff_exact_extinct(
        event_times = simulations_1_event_times,
        species_number = simulations_1_num_spec,
        event_times2 = simulations_2_event_times,
        species_number2 = simulations_2_num_spec,
        distance_method = "abs",
        time_unit = "ago",
        normalize = FALSE
      )
      stt_last_row_simulations_1 <-
        length(simulations_1[[n_reps]][[1]][[1]]$stt_all[, "present"])
      num_spec_simulations_1 <-
        simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_1, "nI"] +
        simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_1, "nA"] +
        simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_1, "nC"]
      stt_last_row_simulations_2 <-
        length(simulations_2[[n_reps]][[1]][[1]]$stt_all[, "present"])
      num_spec_simulations_2 <-
        simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_2, "nI"] +
        simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_2, "nA"] +
        simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_2, "nC"]
      spec_error$num_spec_error[n_reps] <-
        abs(num_spec_simulations_1 - num_spec_simulations_2)
      num_col_simulations_1 <-
        simulations_1[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_1, "present"]
      num_col_simulations_2 <-
        simulations_2[[n_reps]][[1]][[1]]$stt_all[stt_last_row_simulations_2, "present"]
      spec_error$num_col_error[n_reps] <-
        abs(num_col_simulations_1 - num_col_simulations_2)
    }
  }
  endemic_error <- list()
  for (n_reps in 1:replicates) {
    if (is.character(simulations_1[[n_reps]]) ||
        is.character(simulations_2[[n_reps]])) {
      endemic_error[[n_reps]] <- "ML didn't converge"
    } else {
      simulations_1_event_times <-
        simulations_1[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      simulations_1_endemic_spec <-
        simulations_1[[n_reps]][[1]][[1]]$stt_all[, "nA"] +
        simulations_1[[n_reps]][[1]][[1]]$stt_all[, "nC"]
      simulations_2_event_times <-
        simulations_2[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      simulations_2_endemic_spec <-
        simulations_2[[n_reps]][[1]][[1]]$stt_all[, "nA"] +
        simulations_2[[n_reps]][[1]][[1]]$stt_all[, "nC"]
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
  }
  nonendemic_error <- list()
  for (n_reps in 1:replicates) {
    if (is.character(simulations_1[[n_reps]]) ||
        is.character(simulations_2[[n_reps]])) {
      nonendemic_error[[n_reps]] <- "ML didn't converge"
    } else {
      simulations_1_event_times <-
        simulations_1[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      simulations_1_nonendemic_spec <-
        simulations_1[[n_reps]][[1]][[1]]$stt_all[, "nI"]
      simulations_2_event_times <-
        simulations_2[[n_reps]][[1]][[1]]$stt_all[, "Time"]
      simulations_2_nonendemic_spec <-
        simulations_2[[n_reps]][[1]][[1]]$stt_all[, "nI"]
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
  }

  return(
    list(spec_error = spec_error,
         endemic_error = endemic_error,
         nonendemic_error = nonendemic_error))
}
