test_that("get_runtime_params works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")


  runtime_params <- get_runtime_params(file.path(getwd(), "testdata/logs"))
  expected <- data.frame(
    "param_space_name" = c(
      rep("nonoceanic_land_bridge", 2), rep("oceanic_sea_level", 4)
    ),
    "param_set" = c(92, 123, 237, 279, 473, 569),
    "runtime" = c(137675, 83973, 272609, 211851, 348261, 369715)
  )
  expect_equal(runtime_params, expected)
})
