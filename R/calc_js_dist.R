#' Calculates Jensen-Shannon distance between two distributions
#'
#' @inheritParams default_params_doc
#'
#' @return a list of numerics
#' @author Pedro Neves, Joshua Lambert
#' @references Lamberti, P. W., et al. "Metric character of the quantum
#'   Jensen-Shannon divergence." Physical Review A 77.5 (2008): 052311.
#' @family error calculations
#' @export
calc_js_dist <- function(spec_error,
                         endemic_error,
                         nonendemic_error,
                         spec_baseline_error,
                         endemic_baseline_error,
                         nonendemic_baseline_error) {

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

  js_dist <- list(js_dist_spec_nltt = js_dist_spec_nltt,
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
  js_div <- 0.5 * calc_kl_div(p, (p + q) * 0.5) +
            0.5 * calc_kl_div(q, (p + q) * 0.5)
  return(js_div)
}

#' Calculates Kullback-Leibler divergence between two vectors
#'
#' @inheritParams default_params_doc
#'
#' @return numeric
#' @references Kullback, Solomon, and Richard A. Leibler. "On information and
#'   sufficiency." The annals of mathematical statistics 22.1 (1951): 79-86.
#' @author Pedro Neves, Joshua Lambert
calc_kl_div <- function(p, q) {
  kl_div <- sum(p * log2(p / q))
  return(kl_div)
}
