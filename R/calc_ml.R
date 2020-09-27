#' Calculate maximum likelihood value for the rates
#'
#' @inheritParams default_params_doc
#' @return Output from \code{\link[DAISIE]{DAISIE_ML}()}
#' @importFrom utils capture.output
#' @keywords internal
#' @author Joshua Lambert, Pedro Neves, Shu Xie
calc_ml <- function(sim,
                    initial_parameters) {
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
            initparsopt = as.numeric(initial_parameters[[i]][1:5]),
            idparsopt = c(1:5),
            ddmodel = 11,
            parsfix = NULL,
            idparsfix = NULL,
            cond = 5,
            jitter = -1e-5
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
