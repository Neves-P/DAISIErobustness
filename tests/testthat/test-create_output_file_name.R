context("create_output_file_name")

test_that("use", {

  param_space_name <- "oceanic_ontogeny"
  param_set <- 1
  ml_constraints <- FALSE
  expect_equal(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set,
      ml_constraints = ml_constraints
    ), expected = "failed_cond_oceanic_ontogeny_param_set_1.RData"
  )

  ml_constraints <- TRUE
  expect_equal(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set,
      ml_constraints = ml_constraints
    ), expected = "passed_cond_oceanic_ontogeny_param_set_1.RData"
  )
})

test_that("abuse", {
  param_space_name <- "oceanic_ontogeny"
  param_set <- 1
  ml_constraints <- NULL

  expect_error(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set,
      ml_constraints = ml_constraints
    )
  )
})
