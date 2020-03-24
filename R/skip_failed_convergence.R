#' Create string stating skipped step
#'
#' @return A string, with name of failed step due to failed MLE.
#' @author Pedro Neves, Joshua Lambert
#'
#' @examples
#' out_string <- testit::assert(
#'   is.character(skip_failed_convergence()
#' )
skip_failed_convergence <- function() {
  ignored_step_name <- deparse(sys.calls()[[sys.nframe()-1]])
  ignored_step_message <- paste0(
    ignored_step_name, " failed because upstream MLE failed to converge"
  )
  return(ignored_step_message)
}
