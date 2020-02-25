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
submit_robustness <- function(param_space_name,
                              account,
                              session = NA,
                              replicates = 100,
                              num_job = c(1, 100),
                              partition = "gelifes") {

  remotes::install_github("Giappo/jap@pedro")
  jap::upload_jap_scripts(account = account, session = NA)

  session <- jap::open_session(account = account)

  for (param_set in num_job[1]:num_job[2]) {
    jap::run_on_cluster_loopable(
      github_name = "Neves-P",
      package_name = "DAISIErobustness",
      function_name = "run_robustness",
      account = account,
      session = session,
      partition = partition,
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
