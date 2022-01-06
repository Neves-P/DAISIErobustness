test_that("read_param_space_log works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")
  # Find test environment file path
  log_file_path <- list.files(
    file.path("testdata", "logs"),
    full.names = TRUE,
    pattern = "robustness-22352504.log"
  )

  log_lines <- read_log_file(log_file_path = log_file_path)
  param_space_name <- read_param_space_name_log(
    log_lines = log_lines,
    log_file_path = log_file_path
  )

  expect_equal(param_space_name, "oceanic_ontogeny_sea_level_cs")
})
