context("ml_constraints")

test_that("ml_constraints returns TRUE", {
  oceanic_ml <- list(data.frame("lambda_c" = 1,
                                   "mu" = 1,
                                   "K" = 25,
                                   "gamma" = 0.01,
                                   "lambda_a" = 1,
                                   "loglik" = -90,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 1,
                                   "mu" = 1,
                                   "K" = 25,
                                   "gamma" = 0.01,
                                   "lambda_a" = 1,
                                   "loglik" = -90,
                                   "df" = 5,
                                   "conv" = 0))

  ml_constraints <- ml_constraints(
    ml = oceanic_ml)
  expect_equal(ml_constraints, TRUE)
})

test_that("test ml_constraints returns FALSE when an ML fails", {

  oceanic_ml <- list(data.frame("lambda_c" = 1,
                                "mu" = 1,
                                "K" = 25,
                                "gamma" = 0.01,
                                "lambda_a" = 1,
                                "loglik" = -90,
                                "df" = 5,
                                "conv" = 0),
                     "ML didn't converge")

  ml_constraints <- ml_constraints(
    ml = oceanic_ml)
  expect_equal(ml_constraints, FALSE)

})
