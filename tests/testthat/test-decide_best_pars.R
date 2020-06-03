context("decide_best_pars")

test_that("use", {
  # Pass difference
  ml_res_initpars_1 <- list(data.frame(1, 2, 3, 4, 5, 6))
  ml_res_initpars_2 <- list(data.frame(1, 2, 3, 4, 5, 6))

  obtained <- decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2
  )

  expected <- list(list(
    pars_to_use = data.frame(
      "X1" = 1,
      "X2" = 2,
      "X3" = 3,
      "X4" = 4,
      "X5" = 5,
      "X6" = 6
    )))
  expect_equal(object = obtained, expected = expected)

  # Fail difference

  ml_res_initpars_1 <- list(data.frame(1, 2, 3, 4, 5, 6))
  ml_res_initpars_2 <- list(data.frame(10, 20, 30, 40, 50, 60))

  obtained <- decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2
  )

  expected <- list(
    list(
      pars_to_use = data.frame(
        "X10" = 10,
        "X20" = 20,
        "X30" = 30,
        "X40" = 40,
        "X50" = 50,
        "X60" = 60
      )
    )
  )
  expect_equal(object = obtained, expected = expected)
})
test_that("abuse", {
  # Needs list of dataframes
  ml_res_initpars_1 <- data.frame(1, 2, 3, 4, 5)
  ml_res_initpars_2 <- list(data.frame(1, 2, 3, 4, 5))
  expect_error(decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2
  ))
})
