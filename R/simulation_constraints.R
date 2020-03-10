#' Checks if the simulations meet the criteria for data sample size
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Boolean
#' @export
simulation_constraints <- function(simulations,
                                   replicates) {
  stt_rows <- c()
  n_spec <- c()
  n_colonists <- c()
  for (i in seq_len(replicates)) {
    stt_rows[i] <- nrow(simulations[[i]][[1]][[1]]$stt_all)
    n_spec[i] <-
      as.numeric(simulations[[i]][[1]][[1]]$stt_all[stt_rows[i], "nI"]) +
      as.numeric(simulations[[i]][[1]][[1]]$stt_all[stt_rows[i], "nA"]) +
      as.numeric(simulations[[i]][[1]][[1]]$stt_all[stt_rows[i], "nC"])
    n_colonists[i] <-
      as.numeric(simulations[[i]][[1]][[1]]$stt_all[stt_rows[i], "present"])
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
