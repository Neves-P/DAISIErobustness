#' Calculate maximum likelihood value for the rates
#'
#' @inheritParams default_params_doc
#' @return Output from \code{\link[DAISIE]{DAISIE_ML}()}
#' @importFrom utils capture.output
#' @keywords internal
#' @author Joshua W. Lambert, Pedro Santos Neves, Shu Xie
calc_ml <- function(sim,
                    initial_parameters) {

  all_endemic <- all_endemic(sim[[1]])
  any_recols <- any_recols(sim[[1]])
  optim_ana <- isFALSE(all_endemic) || any_recols

  # sets the number of steps for the integrations of the ODES
  DAISIE::DAISIE_CS_max_steps(1e8)

  if (optim_ana) {
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
        jitter = 1e-5,
        methode = "lsodes"
      )
    )))
  } else {
    fix_ana_zero <- all_endemic_clades(sim[[1]])
    if (fix_ana_zero) {
      suppressMessages(invisible(capture.output(
        ml <- DAISIE::DAISIE_ML_CS(
          datalist = sim[[1]],
          datatype = "single",
          initparsopt = as.numeric(initial_parameters[1:4]),
          idparsopt = 1:4,
          parsfix = 0,
          idparsfix = 5,
          cond = 5,
          ddmodel = 11,
          methode = "lsodes",
          jitter = 1e-5)
      )))
    } else {
      suppressMessages(invisible(capture.output(
        ml <- DAISIE::DAISIE_ML_CS(
          datalist = sim[[1]],
          datatype = "single",
          initparsopt = as.numeric(initial_parameters[1:4]),
          idparsopt = 1:4,
          parsfix = 100,
          idparsfix = 5,
          cond = 5,
          ddmodel = 11,
          methode = "lsodes",
          jitter = 1e-5)
      )))
    }
  }
  return(ml)
}
