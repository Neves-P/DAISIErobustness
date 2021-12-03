test_that("calc_ed95_for_plots works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")
  ed95 <- suppressMessages(
    calc_ed95_for_plots(
      file.path("testdata", "results", "oceanic_sea_level_cs")
    )
  )

  expected_output <- list(
    ed95_spec_nltt = c(0.0784313725490196, 0.1960784313725490),
    ed95_endemic_nltt = c(0.1176470588235294, 0.0784313725490196),
    ed95_nonendemic_nltt = c(0.117647058823529, 0.196078431372549),
    ed95_num_spec = c(0.0588235294117647, 0.2352941176470588),
    ed95_num_col = c(0.0588235294117647, 0.1764705882352941)
  )

  expect_equal(ed95, expected_output)
})
