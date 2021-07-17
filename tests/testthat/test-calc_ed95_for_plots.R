test_that("calc_ed95_for_plots works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  ed95 <- suppressMessages(
    calc_ed95_for_plots(
      file.path(getwd(), "testdata/results/nonoceanic_land_bridge/")
    )
  )

  expected_output <- list(
    ed95_spec_nltt = c(0.996003996003996, 0.999000999000999),
    ed95_endemic_nltt = c(0.977022977022977, 0.974025974025974),
    ed95_nonendemic_nltt = c(0.997002997002997, 0.998001998001998),
    ed95_num_spec = c(0.05394605394605394, 0.04995004995004995),
    ed95_num_col = c(0.02797202797202797, 0.04495504495504495)
  )

  expect_equal(ed95, expected_output)
})
