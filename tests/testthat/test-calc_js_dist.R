context("calc_js_dist, calc_js_div, calc_kl_div")

test_that("test calc_js_dist output is correct", {
  spec_error <- list(nltt = c(1, 1, 1, 1, 1))
  endemic_error <- list(nltt = c(1, 1, 1, 1, 1))
  nonendemic_error <- list(nltt = c(1, 1, 1, 1, 1))
  spec_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  endemic_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  nonendemic_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  js_dist <- calc_js_dist(spec_error = spec_error,
                          endemic_error = endemic_error,
                          nonendemic_error = nonendemic_error,
                          spec_baseline_error = spec_baseline_error,
                          endemic_baseline_error = endemic_baseline_error,
                          nonendemic_baseline_error = nonendemic_baseline_error)
  expect_equal(js_dist$js_dist_spec_nltt, 0)
  expect_equal(js_dist$js_dist_endemic_nltt, 0)
  expect_equal(js_dist$js_dist_nonendemic_nltt, 0)

  spec_error <- list(nltt = c(2, 2, 2, 2, 2))
  endemic_error <- list(nltt = c(2, 2, 2, 2, 2))
  nonendemic_error <- list(nltt = c(2, 2, 2, 2, 2))
  spec_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  endemic_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  nonendemic_baseline_error <- list(nltt = c(1, 1, 1, 1, 1))
  js_dist <- calc_js_dist(spec_error = spec_error,
                          endemic_error = endemic_error,
                          nonendemic_error = nonendemic_error,
                          spec_baseline_error = spec_baseline_error,
                          endemic_baseline_error = endemic_baseline_error,
                          nonendemic_baseline_error = nonendemic_baseline_error)
  expect_true(js_dist$js_dist_spec_nltt != 0)
  expect_true(js_dist$js_dist_endemic_nltt != 0)
  expect_true(js_dist$js_dist_nonendemic_nltt != 0)
})

test_that("test calc_js_dist is between 0 and 1 when distributions sum to 1", {
  error <- rnorm(n = 10, mean = 10)
  error <- error / sum(error)
  baseline_error <- rnorm(n = 10, mean = 10)
  baseline_error <- baseline_error / sum(baseline_error)
  js_dist <- calc_js_div(error, baseline_error)
  expect_true(js_dist >= 0)
  expect_true(js_dist <= 1)
})

test_that("test calc_kl_div output is correct", {
  #zero when distributions are identical
  p <- c(1, 1, 1, 1, 1)
  q <- c(1, 1, 1, 1, 1)
  kl <- calc_kl_div(p = p, q = q)
  expect_equal(kl, 0)

  #non-zero when distributions are different
  p <- c(2, 2, 2, 2, 2)
  q <- c(1, 1, 1, 1, 1)
  kl <- calc_kl_div(p = p, q = q)
  expect_true(kl != 0)
})

test_that("test calc_js_div output is correct", {
  p <- c(1, 1, 1, 1, 1)
  q <- c(1, 1, 1, 1, 1)
  js <- calc_js_div(p = p, q = q)
  expect_equal(js, 0)

  p <- c(2, 2, 2, 2, 2)
  q <- c(1, 1, 1, 1, 1)
  js <- calc_js_div(p = p, q = q)
  expect_true(js != 0)
})
