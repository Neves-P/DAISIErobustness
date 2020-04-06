#' Get param set IDs stored in results folder
#'
#' @inheritParams default_params_doc
#'
#' @return A vector with param_set IDs
#' @author Joshua Lambert, Pedro Neves
get_available_results <- function(param_space_name) {
  testit::assert(is.character(param_space_name))
  path <- file.path("results", param_space_name)
  all_file_names <- list.files(path = path)
  param_sets <- sub(".*_ *(.*?) *.Rdata.*", "\\1", all_file_names)
  out <- sort(as.numeric(param_sets))
  return(out)
}
