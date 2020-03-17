context("calc_js_dist, calc_js_div, calc_kl_div")

test_that("test calc_js_dist output is correct for oceanic_ontogeny", {
  skip("WIP")
  #errors output from oceanic_ontogeny param_set 2 with seed 1
  spec_error <- list(num_spec_error = 0,
                     num_col_error = 0)
  endemic_error <- list(0)
  nonendemic_error <- list(0)
  spec_baseline_error <- list(0)
  endemic_baseline_error <- list(0)
  nonendemic_baseline_error <- list(0)
  js_dist <- calc_js_dist(spec_error = spec_error,
                          endemic_error = endemic_error,
                          nonendemic_error = nonendemic_error,
                          spec_baseline_error = spec_baseline_error,
                          endemic_baseline_error = endemic_baseline_error,
                          nonendemic_baseline_error = nonendemic_baseline_error)
    expect_length(js_dist, 5)
    expect_equal(js_dist, list(js_dist_num_spec = 0,
                               js_dist_num_col = 0,
                               js_dist_spec_nltt = 0,
                               js_dist_endemic_nltt = 0,
                               js_dist_nonendemic_nltt = 0))
})

test_that("test calc_js_dist output is ", {
  p <- c(1, 1, 1, 1, 1)
  q <- c(1, 1, 1, 1, 1)
  js_dist <- calc_js_dist(p = p, q = q)
  expect_equal(js_dist, 0)

  p <- c(2, 2, 2, 2, 2)
  q <- c(1, 1, 1, 1, 1)
  js_dist <- calc_js_dist(p = p, q = q)
  expect_true(js_dist != 0)
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
