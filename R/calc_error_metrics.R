#' Calculates metrics between error and baseline error distributions
#'
#' @inheritParams default_params_doc
#' @return a list of numerics
#' @author Joshua W. Lambert, Pedro Santos Neves, Shu Xie
#' @importFrom stats sd
calc_error_metrics <- function(spec_nltt_error,
                               num_spec_error,
                               num_col_error,
                               endemic_nltt_error,
                               nonendemic_nltt_error,
                               spec_baseline_nltt_error,
                               num_spec_baseline_error,
                               num_col_baseline_error,
                               endemic_baseline_nltt_error,
                               nonendemic_baseline_nltt_error) {

  check_calc_error_metrics_input(
    spec_nltt_error = spec_nltt_error,
    num_spec_error = num_spec_error,
    num_col_error = num_col_error,
    endemic_nltt_error = endemic_nltt_error,
    nonendemic_nltt_error = nonendemic_nltt_error,
    spec_baseline_nltt_error = spec_baseline_nltt_error,
    num_spec_baseline_error = num_spec_baseline_error,
    num_col_baseline_error = num_col_baseline_error,
    endemic_baseline_nltt_error = endemic_baseline_nltt_error,
    nonendemic_baseline_nltt_error)

  num_spec_mean_diff <- abs(mean(num_spec_error) -
                              mean(num_spec_baseline_error))
  num_spec_sd_diff <- abs(sd(num_spec_error) - sd(num_spec_baseline_error))
  num_col_mean_diff <- abs(mean(num_col_error) - mean(num_col_baseline_error))
  num_col_sd_diff <- abs(sd(num_col_error) - sd(num_col_baseline_error))
  spec_nltt_mean_diff <- abs(mean(spec_nltt_error) -
                               mean(spec_baseline_nltt_error))
  spec_nltt_sd_diff <- abs(sd(spec_nltt_error) - sd(spec_baseline_nltt_error))
  endemic_nltt_mean_diff <- abs(mean(endemic_nltt_error) -
                                  mean(endemic_baseline_nltt_error))
  endemic_nltt_sd_diff <- abs(sd(endemic_nltt_error) -
                                sd(endemic_baseline_nltt_error))
  nonendemic_nltt_mean_diff <- abs(mean(nonendemic_nltt_error) -
                                   mean(nonendemic_baseline_nltt_error))
  nonendemic_nltt_sd_diff <- abs(sd(nonendemic_nltt_error) -
                                 sd(nonendemic_baseline_nltt_error))

  error_metrics <- list(
    num_spec_mean_diff = num_spec_mean_diff,
    num_spec_sd_diff = num_spec_sd_diff,
    num_col_mean_diff = num_col_mean_diff,
    num_col_sd_diff = num_col_sd_diff,
    spec_nltt_mean_diff = spec_nltt_mean_diff,
    endemic_nltt_mean_diff = endemic_nltt_mean_diff,
    nonendemic_nltt_mean_diff = nonendemic_nltt_mean_diff,
    spec_nltt_sd_diff = spec_nltt_sd_diff,
    endemic_nltt_sd_diff = endemic_nltt_sd_diff,
    nonendemic_nltt_sd_diff = nonendemic_nltt_sd_diff)

  return(error_metrics)
}

#' Checks calc_error_metrics_input is correct
#'
#' @inheritParams default_params_doc
#'
#' @return Nothing. Throws error if input is not correct
#' @author Joshua W. Lambert, Pedro Santos Neves, Shu Xie
#' @importFrom stats na.omit
check_calc_error_metrics_input <- function(spec_nltt_error,
                                           num_spec_error,
                                           num_col_error,
                                           endemic_nltt_error,
                                           nonendemic_nltt_error,
                                           spec_baseline_nltt_error,
                                           num_spec_baseline_error,
                                           num_col_baseline_error,
                                           endemic_baseline_nltt_error,
                                           nonendemic_baseline_nltt_error) {
  testit::assert(all(num_spec_error >= 0))
  testit::assert(all(num_spec_baseline_error >= 0))
  testit::assert(all(num_col_baseline_error >= 0))
  testit::assert(all(num_col_error >= 0))
  testit::assert(all(spec_nltt_error >= 0))
  testit::assert(all(spec_baseline_nltt_error >= 0))
  testit::assert(all(endemic_nltt_error >= 0))
  testit::assert(all(endemic_baseline_nltt_error >= 0))
  testit::assert(all(nonendemic_nltt_error >= 0))
  testit::assert(all(nonendemic_baseline_nltt_error >= 0))
}
