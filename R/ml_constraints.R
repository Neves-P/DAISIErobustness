#' Checks if number of valid errors meet the criteria for data sample size
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @keywords internal
#' @return Logical \code{TRUE} if criteria are met, \code{FALSE} if not.
ml_constraints <- function(ml, replicates) {
  testit::assert(is.list(ml))
  failed_mls <- sapply(ml, FUN = is.character)

  n_failed_mls <- sum(failed_mls)
  if (n_failed_mls / replicates < 0.05) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Check if MLE results converge and chooses best MLE output
#'
#' @description
#' Since two MLE runs with different initial optimizer parameters
#' are done, the best parameter set between the two must be decided. This is
#' done by choosing the set for which the highest loglikelihood value was
#' obtained.
#'
#' @inheritParams  default_params_doc
#'
#' @details
#' To keep track of the differences between the two estimated sets,
#' it is also determined if the estimated parameters differ by a value greater
#' than the normally used tolerance value for the ML optimization (1e-6). The
#' same is also done regarding the absolute differences in loglikelihoods.
#' The flow of \code{\link{run_robustness}()} is not affected by the
#' comparisons with a tolerance, rather these values are kept for downstream
#' QC of results.
#' @return
#' List with item per replicate containing:
#'   \itemize{
#'     \item{\code{pars_to_use}: Single row data frame with the parameter
#'     set from the MLE with the highest obtained loglik value.}
#'     \item{\code{loglik_tolerance_check}: Character
#'     \code{"fail loglik difference"} which indicates that the absolute
#'     difference between the two compared logliks is greater than the tolerance
#'     value (1e-6) or \code{"pass loglik difference"} when the absolute
#'     difference is smaller than the tolerance.}
#'     \item{\code{absolute_loglik_difference}: Numeric with the absolute
#'     difference between the two logliks.}
#'     \item{\code{pars_tolerance_check}: Character
#'     \code{"fail pars difference"} if the absolute difference between any of
#'     the the two compared estimated parameter sets is greater than the
#'     tolerance value (1e-6) or \code{"pass pars difference"} when the absolute
#'     difference is smaller than the tolerance.}
#'     \item{\code{absolute_pars_difference}: List of numeric vectors with the
#'     absolute difference calculated between the two parameter sets.}
#'   }
#' @seealso \code{\link[DAISIE]{DAISIE_ML}()}, \code{\link{calc_ml}()}
#' @author Joshua Lambert, Pedro Neves, Shu Xie
decide_best_pars <- function(ml_res_initpars_1,
                             ml_res_initpars_2,
                             novel_ml_constraints_1,
                             novel_ml_constraints_2) {
  out <- list()
  n_replicates <- length(ml_res_initpars_1)

  if (novel_ml_constraints_1 == FALSE) {
    out <- ml_res_initpars_2
  } else if (novel_ml_constraints_2 == FALSE) {
    out <- ml_res_initpars_1
  } else {
    for (i in seq_len(n_replicates)) {
      ml_1_loglik <- as.numeric(ml_res_initpars_1[[i]][6])
      ml_2_loglik <- as.numeric(ml_res_initpars_2[[i]][6])
      logliks <- c(ml_1_loglik, ml_2_loglik)
      set_with_highest_loglik <- which(max(logliks) == logliks)[1]
      testit::assert(length(set_with_highest_loglik) == 1)
      pars_list <- list(ml_res_initpars_1[[i]], ml_res_initpars_2[[i]])
      pars_to_use <- pars_list[[set_with_highest_loglik]]

      out[[i]] <- pars_to_use
    }
  }
  return(out)
}
