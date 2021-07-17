test_that("multiplication works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")
  runtime_params <- get_runtime_params(
    "testdata/logs/"
  )

  results_total <- calc_ed95_param_set(
    "testdata/results"
  )

  runtime_cors <- calc_runtime_ed95_cor(
    runtime_params = runtime_params,
    ed95_param_sets = results_total
  )

  runtime_pars <- merge(
    runtime_params, results_total, by = c("param_space_name", "param_set")
  )

  plot_cor(runtime_pars)
  expect_identical(
    "runtime_ed95_corr.pdf",
    "testdata/plots/runtime_ed95_corr.pdf")
  expect_identical(
    "runtime_ed95_corr.png",
    "testdata/plots/runtime_ed95_corr.png"
  )
})
