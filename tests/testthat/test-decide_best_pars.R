context("decide_best_pars")

test_that("use, pass both constraints", {
  # Pass difference
  ml_res_initpars_1 <- list(data.frame(1, 2, 3, 4, 5, 6))
  ml_res_initpars_2 <- list(data.frame(1, 2, 3, 4, 5, 6))

  novel_ml_constraints_1 <- TRUE
  novel_ml_constraints_2 <- TRUE

  obtained <- decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2,
    novel_ml_constraints_1 = novel_ml_constraints_1,
    novel_ml_constraints_2 = novel_ml_constraints_2
  )

  expected <- list(data.frame(
    "X1" = 1,
    "X2" = 2,
    "X3" = 3,
    "X4" = 4,
    "X5" = 5,
    "X6" = 6
  ))

  expect_equal(object = obtained, expected = expected)

  # Fail difference

  ml_res_initpars_1 <- list(data.frame(1, 2, 3, 4, 5, 6))
  ml_res_initpars_2 <- list(data.frame(10, 20, 30, 40, 50, 60))

  obtained <- decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2,
    novel_ml_constraints_1 = novel_ml_constraints_1,
    novel_ml_constraints_2 = novel_ml_constraints_2
  )

  expected <- list(data.frame(
    "X10" = 10,
    "X20" = 20,
    "X30" = 30,
    "X40" = 40,
    "X50" = 50,
    "X60" = 60
  ))

  expect_equal(object = obtained, expected = expected)
})

test_that("use, fail constraints", {
  # pass difference fail constraint
  ml_res_initpars_1 <- list(data.frame(1, 2, 3, 4, 5, 6))
  ml_res_initpars_2 <- list(data.frame(1, 2, 3, 4, 5, 6))

  novel_ml_constraints_1 <- FALSE
  novel_ml_constraints_2 <- TRUE

  obtained <- decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2,
    novel_ml_constraints_1 = novel_ml_constraints_1,
    novel_ml_constraints_2 = novel_ml_constraints_2
  )

  expected <- list(data.frame(
    "X1" = 1,
    "X2" = 2,
    "X3" = 3,
    "X4" = 4,
    "X5" = 5,
    "X6" = 6
  ))

  expect_equal(object = obtained, expected = expected)

  # Same as above, FAIL another one
  novel_ml_constraints_1 <- TRUE
  novel_ml_constraints_2 <- FALSE

  obtained <- decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2,
    novel_ml_constraints_1 = novel_ml_constraints_1,
    novel_ml_constraints_2 = novel_ml_constraints_2
  )

  expected <- list(data.frame(
    "X1" = 1,
    "X2" = 2,
    "X3" = 3,
    "X4" = 4,
    "X5" = 5,
    "X6" = 6
  ))

  expect_equal(object = obtained, expected = expected)


  # Fail difference

  ml_res_initpars_1 <- list(data.frame(1, 2, 3, 4, 5, 6))
  ml_res_initpars_2 <- list(data.frame(10, 20, 30, 40, 50, 60))

  obtained <- decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2,
    novel_ml_constraints_1 = novel_ml_constraints_1,
    novel_ml_constraints_2 = novel_ml_constraints_2
  )

  expected <- list(data.frame(
    "X1" = 1,
    "X2" = 2,
    "X3" = 3,
    "X4" = 4,
    "X5" = 5,
    "X6" = 6
  ))

  expect_equal(object = obtained, expected = expected)

  # Fail difference, fail other set

  ml_res_initpars_1 <- list(data.frame(1, 2, 3, 4, 5, 6))
  ml_res_initpars_2 <- list(data.frame(10, 20, 30, 40, 50, 60))

  # Same as above, FAIL another one
  novel_ml_constraints_1 <- FALSE
  novel_ml_constraints_2 <- TRUE

  obtained <- decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2,
    novel_ml_constraints_1 = novel_ml_constraints_1,
    novel_ml_constraints_2 = novel_ml_constraints_2
  )

  expected <- list(data.frame(
    "X10" = 10,
    "X20" = 20,
    "X30" = 30,
    "X40" = 40,
    "X50" = 50,
    "X60" = 60
  ))

  expect_equal(object = obtained, expected = expected)
})



test_that("abuse", {
  # Needs list of data frames
  ml_res_initpars_1 <- data.frame(1, 2, 3, 4, 5)
  ml_res_initpars_2 <- list(data.frame(1, 2, 3, 4, 5))
  expect_error(decide_best_pars(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2,
    novel_ml_constraints_1 = novel_ml_constraints_1,
    novel_ml_constraints_2 = novel_ml_constraints_2
  )
  )
})
