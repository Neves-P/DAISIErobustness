#' Submits check_param_space jobs to the Peregrine cluster
#'
#' @param param_space_name A string with the parameter space to run.
#' Can be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#' \code{"oceanic_ontogeny_sea_level"},
#' \code{"nonoceanic_sea_level"}, or
#' @param account A string with the p-number of the user to submit the jobs.
#'   Requires access to the Peregrine HPCC at the University of Groningen.
#' @param upload_scripts Boolean to determine whether scripts should be
#' uploaded with every parameter space.
#'
#' @export
submit_cluster_check_param_space_time_dependent <- function(param_space_name,
                                                            account,
                                                            session = NA,
                                                            replicates = 100,
                                                            num_job = c(1, 100)) {

  testit::assert(param_space_name == "oceanic_ontogeny" ||
                   param_space_name == "oceanic_sea_level" ||
                   param_space_name == "oceanic_ontogeny_sea_level" ||
                   param_space_name == "nonoceanic_sea_level")

  remotes::install_github("Giappo/jap@pedro")
  jap::upload_jap_scripts(account = account, session = NA)

  new_session <- TRUE
  session <- jap::open_session(account = account)

  # Selecting parameter space -----------------------------------------------
  file_domain <-
    "https://raw.githubusercontent.com/Neves-P/DAISIErobustness/master/data/"
  file <- paste0(file_domain, param_space_name, ".csv")
  param_space <- readr::read_csv(
    file = file
  )
  for (param_set in num_job[1]:num_job[2]) {
    jap::run_on_cluster_loopable(
      github_name = "Neves-P",
      package_name = "DAISIErobustness",
      function_name = "check_param_space_time_dependent",
      account = account,
      session = session,
      fun_arguments = paste0(
        "param_space_name = '",
        param_space_name,
        "', param_set = ",
        param_set,
        ", replicates = ",
        replicates
      )
    )
    Sys.sleep(1)
  }
  jap::close_session(session = session)
}
