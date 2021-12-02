#' Loads the parameter space into the environment for simulations
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return Data frame with the parameter space.
#' @export
load_param_space <- function(param_space_name) {
  testit::assert(is_param_space_name(param_space_name))
  assign("param_space", get(param_space_name))
  return(param_space)
}
