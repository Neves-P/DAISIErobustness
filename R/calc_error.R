#' Calcualtes error in number of species and colonists, number of
#' species-through-time, number of endemics-through-time and
#' non-endemics-through-time
#'
#' @inheritParams default_params_doc
#' @return A list with three error metrics
#' @author Joshua Lambert, Pedro Neves, Shu Xie
calc_error <- function(sim_1,
                       sim_2,
                       replicates,
                       distance_method) {
  spec_error <- list()
  endemic_error <- list()
  nonendemic_error <- list()
  if (is.character(sim_2)) {
    spec_error <- "ML didn't converge"
    endemic_error <- "ML didn't converge"
    nonendemic_error <- "ML didn't converge"
  } else {
    # Spec error
    sim_1_event_times <-
      sim_1[[1]][[1]]$stt_all[, "Time"]
    sim_1_num_spec <-
      sim_1[[1]][[1]]$stt_all[, "nI"] +
      sim_1[[1]][[1]]$stt_all[, "nA"] +
      sim_1[[1]][[1]]$stt_all[, "nC"]
    sim_2_event_times <-
      sim_2[[1]][[1]]$stt_all[, "Time"]
    sim_2_num_spec <-
      sim_2[[1]][[1]]$stt_all[, "nI"] +
      sim_2[[1]][[1]]$stt_all[, "nA"] +
      sim_2[[1]][[1]]$stt_all[, "nC"]
    spec_error$nltt <- nLTT::nltt_diff_exact_extinct(
      event_times = sim_1_event_times,
      species_number = sim_1_num_spec,
      event_times2 = sim_2_event_times,
      species_number2 = sim_2_num_spec,
      distance_method = distance_method,
      time_unit = "ago",
      normalize = FALSE
    )
    stt_last_row_sim_1 <-
      length(sim_1[[1]][[1]]$stt_all[, "present"])
    num_spec_sim_1 <-
      as.numeric(
        sim_1[[1]][[1]]$stt_all[stt_last_row_sim_1, "nI"] +
        sim_1[[1]][[1]]$stt_all[stt_last_row_sim_1, "nA"] +
        sim_1[[1]][[1]]$stt_all[stt_last_row_sim_1, "nC"])
    stt_last_row_sim_2 <-
      length(sim_2[[1]][[1]]$stt_all[, "present"])
    num_spec_sim_2 <-
      as.numeric(
        sim_2[[1]][[1]]$stt_all[stt_last_row_sim_2, "nI"] +
        sim_2[[1]][[1]]$stt_all[stt_last_row_sim_2, "nA"] +
        sim_2[[1]][[1]]$stt_all[stt_last_row_sim_2, "nC"])
    spec_error$num_spec_error <-
      abs(num_spec_sim_1 - num_spec_sim_2)
    num_col_sim_1 <-
      as.numeric(sim_1[[1]][[1]]$stt_all[stt_last_row_sim_1, "present"])
    num_col_sim_2 <-
      as.numeric(sim_2[[1]][[1]]$stt_all[stt_last_row_sim_2, "present"])
    spec_error$num_col_error <-
      abs(num_col_sim_1 - num_col_sim_2)

    # Endemic error
    sim_1_event_times <-
      sim_1[[1]][[1]]$stt_all[, "Time"]
    sim_1_endemic_spec <-
      sim_1[[1]][[1]]$stt_all[, "nA"] +
      sim_1[[1]][[1]]$stt_all[, "nC"]
    sim_2_event_times <-
      sim_2[[1]][[1]]$stt_all[, "Time"]
    sim_2_endemic_spec <-
      sim_2[[1]][[1]]$stt_all[, "nA"] +
      sim_2[[1]][[1]]$stt_all[, "nC"]
    endemic_error$nltt <- nLTT::nltt_diff_exact_extinct(
      event_times = sim_1_event_times,
      species_number = sim_1_endemic_spec,
      event_times2 = sim_2_event_times,
      species_number2 = sim_2_endemic_spec,
      distance_method = distance_method,
      time_unit = "ago",
      normalize = FALSE
    )

    # Nonendemic error
    sim_1_event_times <-
      sim_1[[1]][[1]]$stt_all[, "Time"]
    sim_1_nonendemic_spec <-
      sim_1[[1]][[1]]$stt_all[, "nI"]
    sim_2_event_times <-
      sim_2[[1]][[1]]$stt_all[, "Time"]
    sim_2_nonendemic_spec <-
      sim_2[[1]][[1]]$stt_all[, "nI"]
    nonendemic_error$nltt <- nLTT::nltt_diff_exact_extinct(
      event_times = sim_1_event_times,
      species_number = sim_1_nonendemic_spec,
      event_times2 = sim_2_event_times,
      species_number2 = sim_2_nonendemic_spec,
      distance_method = distance_method,
      time_unit = "ago",
      normalize = FALSE
    )
  }

  return(
    list(spec_error = spec_error,
         endemic_error = endemic_error,
         nonendemic_error = nonendemic_error))
}
