context("run_robustness_local")

test_that("run_robustness_local output is correct when oceanic_ontogeny passes
          constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    errors <- run_robustness_local(
      param_space_name = "oceanic_ontogeny",
      param_set = 2,
      replicates = 2)
    expect_length(error, 12)
    expect_equal(error$spec_error, list(nltt = c(14.60200218911491,
                                                 21.13234531729715),
                                        num_spec_error = c(6, 18),
                                        num_col_error = c(1, 2)))
    expect_equal(error$endemic_error, list(nltt = c(12.19399299074907,
                                                    20.13397293941591)))
    expect_equal(error$nonendemic_error, list(nltt = c(4.105857769709307,
                                                       9.843170592071163)))
    expect_equal(error$spec_baseline_error, list(nltt = c(5.36978441221806,
                                                          20.12382130303635),
                                                 num_spec_error = c(2, 6),
                                                 num_col_error = c(8, 3)))
    expect_equal(error$endemic_baseline_error, list(nltt = c(2.479620682470331,
                                                             13.987840695971366)))
    expect_equal(error$nonendemic_baseline_error, list(nltt = c(5.065599417345626,
                                                                8.150210879922227)))
    expect_equal(error$error_metrics, list(num_spec_mean_diff = 8,
                                           num_spec_sd_diff = 5.65685424949238,
                                           num_col_mean_diff = 4,
                                           num_col_sd_diff = 2.82842712474619,
                                           spec_nltt_mean_diff = 5.120370895578827,
                                           endemic_nltt_mean_diff = 7.930252275861640,
                                           nonendemic_nltt_mean_diff = 0.3666090322563083,
                                           spec_nltt_sd_diff = 5.81502962596146,
                                           endemic_nltt_sd_diff = 2.523126746745787,
                                           nonendemic_nltt_sd_diff = 1.875743119966929,
                                           spec_nltt_ks_dist = 0.1979939251300001,
                                           endemic_nltt_ks_dist = 0.226619434409659,
                                           nonendemic_nltt_ks_dist = 0.0889512124304479))
    expect_length(errors$geodynamic_sim, 2)
    expect_length(errors$geodynamic_sim[[1]][[1]], 12)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$not_present, 989)
    expect_equal(nrow(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 92)
    expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.16583840374981))
    expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 4)
    expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(geodynamic_sim[[2]][[1]], 19)
    expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 982)
    expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 132)
    expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.29032111838460, 0.80903212943811, 0.31633454531757))
    expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)




    expect_equal(error$geodynamic_ml,
                 list(data.frame("lambda_c" = 0.9516893216529831,
                                 "mu" = 0.4371724756929532,
                                 "K" = 26.45933105611771,
                                 "gamma" = 0.005832693735317008,
                                 "lambda_a" = 1.91311658602524,
                                 "loglik" = -93.6464134227662,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 1.17346081209476,
                                 "mu" = 0.9780652536369839,
                                 "K" = 1.798109468901113,
                                 "gamma" = 0.01258190594811776,
                                 "lambda_a" = 0.8917175650839453,
                                 "loglik" = -133.3346436904723,
                                 "df" = 5,
                                 "conv" = 0)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local output is correct when oceanic_ontogeny fails
          constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    errors <- run_robustness_local(
      param_space_name = "oceanic_ontogeny",
      param_set = 1,
      replicates = 2)
    expect_length(errors, 1)
    expect_length(errors$geodynamic_sim, 2)
    expect_length(errors$geodynamic_sim[[1]][[1]], 11)
    expect_equal(names(errors$geodynamic_sim[[1]][[1]][[1]]),
                 c("island_age", "not_present", "stt_all"))
    expect_equal(names(errors$geodynamic_sim[[1]][[1]][[2]]),
                 c("branching_times", "stac", "missing_species"))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local output is correct when oceanic_sea_level passes
          constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "oceanic_sea_level",
      param_set = 3,
      replicates = 2)
    expect_equal()
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local output is correct when oceanic_sea_level fails
          constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "oceanic_sea_level",
      param_set = 1,
      replicates = 2)
    expect_equal()
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local output is correct when
          oceanic_ontogeny_sea_level passes constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "oceanic_ontogeny_sea_level",
      param_set = 27,
      replicates = 2)
    expect_equal()
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local output is correct when
          oceanic_ontogeny_sea_level fails constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "oceanic_ontogeny_sea_level",
      param_set = 1,
      replicates = 2)
    expect_equal()
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local is correct when nonoceanic passes
          constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "nonoceanic",
      param_set = 1,
      replicates = 2)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local ouput is correct when nonoceanic fails
          constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "nonoceanic",
      param_set = 1,
      replicates = 2)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local output is correct when nonoceanic_sea_level
          passes constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "nonoceanic_sea_level",
      param_set = 2,
      replicates = 2)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local output is correct when nonoceanic_sea_level
          fails constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "nonoceanic_sea_level",
      param_set = 2,
      replicates = 2)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local output is correct when nonoceanic_land_bridge
          passes constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "nonoceanic_land_bridge",
      param_set = 4,
      replicates = 2)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness_local output is correct when nonoceanic_land_bridge
          fails constraints", {
  skip("WIP")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness_local(
      param_space_name = "nonoceanic_land_bridge",
      param_set = 4,
      replicates = 2)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("abuse param_set", {
  expect_error(run_robustness_local(
    param_space_name = "oceanic_ontogeny",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "oceanic_ontogeny",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "oceanic_sea_level",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "oceanic_sea_level",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "nonoceanic",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "nonoceanic",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "nonoceanic_sea_level",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "nonoceanic_sea_level",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness_local(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 1000000,
    replicates = 2))
})

test_that("abuse replicates", {
  expect_error(run_robustness_local(
    param_space_name = "oceanic_ontogeny",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness_local(
    param_space_name = "oceanic_sea_level",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness_local(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness_local(
    param_space_name = "nonoceanic",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness_local(
    param_space_name = "nonoceanic_sea_level",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness_local(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 1,
    replicates = 0))
})
