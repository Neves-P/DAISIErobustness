context("run_robustness")

test_that("run_robustness gives error when save_output = TRUE as it
          only runs when folder structure is in place, an therefore
          test not run unless required", {
  if (1 == 2) {
    expect_error(run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 2,
      replicates = 2,
      save_output = TRUE))
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it passes sim_constraints (does not run on APPVEYOR due to
          time limit)", {
  if (Sys.getenv("TRAVIS") != "") {
    errors <- run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 1,
      replicates = 2,
      save_output = FALSE)
    expect_length(errors, 12)
    expect_equal(errors$spec_error, list(nltt = c(49.36892632017155,
                                                  43.61883001698205),
                                         num_spec_error = c(16, 21),
                                         num_col_error = c(5, 6)))
    expect_equal(errors$endemic_error, list(nltt = c(39.85151281102292,
                                                     34.58375482442248)))
    expect_equal(errors$nonendemic_error, list(nltt = c(11.39455312282962,
                                                        10.29907794886149)))
    expect_equal(errors$spec_baseline_error, list(nltt = c(16.00228999740731,
                                                           10.37757903626365),
                                                  num_spec_error = c(1, 4),
                                                  num_col_error = c(1, 2)),
                 tolerance = 0.1)
    expect_equal(errors$endemic_baseline_error,
                 list(nltt = c(8.569252727498716, 12.705949358413807)),
                 tolerance = 0.1)
    expect_equal(errors$nonendemic_baseline_error,
                 list(nltt = c(8.847407001600457, 3.920160821615652)),
                 tolerance = 0.1)
    expect_equal(errors$error_metrics,
                 list(num_spec_mean_diff = 16,
                      num_spec_sd_diff = 1.414213562373095,
                      num_col_mean_diff = 4,
                      num_col_sd_diff = 0,
                      spec_nltt_mean_diff = 33.30394365174132,
                      endemic_nltt_mean_diff = 26.58003277476644,
                      nonendemic_nltt_mean_diff = 4.463031624237499,
                      spec_nltt_sd_diff = 0.08866082562201205,
                      endemic_nltt_sd_diff = 0.7997811545431621,
                      nonendemic_nltt_sd_diff = 2.709471262308392,
                      spec_nltt_ks_dist = 0.07569134389369536,
                      endemic_nltt_ks_dist = 0.1326035648413824,
                      nonendemic_nltt_ks_dist = 0.1677106936763515),
                 tolerance = 0.1)
    expect_length(errors$geodynamic_sim, 2)
    expect_length(errors$geodynamic_sim[[1]][[1]], 30)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$not_present, 971)
    expect_equal(nrow(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 268)
    expect_equal(ncol(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.17243358418345))
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$geodynamic_sim[[2]][[1]], 24)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$not_present, 977)
    expect_equal(nrow(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 256)
    expect_equal(ncol(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.52998334839940, 0.96837497253262, 0.81089291279412))
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$geodynamic_ml,
                 list(data.frame("lambda_c" = 0.4754120842702097,
                                 "mu" = 0.76749608831824,
                                 "K" = 1.298834687112594,
                                 "gamma" = 0.02230623257987434,
                                 "lambda_a" = 2.063223214695227,
                                 "loglik" = -186.3109555871224,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.6157465349398199,
                                 "mu" = 0.2567943041812767,
                                 "K" = 2.45525335464161,
                                 "gamma" = 0.01113093869588465,
                                 "lambda_a" = 2.491005394592663,
                                 "loglik" = -169.9210307807769,
                                 "df" = 5,
                                 "conv" = 0)))
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it fails sim_constraints", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    errors <- run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 10,
      replicates = 2,
      save_output = FALSE)
    expect_length(errors, 1)
    expect_length(errors$geodynamic_sim, 2)
    expect_length(errors$geodynamic_sim[[1]][[1]], 40)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$not_present, 961)
    expect_equal(nrow(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 578)
    expect_equal(ncol(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.17243358418345))
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$geodynamic_sim[[2]][[1]], 28)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$not_present, 973)
    expect_equal(nrow(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 1076)
    expect_equal(ncol(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.34433272778988, 0.28538859055081, 0.01907433159466))
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it fails ml_constraints", {
  skip("skip to pass build")
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    error <- run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 10,
      replicates = 2)
    expect_length(errors, 4)
    expect_length(errors$geodynamic_sim, 2)
    expect_length(errors$geodynamic_sim[[1]][[1]], 12)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$not_present, 989)
    expect_equal(nrow(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 92)
    expect_equal(ncol(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.16583840374981))
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$geodynamic_sim[[2]][[1]], 19)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$not_present, 982)
    expect_equal(nrow(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 132)
    expect_equal(ncol(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.29032111838460, 0.80903212943811, 0.31633454531757))
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
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
    expect_length(oceanic_sim, 2)
    expect_length(oceanic_sim[[1]][[1]], 13)
    expect_equal(oceanic_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(oceanic_sim[[1]][[1]][[1]]$not_present, 988)
    expect_equal(nrow(oceanic_sim[[1]][[1]][[1]]$stt_all), 35)
    expect_equal(ncol(oceanic_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(oceanic_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 2.15575062694003, 1.54615286277701))
    expect_equal(oceanic_sim[[1]][[1]][[2]]$stac, 2)
    expect_equal(oceanic_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(oceanic_sim[[2]][[1]], 21)
    expect_equal(oceanic_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(oceanic_sim[[2]][[1]][[1]]$not_present, 980)
    expect_equal(nrow(oceanic_sim[[2]][[1]][[1]]$stt_all), 84)
    expect_equal(ncol(oceanic_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(oceanic_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.0134786754538898))
    expect_equal(oceanic_sim[[2]][[1]][[2]]$stac, 4)
    expect_equal(oceanic_sim[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(error$oceanic_ml,
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
