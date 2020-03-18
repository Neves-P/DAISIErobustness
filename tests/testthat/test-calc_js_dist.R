context("calc_js_dist, calc_js_div, calc_kl_div")

test_that("test calc_js_dist output is correct for oceanic_ontogeny", {
  #errors output from oceanic_ontogeny param_set 2 with seed 1
  spec_error <- list(nltt = c(3.466459645659721, 16.779762104341131))
  endemic_error <- list(nltt = c(4.105857769709307, 9.843170592071166))
  nonendemic_error <- list(nltt = c(12.19399299074907, 20.13397293941591))

  #baseline errors output from oceanic_ontogeny param_set 2 with seed 1
  spec_baseline_error <- list(nltt = c())
  endemic_baseline_error <- list(nltt = c())
  nonendemic_baseline_error <- list(nltt = c())

  js_dist <- calc_js_dist(spec_error = spec_error,
                          endemic_error = endemic_error,
                          nonendemic_error = nonendemic_error,
                          spec_baseline_error = spec_baseline_error,
                          endemic_baseline_error = endemic_baseline_error,
                          nonendemic_baseline_error = nonendemic_baseline_error)

  expect_length(js_dist, 3)
  expect_equal(js_dist, list(js_dist_spec_nltt = 0,
                             js_dist_endemic_nltt = 0,
                             js_dist_nonendemic_nltt = 0))
})

test_that("test calc_js_dist output is correct for oceanic_sea_level", {
  #errors output from oceanic_sea_level param_set 3 with seed 1
  spec_error <- list(nltt = c(12.51245689554037, 5.248395705769793))
  endemic_error <- list(nltt = c(6.251267253365500, 2.302925917732638))
  nonendemic_error <- list(nltt = c(12.69555403808047, 21.94389485833001))

  #baseline errors output from oceanic_sea_level param_set 3 with seed 1

  spec_baseline_error <- list(0)
  endemic_baseline_error <- list(0)
  nonendemic_baseline_error <- list(0)

  js_dist <- calc_js_dist(spec_error = spec_error,
                          endemic_error = endemic_error,
                          nonendemic_error = nonendemic_error,
                          spec_baseline_error = spec_baseline_error,
                          endemic_baseline_error = endemic_baseline_error,
                          nonendemic_baseline_error = nonendemic_baseline_error)

  expect_length(js_dist, 3)
  expect_equal(js_dist, list(js_dist_spec_nltt = 0,
                             js_dist_endemic_nltt = 0,
                             js_dist_nonendemic_nltt = 0))
})

test_that("test calc_js_dist output is correct for
          oceanic_ontogeny_sea_level", {
  #errors output from oceanic_ontogeny param_set 2 with seed 1
  spec_error <- list(nltt = c(3.466459645659721, 16.779762104341131))
  endemic_error <- list(nltt = c(4.105857769709307, 9.843170592071166))
  nonendemic_error <- list(nltt = c(12.19399299074907, 20.13397293941591))

  #baseline errors output from oceanic_ontogeny param_set 2 with seed 1

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
  expect_equal(js_dist, list(js_dist_spec_nltt = 0,
                             js_dist_endemic_nltt = 0,
                             js_dist_nonendemic_nltt = 0))
})

test_that("test calc_js_dist output is correct for oceanic_ontogeny", {
  #errors output from oceanic_ontogeny param_set 2 with seed 1
  spec_error <- list(nltt = c(3.466459645659721, 16.779762104341131))
  endemic_error <- list(nltt = c(4.105857769709307, 9.843170592071166))
  nonendemic_error <- list(nltt = c(12.19399299074907, 20.13397293941591))

  #baseline errors output from oceanic_ontogeny param_set 2 with seed 1

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
  expect_equal(js_dist, list(js_dist_spec_nltt = 0,
                             js_dist_endemic_nltt = 0,
                             js_dist_nonendemic_nltt = 0))
})

test_that("test calc_js_dist output is correct for oceanic_ontogeny", {
  #errors output from oceanic_ontogeny param_set 2 with seed 1
  spec_error <- list(nltt = c(3.466459645659721, 16.779762104341131))
  endemic_error <- list(nltt = c(4.105857769709307, 9.843170592071166))
  nonendemic_error <- list(nltt = c(12.19399299074907, 20.13397293941591))

  #baseline errors output from oceanic_ontogeny param_set 2 with seed 1

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
  expect_equal(js_dist, list(js_dist_spec_nltt = 0,
                             js_dist_endemic_nltt = 0,
                             js_dist_nonendemic_nltt = 0))
})

test_that("test calc_js_dist output is correct for oceanic_ontogeny", {
  #errors output from oceanic_ontogeny param_set 2 with seed 1
  spec_error <- list(nltt = c(3.466459645659721, 16.779762104341131))
  endemic_error <- list(nltt = c(4.105857769709307, 9.843170592071166))
  nonendemic_error <- list(nltt = c(12.19399299074907, 20.13397293941591))

  #baseline errors output from oceanic_ontogeny param_set 2 with seed 1

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
  expect_equal(js_dist, list(js_dist_spec_nltt = 0,
                             js_dist_endemic_nltt = 0,
                             js_dist_nonendemic_nltt = 0))
})

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
