test_that("calc_ed95_for_plots works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")
  ed95 <- suppressMessages(
    calc_ed95_for_plots(
      file.path("testdata", "results", "continental_cs")
    )
  )

  expected_output <- list(
    ed95_spec_nltt = c(1.00, 0.50, 0.75, 0.75, 1.00, 1.00, 0.75, 0.50),
    ed95_endemic_nltt = c(1.00, 0.50, 0.75, 0.75, 1.00, 1.00, 1.00, 0.50),
    ed95_nonendemic_nltt = c(0.50, 0.50, 1.00, 0.25, 0.25, 0.25, 0.25, 0.50),
    ed95_num_spec = c(0.75, 0.25, 0.25, 0.25, 0.50, 1.00, 0.50, 0.50),
    ed95_num_col = c(0.50, 0.25, 0.25, 0.50, 0.75, 0.75, 0.25, 0.25)
  )

  expect_equal(ed95, expected_output)
})
