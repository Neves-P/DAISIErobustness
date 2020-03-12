context("run_robustness")

test_that("test_run_robustness is silent when oceanic_ontogeny
          passes as function does not return output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    expect_silent(run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 2,
      replicates = 2,
      verbose = FALSE))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test_run_robustness is silent when oceanic_sea_level
          passes as function does not return output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    expect_silent(run_robustness(
      param_space_name = "oceanic_sea_level",
      param_set = 3,
      replicates = 2))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test_run_robustness is silent when oceanic_ontogeny_sea_level
          passes as function does not return output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    expect_silent(run_robustness(
      param_space_name = "oceanic_ontogeny_sea_level",
      param_set = 27,
      replicates = 2))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test_run_robustness is silent when nonoceanic
          passes as function does not return output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    expect_silent(run_robustness(
      param_space_name = "nonoceanic",
      param_set = 1,
      replicates = 2))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test_run_robustness output is correct for
          nonoceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    expect_silent(run_robustness(
      param_space_name = "nonoceanic_sea_level",
      param_set = 2,
      replicates = 2))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test_run_robustness output is correct for
          nonoceanic_land_bridge", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    expect_silent(run_robustness(
      param_space_name = "nonoceanic_land_bridge",
      param_set = 4,
      replicates = 2))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("abuse param_space_name", {
  expect_error(run_robustness(
    param_space_name = "nonsense",
    param_set = 1,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonsense",
    param_set = 2,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonsense",
    param_set = 1,
    replicates = 3))
})

test_that("abuse param_set", {
  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_sea_level",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_sea_level",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 1000000,
    replicates = 2))
})

test_that("abuse replicates", {
  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "nonoceanic",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_sea_level",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 1,
    replicates = 0))
})
