#' Calculate maximum likelihood value for the rates
#'
#' @inheritParams default_params_doc
#'
#' @return Output from \code{\link{DAISIE_ML_CS}}
#' @author Joshua Lambert
#' @export
calc_ml <- function(param_space_name,
                    simulation_pars,
                    simulations) {
  ml <- list()
  if (param_space_name == "oceanic_ontogeny" ||
      param_space_name == "oceanic_sea_level" ||
      param_space_name == "oceanic_ontogeny_sea_level" ||
      param_space_name == "nonoceanic_sea_level") {
    median_rates <- DAISIE::DAISIE_calc_sumstats_pcrates(
      pars = simulation_pars$pars,
      area_pars = simulation_pars$area_pars,
      ext_pars = simulation_pars$ext_pars,
      totaltime = simulation_pars$time
    )
  } else {
    median_rates <- list(medians = c(simulation_pars$pars[1],
                                     simulation_pars$pars[2],
                                     simulation_pars$pars[4]))
  }

  for (i in seq_along(simulations)) {
    try(
      ml[[i]] <- DAISIE::DAISIE_ML_CS(
        datalist = simulations[[i]][[1]],
        datatype = "single",
        initparsopt = c(median_rates$medians[1],
                        median_rates$medians[2],
                        40,
                        median_rates$medians[3],
                        1),
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
