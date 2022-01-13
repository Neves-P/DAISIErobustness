test_that("get_runtime_params works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  runtime_params <- get_runtime_params(file.path("testdata", "logs"))
  expected <- data.frame(
    "param_space_name" = rep("nonoceanic_cs", 8),
    "param_set" = 1:8,
    "runtime" = c(72, 52, 51, 81, 94, 77, 58, 60),
    "status" = rep("COMPLETED", 8),
    "log_name" = c(
      "robustness-22656110.log",
      "robustness-22656111.log",
      "robustness-22656112.log",
      "robustness-22656113.log",
      "robustness-22656114.log",
      "robustness-22656115.log",
      "robustness-22656116.log",
      "robustness-22656117.log"
    )
  )
  expect_equal(runtime_params, expected)
})
