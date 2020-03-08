#' Submits check_param_space jobs to the Peregrine cluster
#'
#' @param param_space_name A string with the parameter space to run.
#' Can be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#' \code{"oceanic_ontogeny_sea_level"},
#' \code{"nonoceanic_sea_level"}, or
#' @param account A string with the p-number of the user to submit the jobs.
#' @param session A session to pass, if already open.
#' @param replicates How many replicates to run per parameter set.
#' @param num_job Number of job to run. Corresponds to a row in the param_space
#'   tibble.
#' @param partition What Peregrine HPCC to use. "gelifes" and "regular" are
#'   available.
#' @param folder What Peregrine HPCC folder to use. Defaults to "data", but
#'   "home" is also allowed.
#'   Requires access to the Peregrine HPCC at the University of Groningen.
#' @export
submit_robustness <- function(param_space_name,
                              account,
                              session = NA,
                              replicates = 100,
                              num_job = c(1, 100),
                              partition = "gelifes",
                              folder = 'data') {
  testit::assert(is.character(folder))
  if(substr(folder, start = 1, stop = 1) != "/"){
    folder <- paste0('/', folder)
  }
  remotes::install_github("Giappo/jap@pedro")
  jap::upload_jap_scripts(account = account, session = NA, folder = folder)

  session <- jap::open_session(account = account)

  for (param_set in num_job[1]:num_job[2]) {
    jap::run_on_cluster_loopable(
      github_name = "Neves-P",
      package_name = "DAISIErobustness",
      function_name = "run_robustness",
      account = account,
      session = session,
      partition = partition,
      folder = folder,
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
