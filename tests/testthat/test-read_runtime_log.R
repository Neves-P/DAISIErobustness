test_that("read_runtime works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  # Find test environment file path
  log_file_path <- list.files(
    file.path(getwd(), "testdata/logs"),
    full.names = TRUE,
    pattern = "robustness-20596511.log"
  )

  runtime <- read_runtime_log(log_file_path = "logs/robustness-20596511.log")
  expect_equal(runtime, 369715)
})
