test_that("read_runtime works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  # Find test environment file path
  log_file_path <- list.files(
    file.path("testdata", "logs"),
    full.names = TRUE,
    pattern = "robustness-22353751.log"
  )

  runtime <- read_runtime_log(log_file_path = log_file_path)
  expect_equal(runtime, 5834)
})
