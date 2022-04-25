test_that("calc_runtime_ed95_cor works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")
  runtime_params <- get_runtime_params(file.path("testdata", "logs"))

  ed95 <- suppressMessages(
    calc_ed95_param_set(file.path("testdata", "results"))
  )

  runtime_ed95_cor <- calc_runtime_ed95_cor(
    runtime_params = runtime_params,
    ed95_param_sets = ed95
  )


  expected_output <- data.frame(
    spec_nltt_cor = -0.5118399672060304,
    endemic_nltt_cor = -0.525533174772545,
    nonendemic_nltt_cor = -0.3591522226168544,
    num_spec_cor = 0.08516268838459932,
    num_col_cor = -0.1523532656506726
  )

  expect_equal(runtime_ed95_cor, expected_output)
})
