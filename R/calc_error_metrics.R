#' Calculates metrics between error and baseline error distributions
#'
#' @inheritParams default_params_doc
#'
#' @return a list of numerics
#' @author Pedro Neves, Joshua Lambert
#' @references Kolmogorov, A. (1933) Sulla determinazione empirica di una
#' legge di distribuzionc, 1st. Ital. Attuari. G.. 4, 1–11.
#' Razali and Wah (2011) "Power comparisons of shapiro-wilk,
#' kolmogorov-smirnov, lilliefors and anderson-darling tests"
#' Journal of Statistical Modeling and Analytics 2, 21-33.
#' @importFrom stats sd
#' @family error calculations
#' @export
calc_error_metrics <- function(spec_error,
                               endemic_error,
                               nonendemic_error,
                               spec_baseline_error,
                               endemic_baseline_error,
                               nonendemic_baseline_error) {
  if (any(
    is.character(spec_error),
    is.character(endemic_error),
    is.character(spec_baseline_error),
    is.character(endemic_baseline_error),
    is.character(nonendemic_baseline_error))) {
      num_spec_mean_dif  <- skip_failed_convergence()
      num_spec_sd_dif  <- skip_failed_convergence()
      num_col_mean_diff <- skip_failed_convergence()
      num_col_sd_diff <- skip_failed_convergence()
      spec_nltt_mean_diff <- skip_failed_convergence()
      endemic_nltt_mean_dif  <- skip_failed_convergence()
      nonendemic_nltt_mean_diff <- skip_failed_convergence()
      spec_nltt_sd_diff <- skip_failed_convergence()
      endemic_nltt_sd_dif  <- skip_failed_convergence()
      nonendemic_nltt_sd_diff <- skip_failed_convergence()
      spec_nltt_ks_dist <- skip_failed_convergence()
      endemic_nltt_ks_dis  <- skip_failed_convergence()
      nonendemic_nltt_ks_dist <- skip_failed_convergence()
      print("skipped")
  } else{
    print("didn't skip")
    num_spec <- spec_error$num_spec_error
    testit::assert(all(num_spec >= 0))
    spec_baseline_num <- spec_baseline_error$num_spec_error
    testit::assert(all(spec_baseline_num >= 0))
    num_col <- spec_error$num_col_error
    testit::assert(all(num_col >= 0))
    num_baseline_col <- spec_baseline_error$num_col_error
    testit::assert(all(num_baseline_col >= 0))

    num_spec_mean_diff <- abs(mean(num_spec) - mean(spec_baseline_num))
    num_spec_sd_diff <- abs(sd(num_spec) - sd(spec_baseline_num))

    num_col_mean_diff <- abs(mean(num_col) - mean(num_baseline_col))
    num_col_sd_diff <- abs(sd(num_col) - sd(num_baseline_col))

    spec_nltt <- spec_error$nltt
    testit::assert(all(spec_nltt >= 0))
    spec_baseline_nltt <- spec_baseline_error$nltt
    testit::assert(all(spec_baseline_nltt >= 0))
    endemic_nltt <- endemic_error$nltt
    testit::assert(all(endemic_nltt >= 0))
    endemic_baseline_nltt <- endemic_baseline_error$nltt
    testit::assert(all(endemic_baseline_nltt >= 0))
    nonendemic_nltt <- nonendemic_error$nltt
    testit::assert(all(nonendemic_nltt >= 0))
    nonendemic_baseline_nltt <- nonendemic_baseline_error$nltt
    testit::assert(all(nonendemic_baseline_nltt >= 0))

    spec_nltt_mean_diff <- abs(mean(spec_nltt) - mean(spec_baseline_nltt))
    endemic_nltt_mean_diff <- abs(mean(endemic_nltt) - mean(endemic_baseline_nltt))
    nonendemic_nltt_mean_diff <- abs(mean(nonendemic_nltt) - mean(nonendemic_baseline_nltt))

    spec_nltt_sd_diff <- abs(sd(spec_nltt) - sd(spec_baseline_nltt))
    endemic_nltt_sd_diff <- abs(sd(endemic_nltt) - sd(endemic_baseline_nltt))
    nonendemic_nltt_sd_diff <- abs(sd(nonendemic_nltt) - sd(nonendemic_baseline_nltt))

    spec_nltt <- spec_nltt / sum(spec_nltt)
    spec_baseline_nltt <- spec_baseline_nltt / sum(spec_baseline_nltt)
    cumul_spec_nltt <- cumsum(spec_nltt)
    cumul_spec_baseline_nltt <- cumsum(spec_baseline_nltt)
    spec_diff <- abs(cumul_spec_nltt - cumul_spec_baseline_nltt)
    spec_nltt_ks_dist <- max(spec_diff)
    testit::assert(spec_nltt_ks_dist >= 0)

    norm_endemic_nltt <- endemic_nltt / sum(endemic_nltt)
    norm_endemic_baseline_nltt <- endemic_baseline_nltt / sum(endemic_baseline_nltt)
    cumul_endemic_nltt <- cumsum(norm_endemic_nltt)
    cumul_endemic_baseline_nltt <- cumsum(norm_endemic_baseline_nltt)
    endemic_diff <- abs(cumul_endemic_nltt - cumul_endemic_baseline_nltt)
    endemic_nltt_ks_dist <- max(endemic_diff)
    testit::assert(endemic_nltt_ks_dist >= 0)

    norm_nonendemic_nltt <- nonendemic_nltt / sum(nonendemic_nltt)
    norm_nonendemic_baseline_nltt <- nonendemic_baseline_nltt / sum(nonendemic_baseline_nltt)
    cumul_nonendemic_nltt <- cumsum(norm_nonendemic_nltt)
    cumul_nonendemic_baseline_nltt <- cumsum(norm_nonendemic_baseline_nltt)
    nonendemic_diff <- abs(cumul_nonendemic_nltt - cumul_nonendemic_baseline_nltt)
    nonendemic_nltt_ks_dist <- max(nonendemic_diff)
    testit::assert(nonendemic_nltt_ks_dist >= 0)
  }
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
    nonendemic_nltt_sd_diff = nonendemic_nltt_sd_diff,
    spec_nltt_ks_dist = spec_nltt_ks_dist,
    endemic_nltt_ks_dist = endemic_nltt_ks_dist,
    nonendemic_nltt_ks_dist = nonendemic_nltt_ks_dist)

  return(error_metrics)
}