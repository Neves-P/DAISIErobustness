#' Loads the parameter space into the environment for simulations
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return tibble parameter space.
#' @family parameter set handling functions
#' @export
load_param_space <- function(param_space_name) {
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/data/"
  file <- paste0(file_domain, param_space_name, ".csv")
  param_space <- readr::read_csv2(
    file = file
  )
  return(param_space)
}
