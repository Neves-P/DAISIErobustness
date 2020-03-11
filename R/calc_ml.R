#' Calculate maximum likelihood value for the rates
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Output from \code{\link[DAISIE]{DAISIE_ML}}
#' @export
calc_ml <- function(param_space_name,
                    simulation_pars,
                    simulations,
                    verbose) {
  ml <- list()
  if (verbose == TRUE) {
    verbose <- 1
  } else {
    verbose <- 0
  }
  for (i in seq_along(simulations)) {
    try(
      ml[[i]] <- DAISIE::DAISIE_ML_CS(
        datalist = simulations[[i]][[1]],
        datatype = "single",
        initparsopt = c(1, 1, 40, 0.01, 1),
        idparsopt = c(1:5),
        parsfix = NULL,
        idparsfix = NULL,
        verbose = 0
      )
    )
    if (class(ml[[i]]) == "try-error") {
      ml[[i]] <- "No convergence"
    }
  }
  return(ml)
}
