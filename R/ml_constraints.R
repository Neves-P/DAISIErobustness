#' Checks if number of valid errors meet the criteria for data sample size
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Logical \code{TRUE} if criteria are met, \code{FALSE} if not.
ml_constraints <- function(ml) {
  testit::assert(is.list(ml))
  failed_mls <- sapply(ml, FUN = is.character)
  if (any(failed_mls) == TRUE) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

#' Checks if MLE results converge
#'
#' @inheritParams  default_params_doc
#'
#' @return Logical \code{TRUE} if criteria are met, \code{FALSE} if not.
check_ml_tolerance <- function(ml_res_initpars_1,
                               ml_res_initpars_2) {
  tolerance_check <- c()
  n_replicates <- length(ml_res_initpars_1)
  for (i in seq_along(ml_res_initpars_2)) {

    ml_1 <- ml_res_initpars_1[[i]][1:5]
    ml_2 <- ml_res_initpars_2[[i]][1:5]

    upper_bound <- 1000
    if (any(ml_1 >= upper_bound)) {
      ml_1[which(ml_1 >= upper_bound)] <- upper_bound
    }
    if (any(ml_2 >= upper_bound)) {
      ml_2[which(ml_2 >= upper_bound)] <- upper_bound
    }


    absolute_difference <- abs(ml_1 - ml_2)
    if (any(absolute_difference > 3)) {
      tolerance_check[i] <- "fail"
    } else {
      tolerance_check[i] <- "pass"
    }
  }
  if ((sum(tolerance_check == "pass") / n_replicates) < 0.95) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}
