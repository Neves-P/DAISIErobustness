#' Save \code{run_robustness()} output
#'
#' @inheritParams default_params_doc
#'
#' @details Files are saved to a subdirectory named after
#'   \code{param_space_name} within the current directory. The \code{/results/}
#'   directory and subfolders are created if they don't exist. The status of
#'   saving is printed as a message if successful, a warning if unsuccessful.
#' @return .rds file named by \code{\link{create_output_file_name}()} in
#' default location. See details for more information on filesystem. This
#'
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @family I/O
save_output <- function(output,
                        param_space_name,
                        param_set) {

  output_file_name <- create_output_file_name(
    param_space_name = param_space_name,
    param_set = param_set
  )

  output_folder <- file.path(
    getwd(),
    "results",
    param_space_name
  )
  output_file_path <- file.path(output_folder, output_file_name)

  testit::assert(is.character(output_file_name))
  message(
    paste0("Trying to save ", output_file_name, " to ", output_file_path, "\n")
  )
  saveRDS(output, file = output_file_path)

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
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @family I/O
#' @keywords internal
#' @examples
#' testit::assert(
#'   DAISIErobustness:::create_output_file_name(
#'     param_space_name = "oceanic_ontogeny_cs",
#'     param_set = 1
#'   ) == "oceanic_ontogeny_cs_param_set_1.rds"
#' )
create_output_file_name <- function(param_space_name,
                                    param_set) {

  testit::assert(is.numeric(param_set) && is.finite(param_set))
  testit::assert(is_param_space_name(param_space_name))

    output_file_name <- paste0(
      param_space_name,
      "_param_set_",
      param_set,
      ".rds"
    )

  testit::assert(is.character(output_file_name))
  return(output_file_name)
}

#' Checks and create results folder for output
#'
#' @inheritParams default_params_doc
#'
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return Helpful messages with info on folder status. Tries to create
#'   folder if needed.
#' @keywords internal
#' @family I/O
check_create_folders <- function(param_space_name,
                                 save_output) {

  if (!save_output) {
    message("Returning results to object, no I/O used.\n")
    return()
  }

  output_folder <- file.path(
    getwd(),
    "results",
    param_space_name
  )

  if (!dir.exists(output_folder)) {
    message(paste0(
      output_folder,
      " folder not found, attempting to create it.\n")
    )
    dir.create(output_folder, recursive = TRUE)
    message("Created folder successfully.")
  } else if (!dir.exists(output_folder)) {
    stop(paste0(
      "Tried creating: ",
      output_folder,
      "Folder still not found, aborting"
    ))
  } else {
    message(output_folder, " folder found. No creation needed.\n")
  }
}
