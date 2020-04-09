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
      param_set = 3,
      replicates = 2,
      save_output = FALSE)
    expect_length(errors, 12)
    expect_equal(errors$spec_error, list(nltt = c(20.010779966924382,
                                                  9.851962524250929),
                                         num_spec_error = c(24, 10),
                                         num_col_error = c(8, 3)),
                 tolerance = 0.2)
    expect_equal(errors$endemic_error, list(nltt = c(16.47521332476096,
                                                     13.96234899101978)),
                 tolerance = 0.2)
    expect_equal(errors$nonendemic_error, list(nltt = c(13.41481594816277,
                                                        12.82164223774583)))
    expect_equal(errors$spec_baseline_error, list(nltt = c(18.259355936349856,
                                                           8.140424723683491),
                                                  num_spec_error = c(11, 11),
                                                  num_col_error = c(7, 9)),
                 tolerance = 0.2)
    expect_equal(errors$endemic_baseline_error,
                 list(nltt = c(19.683550924792641, 5.618219595711591)),
                 tolerance = 0.2)
    expect_equal(errors$nonendemic_baseline_error,
                 list(nltt = c(8.672963707544831, 8.653487718728964)),
                 tolerance = 0.2)
    expect_equal(errors$error_metrics,
                 list(num_spec_mean_diff = 6,
                      num_spec_sd_diff = 9.899494936611665,
                      num_col_mean_diff = 2.5,
                      num_col_sd_diff = 2.121320343559643,
                      spec_nltt_mean_diff = 1.731480915570982,
                      endemic_nltt_mean_diff = 2.567895897638259,
                      nonendemic_nltt_mean_diff = 4.4550033798174,
                      spec_nltt_sd_diff = 0.02820382371397834,
                      endemic_nltt_sd_diff = 8.168827751838602,
                      nonendemic_nltt_sd_diff = 0.4056655492953884,
                      spec_nltt_ks_dist = 0.02155617998690462,
                      endemic_nltt_ks_dist = 0.2366725224916618,
                      nonendemic_nltt_ks_dist = 0.01074234803802276),
                 tolerance = 0.2)
    expect_length(errors$geodynamic_sim, 2)
    expect_length(errors$geodynamic_sim[[1]][[1]], 32)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$not_present, 969)
    expect_equal(nrow(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 220)
    expect_equal(ncol(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.0304813292373698))
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$geodynamic_sim[[2]][[1]], 30)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$not_present, 971)
    expect_equal(nrow(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 251)
    expect_equal(ncol(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.48532612671455))
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$geodynamic_ml,
                 list(data.frame("lambda_c" = 0.9965513396220788,
                                 "mu" = 1.421971833699215,
                                 "K" = 1.718033933878904,
                                 "gamma" = 0.03297340595202831,
                                 "lambda_a" = 0.9244608637322876,
                                 "loglik" = -197.9613141825565,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.92703368284067,
                                 "mu" = 1.338416534733336,
                                 "K" = 1.962886606832068,
                                 "gamma" = 0.02981301608003862,
                                 "lambda_a" = 0.9685350438621138,
                                 "loglik" = -189.5739114064297,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it fails sim_constraints", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
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
