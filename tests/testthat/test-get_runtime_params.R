test_that("get_runtime_params works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  runtime_params <- get_runtime_params(file.path("testdata", "logs"))
  expected <- data.frame(
    "param_space_name" = rep("continental_cs", 8),
    "param_set" = 1:8,
    "runtime" = c(91, 119, 50, 83, 88, 88, 85, 127),
    "status" = rep("COMPLETED", 8),
    "log_name" = c(
      "robustness-22891156.log",
      "robustness-22891157.log",
      "robustness-22891158.log",
      "robustness-22891159.log",
      "robustness-22891160.log",
      "robustness-22891161.log",
      "robustness-22891162.log",
      "robustness-22891163.log"
    )
  )
  expect_equal(runtime_params, expected)
})
