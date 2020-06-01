#' Run robustness analysis pipeline
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return A list of errors and simulation and MLE output if
#' \code{\link{sim_constraints}()} and \code{\link{ml_constraints}()} returned
#' TRUE or simulation output if \code{\link{sim_constraints}()} returned FALSE.
#' @export
run_robustness <- function(param_space_name,
                           param_set,
                           replicates,
                           pipeline = "full",
                           novel_sim = NULL,
                           save_output = TRUE,
                           replicate_range = NULL,
                           load_from_file = FALSE) {

  param_space <- load_param_space(
    param_space_name = param_space_name)

  testit::assert(param_space_name %in% c("oceanic_ontogeny",
                                         "oceanic_sea_level",
                                         "oceanic_ontogeny_sea_level",
                                         "nonoceanic",
                                         "nonoceanic_sea_level",
                                         "nonoceanic_land_bridge",
                                         "trait"))
  testit::assert(param_set >= 1)
  testit::assert(param_set <= nrow(param_space))
  testit::assert(replicates > 1)

  message(paste0("The current working directory is ", getwd(), "."))
  message(paste0("hostname: ", Sys.getenv("HOSTNAME")))
  check_create_results_folder(
    param_space_name = param_space_name,
    save_output = save_output
  )

  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )

  sim_pars <- extract_param_set(
    param_space_name = param_space_name,
    param_space = param_space,
    param_set = param_set)

  if (pipeline == "novel_sim") {
    output <- run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )
  } else if (pipeline == "analysis") {

    if (load_from_file) {
      novel_sim <- load_novel_section(
        param_space_name = param_space_name,
        param_set = param_set
      )
    }
    testit::assert("For runnning just the analysis
                   novel_sim must be supplied.", exists("novel_sim"))
    output <- run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars,
      replicate_range
    )
  } else if (pipeline == "full") {
    novel_sim <- run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )
    output <- run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars,
      replicate_range = NULL
    )
    output$novel_sim <- novel_sim
  }

  if (save_output == TRUE) {
    save_output(
      output = output,
      param_space_name = param_space_name,
      param_set = param_set,
      pipeline = pipeline
    )
  } else {
    return(output)
  }
}
