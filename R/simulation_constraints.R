#' Checks if the simulations meet the criteria for data sample size
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert
#' @return Boolean
#' @export
simulation_constraints <- function(simulations,
                                   replicates) {
  stt_rows <- c()
  n_spec <- c()
  n_colonists <- c()
  for (n_reps in seq_len(replicates)) {
    stt_rows[n_reps] <- nrow(simulations[[n_reps]][[1]][[1]]$stt_all)
    n_spec[n_reps] <-
      as.numeric(simulations[[n_reps]][[1]][[1]]$stt_all[stt_rows[n_reps], "nI"]) +
      as.numeric(simulations[[n_reps]][[1]][[1]]$stt_all[stt_rows[n_reps], "nA"]) +
      as.numeric(simulations[[n_reps]][[1]][[1]]$stt_all[stt_rows[n_reps], "nC"])
    n_colonists[n_reps] <-
      as.numeric(simulations[[n_reps]][[1]][[1]]$stt_all[stt_rows[n_reps], "present"])
  }
  prop_rep_over_15_spec <- length(which(n_spec >= 15))
  prop_rep_over_5_cols <- length(which(n_colonists >= 5))
  prop_rep_less_100_spec <- length(which(n_spec <= 100))
  if ((prop_rep_over_15_spec / replicates) >= 0.95 &&
      (prop_rep_over_5_cols / replicates) >= 0.95 &&
      (prop_rep_less_100_spec / replicates) >= 0.95) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
