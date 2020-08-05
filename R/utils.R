#' Get param set IDs stored in results folder
#'
#' @inheritParams default_params_doc
#'
#' @return A vector with param_set IDs
#' @author Joshua Lambert, Pedro Neves
get_available_results <- function(param_space_name) {
  testit::assert(is.character(param_space_name))
  if (interactive() && .Platform$OS.type == "windows") {
    path <- utils::choose.dir(getwd(), "Choose a suitable folder")
  }
  all_file_names <- list.files(path = path)
  param_sets <- sub(".*_ *(.*?) *.RData.*", "\\1", all_file_names)
  out <- sort(as.numeric(param_sets))
  return(out)
}
