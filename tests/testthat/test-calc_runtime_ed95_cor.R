test_that("calc_runtime_ed95_cor works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  runtime_params <- get_runtime_params(file.path(getwd(), "testdata/logs"))

  ed95 <- suppressMessages(
    calc_ed95_param_set(file.path(getwd(), "testdata/results/"))
  )

  runtime_ed95_cor <- calc_runtime_ed95_cor(
    runtime_params = runtime_params,
    ed95_param_sets = ed95
  )


  expected_output <- data.frame(
    spec_nltt_cor = -0.8637637401186395,
    endemic_nltt_cor = -0.8579914245548418,
    nonendemic_nltt_cor = -0.8578290635889865,
    num_spec_cor = -0.1319857989792762,
    num_col_cor = 0.2975526496905813
  )

  expect_equal(runtime_ed95_cor, expected_output)
})
