#' Submits robustness pipeline jobs to the Peregrine cluster
#'
#' @param param_space A string with the parameter space to run. Can
#' be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#' \code{"oceanic_ontogeny_sea_level"},
#' \code{"nonoceanic"}, \code{"nonoceanic_sea_level"}, or
#' \code{"nonoceanic_land_bridge"}
#'
#' @export
submit_robustness_cluster <- function(param_space) {

  # Selecting parameter space -----------------------------------------------
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/data/"
  file <- paste0(file_domain, param_space, ".txt")
  param_space <- readr::read_delim(
    file = file, delim = "  "
  )

  for (param_set in seq_len(nrow(param_space))) {
    jap::run_on_cluster(
      github_name = "Neves-P",
      package_name = "DAISIErobustness",
      function_name = "run_robustness",
      account = "p282067",
      fun_arguments = paste0("param_space = ",
                             param_space,
                             ", param_set = ",
                             param_set)
    )

  }
}
