#' Calculate maximum likelihood value for the rates
#'
#' @inheritParams default_params_doc
#' @return Output from \code{\link[DAISIE]{DAISIE_ML}()}
#' @importFrom utils capture.output
#' @keywords internal
#' @author Joshua Lambert, Pedro Neves, Shu Xie
calc_ml <- function(sim,
                    initial_parameters) {
  try(
    suppressMessages(invisible(capture.output(
      ml <- DAISIE::DAISIE_ML_CS(
        datalist = sim[[1]],
        datatype = "single",
        initparsopt = as.numeric(initial_parameters[1:5]),
        idparsopt = c(1:5),
        ddmodel = 11,
        parsfix = NULL,
        idparsfix = NULL,
        cond = 5,
        jitter = -1e-5,
        methode = "odeint::runge_kutta_fehlberg78"
      )
    )
    )))
  return(ml)
}
