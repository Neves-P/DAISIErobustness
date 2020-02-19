#' Submits robustness pipeline jobs to the Peregrine cluster
#'
#' @param param_space A string with the parameter space to run. Can
#' be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#' \code{"oceanic_ontogeny_sea_level"},
#' \code{"nonoceanic"}, \code{"nonoceanic_sea_level"}, or
#' \code{"nonoceanic_land_bridge"}
#' @param account A string with the p-number of the user to submit the jobs.
#'   Requires access to the Peregrine HPCC at the University of Groningen.
#'
#' @export
submit_robustness_cluster <- function(param_space_name,
                                      account,
                                      upload_scripts) {
  remotes::install_github("Giappo/jap@pedro", force = TRUE)
  jap::upload_jap_scripts(account = account, session = NA)

  # Selecting parameter space -----------------------------------------------
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/data/"
  file <- paste0(file_domain, param_space_name, ".csv")
  param_space <- readr::read_csv(
    file = file
  )

  for (param_set in seq_len(nrow(param_space))) {
    jap::run_on_cluster(
      github_name = "Neves-P",
      package_name = "DAISIErobustness",
      function_name = "run_robustness",
      account = account,
      upload_scripts = FALSE,
      fun_arguments = paste0(
        "param_space_name = '",
        param_space_name,
        "', param_set = ",
        param_set
      )
    )
  }
}
