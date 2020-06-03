#' Calculates metrics between error and baseline error distributions
#'
#' @inheritParams default_params_doc
#'
#' @return a list of numerics
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @references
#' Kolmogorov, A. (1933) Sulla determinazione empirica di una
#' legge di distribuzionc, 1st. Ital. Attuari. G.. 4, 1–11.
#'
#' Razali and Wah (2011) "Power comparisons of shapiro-wilk,
#' kolmogorov-smirnov, lilliefors and anderson-darling tests"
#' Journal of Statistical Modeling and Analytics 2, 21-33.
#' @importFrom stats sd
calc_error_metrics <- function(spec_error,
                               endemic_error,
                               nonendemic_error,
                               spec_baseline_error,
                               endemic_baseline_error,
                               nonendemic_baseline_error) {
  for (n_reps in seq_along(spec_baseline_error)) {
    if (is.character(spec_baseline_error[[n_reps]])) {
      spec_error$num_spec_error[[n_reps]] <- NA
      spec_error$num_col_error[[n_reps]] <- NA
      spec_baseline_error$num_spec_error[[n_reps]] <- NA
      spec_baseline_error$num_col_error[[n_reps]] <- NA
      spec_error$nltt[[n_reps]] <- NA
      spec_baseline_error$nltt[[n_reps]] <- NA
      endemic_error$nltt[[n_reps]] <- NA
      endemic_baseline_error$nltt[[n_reps]] <- NA
      nonendemic_error$nltt[[n_reps]] <- NA
      nonendemic_baseline_error$nltt[[n_reps]] <- NA
    }
  }

  num_spec <- spec_error$num_spec_error
  spec_baseline_num <- spec_baseline_error$num_spec_error
  num_baseline_col <- spec_baseline_error$num_col_error
  num_col <- spec_error$num_col_error

  spec_nltt <- spec_error$nltt
  spec_baseline_nltt <- spec_baseline_error$nltt
  endemic_nltt <- endemic_error$nltt
  endemic_baseline_nltt <- endemic_baseline_error$nltt
  nonendemic_nltt <- nonendemic_error$nltt
  nonendemic_baseline_nltt <- nonendemic_baseline_error$nltt

  check_calc_error_metrics_input(
    spec_error = spec_error,
    endemic_error = endemic_error,
    nonendemic_error = nonendemic_error,
    spec_baseline_error = spec_baseline_error,
    endemic_baseline_error = endemic_baseline_error,
    nonendemic_baseline_error = nonendemic_baseline_error
  )

  num_spec_mean_diff <-
    abs(mean(num_spec, na.rm = TRUE) - mean(spec_baseline_num, na.rm = TRUE))
  num_spec_sd_diff <-
    abs(sd(num_spec, na.rm = TRUE) - sd(spec_baseline_num, na.rm = TRUE))

  num_col_mean_diff <-
    abs(mean(num_col, na.rm = TRUE) - mean(num_baseline_col, na.rm = TRUE))
  num_col_sd_diff <-
    abs(sd(num_col, na.rm = TRUE) - sd(num_baseline_col, na.rm = TRUE))

  spec_nltt_mean_diff <- abs(mean(spec_nltt, na.rm = TRUE) -
                             mean(spec_baseline_nltt, na.rm = TRUE))
  endemic_nltt_mean_diff <- abs(mean(endemic_nltt, na.rm = TRUE) -
                                mean(endemic_baseline_nltt, na.rm = TRUE))
  nonendemic_nltt_mean_diff <- abs(mean(nonendemic_nltt, na.rm = TRUE) -
                                   mean(nonendemic_baseline_nltt, na.rm = TRUE))

  spec_nltt_sd_diff <- abs(sd(spec_nltt, na.rm = TRUE) -
                           sd(spec_baseline_nltt, na.rm = TRUE))
  endemic_nltt_sd_diff <- abs(sd(endemic_nltt, na.rm = TRUE) -
                              sd(endemic_baseline_nltt, na.rm = TRUE))
  nonendemic_nltt_sd_diff <- abs(sd(nonendemic_nltt, na.rm = TRUE) -
                                 sd(nonendemic_baseline_nltt, na.rm = TRUE))


  spec_nltt_ks_dist <- calc_ks_distance(
    vec_1 = spec_nltt,
    vec_2 = spec_baseline_nltt
  )

  endemic_nltt_ks_dist <- calc_ks_distance(
    vec_1 = endemic_nltt,
    vec_2 = endemic_baseline_nltt
  )

  nonendemic_nltt_ks_dist <- calc_ks_distance(
    vec_1 = nonendemic_nltt,
    vec_2 = nonendemic_baseline_nltt
  )

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

#' Checks calc_error_metrics_input is correct
#'
#' @inheritParams default_params_doc
#'
#' @return Nothing. Throws error if input is not correct
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @importFrom stats na.omit
check_calc_error_metrics_input <- function(spec_error,
                                           endemic_error,
                                           nonendemic_error,
                                           spec_baseline_error,
                                           endemic_baseline_error,
                                           nonendemic_baseline_error) {
  num_spec <- na.omit(spec_error$num_spec_error)
  testit::assert(all(num_spec >= 0))
  spec_baseline_num <- na.omit(spec_baseline_error$num_spec_error)
  testit::assert(all(spec_baseline_num >= 0))
  num_baseline_col <- na.omit(spec_baseline_error$num_col_error)
  testit::assert(all(num_baseline_col >= 0))
  num_col <- na.omit(spec_error$num_col_error)
  testit::assert(all(num_col >= 0))
  spec_nltt <- na.omit(spec_error$nltt)
  testit::assert(all(spec_nltt >= 0))

  spec_baseline_nltt <- na.omit(spec_baseline_error$nltt)
  testit::assert(all(spec_baseline_nltt >= 0))
  endemic_nltt <- na.omit(endemic_error$nltt)
  testit::assert(all(endemic_nltt >= 0))
  endemic_baseline_nltt <- na.omit(endemic_baseline_error$nltt)
  testit::assert(all(endemic_baseline_nltt >= 0))
  nonendemic_nltt <- na.omit(nonendemic_error$nltt)
  testit::assert(all(nonendemic_nltt >= 0))
  nonendemic_baseline_nltt <- na.omit(nonendemic_baseline_error$nltt)
  testit::assert(all(nonendemic_baseline_nltt >= 0))
}

#' Calculate the Kolmogorov-Smirnov distance between two distributions
#'
#' @inheritParams default_params_doc
#'
#' @return A numeric, with the Kolmogorov-Smirnov distance of the two
#'  distributions.
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @references
#' Kolmogorov, A. (1933) Sulla determinazione empirica di una
#' legge di distribuzionc, 1st. Ital. Attuari. G.. 4, 1–11.
#'
#' Razali and Wah (2011) "Power comparisons of shapiro-wilk,
#' kolmogorov-smirnov, lilliefors and anderson-darling tests"
#' Journal of Statistical Modeling and Analytics 2, 21-33.
calc_ks_distance <- function(vec_1, vec_2) {
  testit::assert(length(vec_1) == length(vec_2))
  testit::assert(is.numeric(vec_1) && is.numeric(vec_2))
  testit::assert(is.finite(vec_1) && is.finite(vec_2))

  vec_1 <- vec_1[!is.na(vec_1)]
  vec_2 <- vec_2[!is.na(vec_2)]
  vec_1 <- vec_1 / sum(vec_1)
  vec_2 <- vec_2 / sum(vec_2)
  cumul_vec_1 <- cumsum(vec_1)
  cumul_vec_2 <- cumsum(vec_2)
  vec_diff <- abs(cumul_vec_1 - cumul_vec_2)
  ks_dist <- max(vec_diff)
  testit::assert(ks_dist >= 0)
  return(ks_dist)
}
