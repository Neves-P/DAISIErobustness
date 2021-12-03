test_that("calc_runtime_ed95_cor works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")
  runtime_params <- get_runtime_params(file.path(getwd(), "testdata", "logs"))

  ed95 <- suppressMessages(
    calc_ed95_param_set(file.path(getwd(), "testdata", "results"))
  )

  runtime_ed95_cor <- calc_runtime_ed95_cor(
    runtime_params = runtime_params,
    ed95_param_sets = ed95
  )


  expected_output <- data.frame(
    spec_nltt_cor = 0.291921902389,
    endemic_nltt_cor = -0.0777961487649631,
    nonendemic_nltt_cor = 0.0191562137145573,
    num_spec_cor = 0.0865181123855519,
    num_col_cor = 0.199292921739181
  )

  expect_equal(runtime_ed95_cor, expected_output)
})
