#' Calculate maximum likelihood value for the rates
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Output from \code{\link[DAISIE]{DAISIE_ML_CS}}
#' @importFrom utils capture.output
#' @export
calc_ml <- function(simulations) {
  ml <- list()
  for (i in seq_along(simulations)) {
    message(paste0("Running ML ", i, " of ", length(simulations)))
    try(
      suppressMessages(invisible(capture.output(ml[[i]] <- DAISIE::DAISIE_ML_CS(
        datalist = simulations[[i]][[1]],
        datatype = "single",
        initparsopt = c(1, 1, 40, 0.01, 1),
        idparsopt = c(1:5),
        parsfix = NULL,
        idparsfix = NULL
      ))))
    )
    if (class(ml[[i]]) == "try-error") {
      ml[[i]] <- "No convergence"
    }
  }
  return(ml)
}
