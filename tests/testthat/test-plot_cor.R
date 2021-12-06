test_that("Plot works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")
  runtime_params <- get_runtime_params(
    file.path("testdata", "logs")
  )

  results_total <- calc_ed95_param_set(
    file.path("testdata", "results")
  )

  runtime_pars <- merge(
    runtime_params, results_total, by = c("param_space_name", "param_set")
  )

  temp_dir_path <- tempdir()

  expect_false(file.exists(file.path(temp_dir_path, "runtime_ed95_corr.png")))
  expect_false(file.exists(file.path(temp_dir_path, "runtime_ed95_corr.pdf")))


  expect_silent(
    plot_cor(param_space_data_frame = runtime_pars, folder_path = temp_dir_path)
  )

  file.remove(file.path(temp_dir_path, "runtime_ed95_corr.png"))
  file.remove(file.path(temp_dir_path, "runtime_ed95_corr.pdf"))
  expect_false(file.exists(file.path(temp_dir_path, "runtime_ed95_corr.png")))
  expect_false(file.exists(file.path(temp_dir_path, "runtime_ed95_corr.pdf")))
})

