#' Calculate maximum likelihood value for the rates
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Output from \code{\link[DAISIE]{DAISIE_ML}}
#' @importFrom utils capture.output
#' @export
calc_ml <- function(sim, initial_parameters) {
  ml <- list()

  for (i in seq_along(sim)) {
    message(paste0("Running ML ", i, " of ", length(sim)))
    if (is.character(sim[[i]])) {
      ml[[i]] <- "ML didn't converge"
    } else {
      try(
        suppressMessages(invisible(capture.output(
          ml[[i]] <- DAISIE::DAISIE_ML_CS(
            datalist = sim[[i]][[1]],
            datatype = "single",
            initparsopt = initial_parameters[[i]][1:5],
            idparsopt = c(1:5),
            parsfix = NULL,
            idparsfix = NULL
          )
        )
        )))
      if (ml[[i]]$conv != 0) {
        ml[[i]] <- "ML didn't converge"
      }
    }
  }
  return(ml)
}

#' Calculate mean of ML estimates
#'
#' @inheritParams default_params_doc
#'
#' @return Numeric list with elementwise means of ML runs with different initial
#'   parameters.
mean_geodynamic_ml <- function(ml_res_initpars_1,
                               ml_res_initpars_2) {
  out <- list()
  for (i in seq_along(ml_res_initpars_1)) {
    out[[i]] <- colMeans(rbind(
      ml_res_initpars_1[[i]],
      ml_res_initpars_2[[i]]
    ), na.rm = TRUE)
  testit::assert(is.numeric(out[[i]]) && all(is.finite(out[[i]])))
  }
  testit::assert(is.list(out))
  return(out)
}
