#' Loads the parameter space into the environment for simulations
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return Data frame with the parameter space.
#' @export
load_param_space <- function(param_space_name) {
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/data/" # nolint
  file <- paste0(file_domain, param_space_name, ".csv")
  param_space <- utils::read.csv2(
    file = file
  )
  return(param_space)
}
