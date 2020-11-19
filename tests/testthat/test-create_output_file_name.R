context("create_output_file_name")

test_that("use", {

  param_space_name <- "oceanic_ontogeny"
  param_set <- 1
  expect_equal(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set
    ), expected = "oceanic_ontogeny_param_set_1.RData"
  )
})

test_that("abuse", {
  param_space_name <- "oceanic_ontogeny"
  param_set <- NULL

  expect_error(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set
    )
  )

  param_space_name <- NULL
  param_set <- 1

  expect_error(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set
    )
  )

  param_space_name <- NULL
  param_set <- NULL

  expect_error(
    create_output_file_name(
      param_space_name = param_space_name,
      param_set = param_set
    )
  )
})
