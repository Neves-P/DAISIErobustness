context("calc_ks_distance")

test_that("use", {
  vec_1 <- c(1, 2, 3, 4, 5)
  vec_2 <- c(1, 1, 1, 1, 1)

  expect_silent(
    ks_distance <- calc_ks_distance(
      vec_1 = vec_1,
      vec_2 = vec_2
    )
  )
  expect_equal(ks_distance, 0.2)

  vec_2 <- c(1, 2, 3, 4, 5)
  expect_silent(
    ks_distance <- calc_ks_distance(
      vec_1 = vec_1,
      vec_2 = vec_2
    )
  )
  expect_equal(ks_distance, 0)
})

test_that("abuse", {
  vec_1 <- c(1, 2, 3, 4, 5)
  vec_2 <- "nonsense"
  expect_error(
    calc_ks_distance(
      vec_1 = vec_1,
      vec_2 = vec_2
    )
  )
})
