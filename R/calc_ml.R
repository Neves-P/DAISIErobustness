#' Calculate maximum likelihood value for the rates
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Output from \code{\link[DAISIE]{DAISIE_ML_CS}}
#' @importFrom utils capture.output
#' @export
calc_ml <- function(sim) {
  ml <- list()

  for (i in seq_along(sim)) {
    message(paste0("Running ML ", i, " of ", length(sim)))
    if (is.character(sim[[i]])) {
      ml[[i]] <- "ML didn't converge"
    } else {
      try(
        suppressMessages(invisible(capture.output(ml[[i]] <- DAISIE::DAISIE_ML_CS(
          datalist = sim[[i]][[1]],
          datatype = "single",
          initparsopt = c(1, 1, 40, 0.01, 1),
          idparsopt = c(1:5),
          parsfix = NULL,
          idparsfix = NULL
        )
      )
      )))
      if (!exists(paste0("ml[[", i, "]]"))) {
        ml[[i]] <- "MLE crashed"
      } else if (ml[[i]]$conv != 0) {
        ml[[i]] <- "ML didn't converge"
      }
    }
  }
  return(ml)
}
