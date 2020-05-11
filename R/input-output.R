#' Save \code{run_robustness()} output
#'
#' @inheritParams default_params_doc
#'
#' @details Files are saved following the standardized file structure of the
#' TECE lab, as implemented in \code{\link[jap]{folder_structure}()}.
#' @return .RData file named by \code{\link{create_output_file_name}()} in
#' default location. See details for more information on filesystem. This
#'
#' @author Pedro Neves, Joshua Lambert
#' @family I/O
save_output <- function(output_file,
                        param_space_name,
                        param_set,
                        sim_constraints,
                        ml_constraints,
                        full_pipeline = TRUE) {

  if (full_pipeline) {
    output_file_name <- create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set,
      sim_constraints = sim_constraints,
      ml_constraints = ml_constraints
    )
  } else if (!full_pipeline) {
    output_file_name <- create_output_file_name_geodynamic_section(
      param_space_name = param_space_name,
      param_set = param_set,
      sim_constraints = sim_constraints
    )
  }

  if (Sys.getenv("HOSTNAME") != "peregrine.hpc.rug.nl") {
    results_folder <- file.path("results", param_space_name)
    output_file_path <- file.path(results_folder, output_file_name)
  } else {
    output_file_path <- getwd()
  }

  message(
    paste0("Trying to save ", output_file_name, " to ", output_file_path, "\n")
  )
  save(output_file, file = output_file_path)

  if (file.exists(output_file_path)) {
    message(paste0("Saved ", output_file_name, " to ", output_file_path, "\n"))
  } else {
    warning(paste0(
      "File not found. Saving to ",
      output_file_path,
      " likely failed.\n")
    )
  }
}

#' Generated name for saving output of \code{run_robustness()}
#'
#' @inheritParams default_params_doc
#'
#' @return Character with name indicating the name of the parameter space,
#'   the numeric id of the param_set and whether the run passed constraints.
#'
#' @author Pedro Neves, Joshua Lambert
#' @family I/O
#' @keywords Internal
#' @examples
#' testit::assert(
#'   DAISIErobustness:::create_output_file_name(
#'     param_space_name = "oceanic_ontogeny",
#'     param_set = 1,
#'     sim_constraints = TRUE,
#'     ml_constraints = TRUE
#'   ) == "passed_cond_oceanic_ontogeny_param_set_1.Rdata"
#' )
create_output_file_name <- function(param_space_name,
                                    param_set,
                                    sim_constraints,
                                    ml_constraints) {
  if (all(sim_constraints, ml_constraints) == FALSE) {

    output_file_name <- paste0(
      "failed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata"
    )

  } else if (sim_constraints == TRUE && ml_constraints == TRUE) {

    output_file_name <- paste0(
      "passed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata"
    )

  }
  testit::assert(is.character(output_file_name))
  return(output_file_name)
}


#' Generated name for saving output of \code{run_geodynamic_section()}
#'
#' @inheritParams default_params_doc
#'
#' @return Character with name indicating the name of the parameter space,
#'   the numeric id of the param_set and whether the run passed constraints.
#'
#' @author Pedro Neves, Joshua Lambert
#' @family I/O
#' @keywords Internal
#' @examples
#' testit::assert(
#'   DAISIErobustness:::create_output_file_name_geodynamic_section(
#'     param_space_name = "oceanic_ontogeny",
#'     param_set = 1,
#'     sim_constraints = TRUE
#'   ) == "geosym_passed_cond_oceanic_ontogeny_param_set_1.Rdata"
#' )
create_output_file_name_geodynamic_section <- function(param_space_name,
                                                       param_set,
                                                       sim_constraints) {
  if (sim_constraints == FALSE) {

    output_file_name <- paste0(
      "geosym_failed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata"
    )

  } else if (sim_constraints == TRUE) {

    output_file_name <- paste0(
      "geosym_passed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata"
    )

  }
  testit::assert(is.character(output_file_name))
  return(output_file_name)
}

#' Checks and create results folder for output
#'
#' @inheritParams default_params_doc
#'
#' @author Pedro Neves, Joshua Lambert
#' @return Helpful messages with info on folder status. Tries to create
#'   folder if needed.
#' @keywords Internal
#' @family I/O
check_create_results_folder <- function(param_space_name, save_output) {

  if (!save_output) {
    message("Returning results to object, no I/O used.\n")
    return()
  }
  results_folder <- file.path("results", param_space_name)
  if (!dir.exists(results_folder)) {
    message(paste0(
      results_folder,
      " folder not found, attempting to create it.\n")
    )
    dir.create(results_folder, recursive = TRUE)
    message("\nCreated folder successfully.")
  } else if (!dir.exists(results_folder)) {
    stop(paste0(
      "Tried creating: ",
      results_folder,
      "Folder still not found, aborting"
    ))
  } else {
    message(results_folder, " folder found. No creation needed.\n")
  }
}

#' Load intermedia geodynamic sim results to continue pipeline
#'
#' @inheritParams default_params_doc
#'
#' @return List with output from \code{\link{geodynamic_sim}()} and
#'  \code{\link{sim_constraints}()}.
#' @author Pedro Neves, Joshua Lambert
#' @export
load_geodynamic_section <- function(param_space_name,
                                    param_set) {
  results_folder <- file.path("results", param_space_name)
  if (!dir.exists(results_folder)) {
    stop(paste0(
      results_folder,
      " folder not found.\n")
    )
  }
  found_files <- list.files(path = results_folder)
  message(paste0("Found ", length(found_files), " files.\n"))
  file_code_to_load <- paste(
    param_space_name,
    "param_set",
    param_set,
    sep = "_"
  )
  name_file_to_load <- found_files[grepl(pattern = file_code_to_load,
                                         x = found_files)]
  message(paste0("Trying to load ", name_file_to_load, ".\n"))
  if (!file.exists(file.path(results_folder, name_file_to_load))) {
    stop(paste0("File ", name_file_to_load,  " not found.\n"))
  }
  output_file <- NULL # Suppress global variable note
  geodynamic_section_output <- NULL # Suppress global variable note
  load(file.path(results_folder, name_file_to_load))
  if (exists(x = "geodynamic_section_output")) {
    testit::assert(c("geodynamic_sim", "sim_constraints") %in%
                     names(geodynamic_section_output))
    message(paste0("Successfully loaded ", name_file_to_load, ".\n"))
  }
  out <- list(
    geodynamic_sim = output_file$geodynamic_sim,
    sim_constraints = output_file$sim_constraints)
  return(out)
}
