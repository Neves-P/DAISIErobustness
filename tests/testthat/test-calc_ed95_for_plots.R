test_that("calc_ed95_for_plots works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")
  param_space <- load_param_space("continental_cs")
  ed95 <- suppressMessages(
    calc_ed95_for_plots(
      folder_path = file.path("testdata", "results", "continental_cs"),
      param_space = param_space
    )
  )
  n_nas <- nrow(param_space) - 8
  expected_output <- cbind(
    param_space,
    ed95_spec_nltt = c(
      1.00, 0.50, 0.75, 0.75, 1.00, 1.00, 0.75, 0.50,
      rep(NA, n_nas)),
    ed95_endemic_nltt = c(
      1.00, 0.50, 0.75, 0.75, 1.00, 1.00, 1.00, 0.50,
      rep(NA, n_nas)),
    ed95_nonendemic_nltt = c(
      0.50, 0.50, 1.00, 0.25, 0.25, 0.25, 0.25, 0.50,
      rep(NA, n_nas)),
    ed95_num_spec = c(
      0.75, 0.25, 0.25, 0.25, 0.50, 1.00, 0.50, 0.50,
      rep(NA, n_nas)),
    ed95_num_col = c(
      0.50, 0.25, 0.25, 0.50, 0.75, 0.75, 0.25, 0.25,
      rep(NA, n_nas))
  )
  expect_equal(ed95, expected_output)
})
