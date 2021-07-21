test_that("read_param_space_log works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  # Find test environment file path
  log_file_path <- list.files(
    file.path(getwd(), "testdata/logs"),
    full.names = TRUE,
    pattern = "robustness-20596511.log"
  )

  param_space_name <- read_param_space_name_log(
    log_file_path = log_file_path
  )

  expect_equal(param_space_name, "oceanic_sea_level")
})
