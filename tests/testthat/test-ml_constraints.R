context("ml_constraints")

test_that("ml_constraints returns TRUE when mle passes", {
  oceanic_ml <- data.frame("lambda_c" = 1,
                                   "mu" = 1,
                                   "K" = 25,
                                   "gamma" = 0.01,
                                   "lambda_a" = 1,
                                   "loglik" = -90,
                                   "df" = 5,
                                   "conv" = 0)
  ml_constraints <- ml_constraints(ml = oceanic_ml)
  expect_equal(ml_constraints, TRUE)
})

test_that("ml_constraints returns FALSE when mle fails", {
  oceanic_ml <- data.frame("lambda_c" = NA,
                                "mu" = NA,
                                "K" = NA,
                                "gamma" = NA,
                                "lambda_a" = NA,
                                "loglik" = NA,
                                "df" = NA,
                                "conv" = 1)
  ml_constraints <- ml_constraints(ml = oceanic_ml)
  expect_equal(ml_constraints, FALSE)
})
