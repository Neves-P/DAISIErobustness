test_that("get_runtime_params works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  runtime_params <- get_runtime_params(file.path(getwd(), "testdata", "logs"))
  expected <- data.frame(
    "param_space_name" = c(
      rep("oceanic_ontogeny_sea_level_cs", 6), rep("oceanic_sea_level_cs", 2)
    ),
    "param_set" = c(228, 230, 240, 251, 255, 483, 443, 445),
    "runtime" = c(2748, 3757, 6379, 4641, 5326, 3713, 3303, 5834),
    "log_name" = c(
      "robustness-22352504.log",
      "robustness-22352506.log",
      "robustness-22352516.log",
      "robustness-22352527.log",
      "robustness-22352531.log",
      "robustness-22352759.log",
      "robustness-22353749.log",
      "robustness-22353751.log"
    )
  )
  expect_equal(runtime_params, expected)
})
