#' Loads the parameter space into the environment for simulations
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return tibble parameter space.
#' @export
load_param_space <- function(param_space_name) {
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/shu_merge/data/"
  file <- paste0(file_domain, param_space_name, ".csv")
  param_space <- readr::read_csv2(
    file = file
  )
  return(param_space)
}
