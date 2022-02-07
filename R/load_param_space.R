#' Loads the parameter space into the environment for simulations
#'
#' @inheritParams default_params_doc
#' @author Joshua W. Lambert, Pedro Santos Neves, Shu Xie
#' @return Data frame with the parameter space.
#' @export
load_param_space <- function(param_space_name) {
  testit::assert(is_param_space_name(param_space_name))

 loaded_name <- load(system.file(
    "extdata", paste0(param_space_name, ".rda"), package = "DAISIErobustness")
  )
  assign("param_space", get(loaded_name))
  return(param_space)
}
