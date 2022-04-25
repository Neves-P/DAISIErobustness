test_that("test calc_error_metrics output is correct when all error
          distributions are equal", {
  spec_nltt_error <- c(1, 1, 1, 1)
  num_spec_error <- c(1, 1, 1, 1)
  num_col_error <- c(1, 1, 1, 1)
  endemic_nltt_error <- c(1, 1, 1, 1)
  nonendemic_nltt_error <- c(1, 1, 1, 1)
  spec_baseline_nltt_error <- c(1, 1, 1, 1)
  num_spec_baseline_error <- c(1, 1, 1, 1)
  num_col_baseline_error <- c(1, 1, 1, 1)
  endemic_baseline_nltt_error <- c(1, 1, 1, 1)
  nonendemic_baseline_nltt_error <- c(1, 1, 1, 1)

  error_metrics <- calc_error_metrics(
    spec_nltt_error = spec_nltt_error,
    num_spec_error = num_spec_error,
    num_col_error = num_col_error,
    endemic_nltt_error = endemic_nltt_error,
    nonendemic_nltt_error = nonendemic_nltt_error,
    spec_baseline_nltt_error = spec_baseline_nltt_error,
    num_spec_baseline_error = num_spec_baseline_error,
    num_col_baseline_error = num_col_baseline_error,
    endemic_baseline_nltt_error = endemic_baseline_nltt_error,
    nonendemic_baseline_nltt_error = nonendemic_baseline_nltt_error
  )
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
})

test_that("test calc_error_metrics output is correct when all error
          distributions are unequal", {
  spec_nltt_error <- c(1, 2, 3, 4, 5)
  num_spec_error <- c(1, 1, 1, 1, 5)
  num_col_error <- c(1, 2, 3, 4, 5)
  endemic_nltt_error <- c(1, 2, 3, 4, 5)
  nonendemic_nltt_error <- c(1, 2, 3, 4, 5)
  spec_baseline_nltt_error <- c(1, 1, 1, 1, 1)
  num_spec_baseline_error <- c(1, 1, 1, 1, 1)
  num_col_baseline_error <- c(1, 1, 1, 1, 1)
  endemic_baseline_nltt_error <- c(1, 1, 1, 1, 1)
  nonendemic_baseline_nltt_error <- c(1, 1, 1, 1, 1)

  error_metrics <- calc_error_metrics(
    spec_nltt_error = spec_nltt_error,
    num_spec_error = num_spec_error,
    num_col_error = num_col_error,
    endemic_nltt_error = endemic_nltt_error,
    nonendemic_nltt_error = nonendemic_nltt_error,
    spec_baseline_nltt_error = spec_baseline_nltt_error,
    num_spec_baseline_error = num_spec_baseline_error,
    num_col_baseline_error = num_col_baseline_error,
    endemic_baseline_nltt_error = endemic_baseline_nltt_error,
    nonendemic_baseline_nltt_error = nonendemic_baseline_nltt_error
  )

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
})
