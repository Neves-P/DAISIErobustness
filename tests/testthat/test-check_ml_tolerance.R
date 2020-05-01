context("check_ml_tolerance")

test_that("use", {
  ml_res_initpars_1 <- list(data.frame(1, 2, 3, 4, 5))
  ml_res_initpars_2 <- list(data.frame(1, 2, 3, 4, 5))
  expect_true(check_ml_tolerance(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2
  ))

  # High values are considered the same
  ml_res_initpars_1 <- list(data.frame(100000, 2, 3, 4, 5))
  ml_res_initpars_2 <- list(data.frame(5000, 2, 3, 4, 5))
  expect_true(check_ml_tolerance(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2
  ))

  # Different values return false
  ml_res_initpars_2 <- list(data.frame(100, 200, 300, 400, 500))
  expect_false(check_ml_tolerance(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2
  ))
})
test_that("abuse", {
  # Needs list of dataframes
  ml_res_initpars_1 <- data.frame(1, 2, 3, 4, 5)
  ml_res_initpars_2 <- list(data.frame(1, 2, 3, 4, 5))
  expect_error(check_ml_tolerance(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2
  ))
})
