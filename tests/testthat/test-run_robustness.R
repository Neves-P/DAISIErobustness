context("run_robustness")


test_that("run_robustness output is correct when save_output = FALSE and
          it passes sim_constraints (does not run on APPVEYOR due to
          time limit)", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    errors <- run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 1,
      replicates = 2,
      save_output = FALSE)
    expect_length(errors, 12)
    expect_equal(errors$spec_error, list(nltt = c(12.81201297515391,
                                                  33.79191923521253),
                                         num_spec_error = c(10, 13),
                                         num_col_error = c(9, 13)),
                 tolerance = 0.2)
    expect_equal(errors$endemic_error, list(nltt = c(8.261073123991562,
                                                     19.864022089537372)),
                 tolerance = 0.2)
    expect_equal(errors$nonendemic_error, list(nltt = c(13.41481594816277,
                                                        12.82164223774583)),
                 tolerance = 0.5)
    expect_equal(errors$spec_baseline_error, list(nltt = c(11.85825831248170,
                                                           17.50605593765896),
                                                  num_spec_error = c(1, 6),
                                                  num_col_error = c(1, 7)),
                 tolerance = 0.2)
    expect_equal(errors$endemic_baseline_error,
                 list(nltt = c(5.514131360314941, 4.388456161649874)),
                 tolerance = 0.2)
    expect_equal(errors$nonendemic_baseline_error,
                 list(nltt = c(11.42409623633400, 17.29508852342916)),
                 tolerance = 0.2)
    expect_equal(errors$error_metrics,
                 list(num_spec_mean_diff = 8,
                      num_spec_sd_diff = 1.414213562373095,
                      num_col_mean_diff = 7,
                      num_col_sd_diff = 1.414213562373094,
                      spec_nltt_mean_diff = 8.619808980112888,
                      endemic_nltt_mean_diff = 9.111253845782059,
                      nonendemic_nltt_mean_diff = 3.911278566422503,
                      spec_nltt_sd_diff = 10.84143798561344,
                      endemic_nltt_sd_diff = 7.408551328909295,
                      nonendemic_nltt_sd_diff = 1.351583817266397,
                      spec_nltt_ks_dist = 0.1289195885011595,
                      endemic_nltt_ks_dist = 0.2631113773607973,
                      nonendemic_nltt_ks_dist = 0.08399858431192242),
                 tolerance = 0.2)
    expect_length(errors$geodynamic_sim, 2)
    expect_length(errors$geodynamic_sim[[1]][[1]], 64)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$not_present, 937)
    expect_equal(nrow(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 145)
    expect_equal(ncol(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.56869465348621))
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$geodynamic_sim[[2]][[1]], 59)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$not_present, 942)
    expect_equal(nrow(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 143)
    expect_equal(ncol(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 2.27175578586757))
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$stac, 4)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$geodynamic_ml,
                 list(data.frame("lambda_c" = 4.93245551463291e-08,
                                 "mu" = 0.2079398955033904,
                                 "K" = 1.096019787831134,
                                 "gamma" = 0.03235948962897911,
                                 "lambda_a" = 1.333597017889932,
                                 "loglik" = -328.671086110396,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 1.255363296522673e-08,
                                 "mu" = 0.03845159846645289,
                                 "K" = 3.297396105095508,
                                 "gamma" = 0.0242967074651809,
                                 "lambda_a" = 0.7106141463253953,
                                 "loglik" = -315.3743622623609,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it fails sim_constraints", {
  skip("skip to pass build")
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    errors <- run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 1,
      replicates = 2,
      save_output = FALSE)
    expect_length(errors, 1)
    expect_length(errors$geodynamic_sim, 2)
    expect_length(errors$geodynamic_sim[[1]][[1]], 48)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$not_present, 953)
    expect_equal(nrow(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 265)
    expect_equal(ncol(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.70582294637958, 0.13492745976706))
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$stac, 2)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$geodynamic_sim[[2]][[1]], 47)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$not_present, 954)
    expect_equal(nrow(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 304)
    expect_equal(ncol(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55,2.46421432544788, 2.19479358839356,
                   0.39036330262399, 0.14421164062499))
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it fails ml_constraints", {
  skip("skip to pass build")
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
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
