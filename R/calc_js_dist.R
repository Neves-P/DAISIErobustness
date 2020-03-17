#' Calculates Jensen-Shannon distance between two distributions
#'
#' @inheritParams default_params_doc
#'
#' @return a list of numerics
#' @author Pedro Neves, Joshua Lambert
#' @export
calc_js_dist <- function(spec_error,
                         endemic_error,
                         nonendemic_error,
                         spec_baseline_error,
                         endemic_baseline_error,
                         nonendemic_baseline_error) {

  num_spec_error <- spec_error$num_spec_error
  num_spec_baseline_error <- spec_baseline_error$num_spec_error
  js_dist_num_spec <- sqrt(calc_js_div(num_spec_error, num_spec_baseline_error))
  testit::assert(js_dist_num_spec >= 0)
  testit::assert(js_dist_num_spec <= 1)

  num_col_error <- spec_error$num_col_error
  num_col_baseline_error <- spec_baseline_error$num_col_error
  js_dist_num_col <- sqrt(calc_js_div(num_col_error, num_col_baseline_error))
  testit::assert(js_dist_num_col >= 0)
  testit::assert(js_dist_num_col <= 1)

  spec_nltt <- spec_error$nltt
  spec_baseline_nltt <- spec_baseline_error$nltt
  js_dist_spec_nltt <- sqrt(calc_js_div(spec_nltt, spec_baseline_nltt))
  testit::assert(js_dist_spec_nltt >= 0)
  testit::assert(js_dist_spec_nltt <= 1)

  endemic_nltt <- endemic_error$nltt
  endemic_baseline_nltt <- endemic_baseline_error$nltt
  js_dist_endemic_nltt <- sqrt(calc_js_div(endemic_nltt, endemic_baseline_nltt))
  testit::assert(js_dist_endemic_nltt >= 0)
  testit::assert(js_dist_endemic_nltt <= 1)

  nonendemic_nltt <- nonendemic_error$nltt
  nonendemic_baseline_nltt <- nonendemic_baseline_error$nltt
  js_dist_nonendemic_nltt <- sqrt(calc_js_div(nonendemic_nltt,
                                         nonendemic_baseline_nltt))
  testit::assert(js_dist_nonendemic_nltt >= 0)
  testit::assert(js_dist_nonendemic_nltt <= 1)

  js_dist <- list(js_dist_num_spec = js_dist_num_spec,
                  js_dist_num_col = js_dist_num_col,
                  js_dist_spec_nltt = js_dist_spec_nltt,
                  js_dist_endemic_nltt = js_dist_endemic_nltt,
                  js_dist_nonendemic_nltt = js_dist_nonendemic_nltt)

  return(js_dist)
}

#' Calculates the Jensen-Shannon divergence between two vectors
#'
#' @inheritParams default_params_doc
#'
#' @return numeric
#' @author Pedro Neves, Joshua Lambert
calc_js_div <- function(p, q) {
  js_div <- 0.5 * (calc_kl_div(p, (p + q) / 2) + calc_kl_div(q, (p + q) / 2))
  return(js_div)
}

#' Calculates Kullback-Leibler divergence between two vectors
#'
#' @inheritParams default_params_doc
#'
#' @return numeric
#' @author Pedro Neves, Joshua Lambert
calc_kl_div <- function(p, q) {
  kl_div <- sum(p * log2(p / q))
  return(kl_div)
}
