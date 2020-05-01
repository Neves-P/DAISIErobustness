context("mean_geodynamic_ml")

test_that("use", {
  ml_res_initpars_1 <- list(data.frame(
    "a" = 1.0,
    "b" = 2.0,
    "c" = 3.0,
    "d" = 4.0,
    "e" = 5.0
  ))
  ml_res_initpars_2 <- list(data.frame(
    "a" = 1.0,
    "b" = 4.0,
    "c" = 6.0,
    "d" = 8.0,
    "e" = 10.0
  ))


  mean_1 <- mean(
    c(as.numeric(ml_res_initpars_1[[1]][1]),
    as.numeric(ml_res_initpars_2[[1]][1])
  ))
  mean_2 <- mean(
    c(as.numeric(ml_res_initpars_1[[1]][2]),
    as.numeric(ml_res_initpars_2[[1]][2])
  ))
  mean_3 <- mean(
    c(as.numeric(ml_res_initpars_1[[1]][3]),
    as.numeric(ml_res_initpars_2[[1]][3])
  ))
  mean_4 <- mean(
    c(as.numeric(ml_res_initpars_1[[1]][4]),
    as.numeric(ml_res_initpars_2[[1]][4])
  ))
  mean_5 <- mean(
    c(as.numeric(ml_res_initpars_1[[1]][5]),
    as.numeric(ml_res_initpars_2[[1]][5])
  ))

  calculated <- mean_geodynamic_ml(
    ml_res_initpars_1 = ml_res_initpars_1,
    ml_res_initpars_2 = ml_res_initpars_2
  )
  expected <- list(c(
    "a" = mean_1,
    "b" = mean_2,
    "c" = mean_3,
    "d" = mean_4,
    "e" = mean_5
  ))
  expect_equal(calculated, expected)
})
