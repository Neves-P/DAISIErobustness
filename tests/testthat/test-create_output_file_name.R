context("create_output_file_name")

test_that("use", {

  param_space_name <- "oceanic_ontogeny"
  param_set <- 1
  sim_constraints <- TRUE
  ml_constraints <- FALSE
  expect_equal(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set,
      sim_constraints = sim_constraints,
      ml_constraints = ml_constraints
    ), expected = "failed_cond_oceanic_ontogeny_param_set_1.Rdata"
  )

  sim_constraints <- FALSE
  ml_constraints <- TRUE
  expect_equal(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set,
      sim_constraints = sim_constraints,
      ml_constraints = ml_constraints
    ), expected = "failed_cond_oceanic_ontogeny_param_set_1.Rdata"
  )

  sim_constraints <- TRUE
  ml_constraints <- TRUE
  expect_equal(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set,
      sim_constraints = sim_constraints,
      ml_constraints = ml_constraints
    ), expected = "passed_cond_oceanic_ontogeny_param_set_1.Rdata"
  )

  sim_constraints <- FALSE
  ml_constraints <- FALSE
  expect_equal(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set,
      sim_constraints = sim_constraints,
      ml_constraints = ml_constraints
    ), expected = "failed_cond_oceanic_ontogeny_param_set_1.Rdata"
  )
})

test_that("abuse", {
  param_space_name <- "oceanic_ontogeny"
  param_set <- 1
  sim_constraints <- NULL
  ml_constraints <- NULL
  expect_error(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set,
      sim_constraints = sim_constraints,
      ml_constraints = ml_constraints
    )
  )
})