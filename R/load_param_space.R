#' Loads the parameter space into the environment for simulations
#'
#' @inheritParams default_params_doc
#'
#' @return tibble parameter space
#' @export
#'
#' @examples oceanic_ontogeny <- load_param_space(
#'              param_space_name = "oceanic_ontogeny")
load_param_space <- function(param_space_name) {
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/data/"
  file <- paste0(file_domain, param_space_name, ".csv")
  param_space <- readr::read_csv(
    file = file
  )
  return(param_space)
}


