context("calc_error_metrics")

test_that("test calc_error_metrics output is correct when all error
          distributions are equal", {
  spec_error <- list(nltt = c(1, 1, 1, 1, 1),
                     num_spec_error = c(1, 1, 1, 1, 1),
                     num_col_error = c(1, 1, 1, 1, 1))
  endemic_error <- list(nltt = c(1, 1, 1, 1, 1))
  nonendemic_error <- list(nltt = c(1, 1, 1, 1, 1))
  spec_baseline_error <- list(nltt = c(1, 1, 1, 1, 1),
                              num_spec_error = c(1, 1, 1, 1, 1),
                              num_col_error = c(1, 1, 1, 1, 1))
  endemic_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  nonendemic_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  error_metrics <- calc_error_metrics(
    spec_error = spec_error,
    endemic_error = endemic_error,
    nonendemic_error = nonendemic_error,
    spec_baseline_error = spec_baseline_error,
    endemic_baseline_error = endemic_baseline_error,
    nonendemic_baseline_error = nonendemic_baseline_error)

  expect_equal(error_metrics$num_spec_mean_diff, 0)
  expect_equal(error_metrics$num_spec_sd_diff, 0)
  expect_equal(error_metrics$num_col_mean_diff, 0)
  expect_equal(error_metrics$num_col_sd_diff, 0)
  expect_equal(error_metrics$spec_nltt_mean_diff, 0)
  expect_equal(error_metrics$endemic_nltt_mean_diff, 0)
  expect_equal(error_metrics$nonendemic_nltt_mean_diff, 0)
  expect_equal(error_metrics$spec_nltt_sd_diff, 0)
  expect_equal(error_metrics$endemic_nltt_sd_diff, 0)
  expect_equal(error_metrics$nonendemic_nltt_sd_diff, 0)
  expect_equal(error_metrics$spec_nltt_ks_dist, 0)
  expect_equal(error_metrics$endemic_nltt_ks_dist, 0)
  expect_equal(error_metrics$nonendemic_nltt_ks_dist, 0)
})

test_that("test calc_error_metrics output is correct when all error
          distributions are unequal", {
  spec_error <- list(nltt = c(1, 2, 3, 4, 5),
                     num_spec_error = c(1, 2, 3, 4, 5),
                     num_col_error = c(1, 2, 3, 4, 5))
  endemic_error <- list(nltt = c(1, 2, 3, 4, 5))
  nonendemic_error <- list(nltt = c(1, 2, 3, 4, 5))
  spec_baseline_error <- list(nltt = c(1, 1, 1, 1, 1),
                              num_spec_error = c(1, 1, 1, 1, 1),
                              num_col_error = c(1, 1, 1, 1, 1))
  endemic_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  nonendemic_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  error_metrics <- calc_error_metrics(
    spec_error = spec_error,
    endemic_error = endemic_error,
    nonendemic_error = nonendemic_error,
    spec_baseline_error = spec_baseline_error,
    endemic_baseline_error = endemic_baseline_error,
    nonendemic_baseline_error = nonendemic_baseline_error)


  expect_true(error_metrics$num_spec_mean_diff != 0)
  expect_true(error_metrics$num_spec_sd_diff != 0)
  expect_true(error_metrics$num_col_mean_diff != 0)
  expect_true(error_metrics$num_col_sd_diff != 0)
  expect_true(error_metrics$spec_nltt_mean_diff != 0)
  expect_true(error_metrics$endemic_nltt_mean_diff != 0)
  expect_true(error_metrics$nonendemic_nltt_mean_diff != 0)
  expect_true(error_metrics$spec_nltt_sd_diff != 0)
  expect_true(error_metrics$endemic_nltt_sd_diff != 0)
  expect_true(error_metrics$nonendemic_nltt_sd_diff != 0)
  expect_true(error_metrics$spec_nltt_ks_dist != 0)
  expect_true(error_metrics$endemic_nltt_ks_dist != 0)
  expect_true(error_metrics$nonendemic_nltt_ks_dist != 0)
})
