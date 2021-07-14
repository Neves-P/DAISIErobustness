test_that("calc_runtime_ed95_cor works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  runtime_params <- get_runtime_params(file.path(getwd(), "testdata/logs"))

  runtime_ed95_cor <- calc_runtime_ed95_cor(
    runtime_params = runtime_params,
    ed95_param_sets = ed95_param_sets
  )


  expected_output <- data.frame(
    param_space_name = rep("nonoceanic_land_bridge", 3),
    param_set = c(175, 191, 197),
    ed95_spec_nltt = c(0.44655345, 0.50949051, 0.05294705),
    ed95_endemic_nltt = c(0.44955045, 0.33766234, 0.06893107),
    ed95_nonendemic_nltt = c(0.24575425, 0.74425574, 0.02897103),
    ed95_num_spec = c(0.044955044955044, 0.040959040959040, 0.069930069930069),
    ed95_num_col = c(0.047952047952047, 0.036963036963036, 0.057942057942057)
  )

  expect_equal(ed95, expected_output)

  expect_equal(2 * 2, 4)
})
