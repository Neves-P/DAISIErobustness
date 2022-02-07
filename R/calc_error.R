#' Calculates error metrics between two simulations
#'
#' Calculates error in number of species and colonists, number of
#' species-through-time, number of endemics-through-time and
#' non-endemics-through-time.
#'
#' @inheritParams default_params_doc
#' @return A list with five error metrics:
#' \describe{
#'   \item{\code{$spec_nltt_error}}{Numeric vector with the nltt error between
#'     the two simulations.}
#'   \item{\code{$num_spec_error}}{Numeric vector with the difference in the
#'     number of species at the end of the simulation between the two
#'     simulations.}
#'   \item{\code{$num_col_error}}{Numeric vector with the difference in the
#'     number of colonists at the end of the simulation between the two
#'     simulations.}
#'   \item{\code{$endemic_nltt_error}}{Numeric vector with the nltt error of the
#'     endemic species between the two simulations.}
#'   \item{\code{$nonendemic_nltt_error}}{Numeric vector with the nltt error of
#'     the non-endemic species between the two simulations.}
#' }
#'
#' @author Joshua W. Lambert, Pedro Santos Neves, Shu Xie
calc_error <- function(sim_1,
                       sim_2,
                       sim_pars,
                       replicates,
                       distance_method) {
  spec_nltt_error <- c()
  num_spec_error <- c()
  num_col_error <- c()
  endemic_nltt_error <- c()
  nonendemic_nltt_error <- c()

  # M
  mainland_n <- sim_pars$M
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
  spec_nltt_error <- nLTT::nltt_diff_exact_extinct(
    event_times = sim_1_event_times,
    species_number = sim_1_num_spec,
    event_times2 = sim_2_event_times,
    species_number2 = sim_2_num_spec,
    distance_method = distance_method,
    time_unit = "ago",
    normalize = FALSE
  )
  stt_last_row_sim_1 <- nrow(sim_1[[1]][[1]]$stt_all)
  num_spec_sim_1 <-
    as.numeric(
      sim_1[[1]][[1]]$stt_all[stt_last_row_sim_1, "nI"] +
        sim_1[[1]][[1]]$stt_all[stt_last_row_sim_1, "nA"] +
        sim_1[[1]][[1]]$stt_all[stt_last_row_sim_1, "nC"])
  stt_last_row_sim_2 <- nrow(sim_2[[1]][[1]]$stt_all)
  num_spec_sim_2 <-
    as.numeric(
      sim_2[[1]][[1]]$stt_all[stt_last_row_sim_2, "nI"] +
        sim_2[[1]][[1]]$stt_all[stt_last_row_sim_2, "nA"] +
        sim_2[[1]][[1]]$stt_all[stt_last_row_sim_2, "nC"])
  num_spec_error <-
    abs(num_spec_sim_1 - num_spec_sim_2)
  num_col_sim_1 <- as.numeric(mainland_n - sim_1[[1]][[1]]$not_present)
  num_col_sim_2 <- as.numeric(mainland_n - sim_2[[1]][[1]]$not_present)

  num_col_error <-
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
  endemic_nltt_error <- nLTT::nltt_diff_exact_extinct(
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
  nonendemic_nltt_error <- nLTT::nltt_diff_exact_extinct(
    event_times = sim_1_event_times,
    species_number = sim_1_nonendemic_spec,
    event_times2 = sim_2_event_times,
    species_number2 = sim_2_nonendemic_spec,
    distance_method = distance_method,
    time_unit = "ago",
    normalize = FALSE
  )

  return(
    list(spec_nltt_error = spec_nltt_error,
         num_spec_error = num_spec_error,
         num_col_error = num_col_error,
         endemic_nltt_error = endemic_nltt_error,
         nonendemic_nltt_error = nonendemic_nltt_error)
  )
}
