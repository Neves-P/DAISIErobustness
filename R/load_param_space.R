#' Loads the parameter space into the environment for simulations
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return Data frame with the parameter space.
#' @export
load_param_space <- function(param_space_name) {
  testit::assert(is_param_space_name(param_space_name))
  new_env <- new.env()
  data(param_space_name, envir = new_env)
  return(new_env[[param_space_name]])
}
