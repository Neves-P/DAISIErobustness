context("ml_constraints")

test_that("ml_constraints returns TRUE", {
  oceanic_ml <- list(data.frame("lambda_c" = 0.4703865020955945,
                                   "mu" = 0.3024123467825012,
                                   "K" = 0.9604172665676682,
                                   "gamma" = 0.005654402886347983,
                                   "lambda_a" = 1.256814199481393,
                                   "loglik" = -86.44387709521121,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 1.266996227093286,
                                   "mu" = 1.360311534579718,
                                   "K" = 4.29713623613709,
                                   "gamma" = 0.01871138624408656,
                                   "lambda_a" = 7.741644634429056e-08,
                                   "loglik" = -139.8897801706968,
                                   "df" = 5,
                                   "conv" = 0))

  ml_constraints <- ml_constraints(
    ml = oceanic_ml)
  expect_equal(ml_constraints, TRUE)
})

test_that("test ml_constraints returns FALSE when proportion of failed
          MLs exceeds 1%", {

  oceanic_ml <- list(data.frame("lambda_c" = 0.4703865020955945,
                                "mu" = 0.3024123467825012,
                                "K" = 0.9604172665676682,
                                "gamma" = 0.005654402886347983,
                                "lambda_a" = 1.256814199481393,
                                "loglik" = -86.44387709521121,
                                "df" = 5,
                                "conv" = 0),
                     "ML didn't converge")

  ml_constraints <- ml_constraints(
    ml = oceanic_ml)
  expect_equal(ml_constraints, FALSE)

})
