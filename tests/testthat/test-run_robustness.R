context("run_robustness")


test_that("run_robustness output is correct when save_output = FALSE and
          it passes sim_constraints", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    errors <- run_robustness(
      param_space_name = "nonoceanic",
      param_set = 27,
      replicates = 2,
      save_output = FALSE)

    expect_length(errors, 16)
    expect_equal(errors$spec_error, list(nltt = c(52.8733889946212,
                                                  68.0769666819412),
                                           num_spec_error = c(3, 3),
                                           num_col_error = c(2, 5)),
                 tolerance = 0.2)
    expect_equal(errors$endemic_error, list(nltt = c(63.3929834649500,
                                                     66.5366345108483)),
                 tolerance = 0.2)
    expect_equal(errors$nonendemic_error, list(nltt = c(12.22276273470610,
                                                        3.40199020751629)),
                 tolerance = 0.2)
    expect_equal(errors$spec_baseline_error, list(nltt = c(7.07007326780428,
                                                           8.61917006023791),
                                                    num_spec_error = c(3, 6),
                                                    num_col_error = c(4, 8)),
                 tolerance = 0.2)
    expect_equal(errors$endemic_baseline_error,
                 list(nltt = c(5.64529187233328, 8.71493033138236)),
                 tolerance = 0.2)
    expect_equal(errors$nonendemic_baseline_error,
                 list(nltt = c(6.08044107830265, 2.46799768931924)),
                 tolerance = 0.2)
    expect_equal(errors$error_metrics,
                 list(num_spec_mean_diff = 1.5,
                      num_spec_sd_diff = 2.12132034355964,
                      num_col_mean_diff = 2.5,
                      num_col_sd_diff = 0.707106781186548,
                      spec_nltt_mean_diff = 52.6305561742601,
                      endemic_nltt_mean_diff = 57.7846978860413,
                      nonendemic_nltt_mean_diff = 3.53815708730025,
                      spec_nltt_sd_diff = 9.65517603435626,
                      endemic_nltt_sd_diff = 0.0523348020541872,
                      nonendemic_nltt_sd_diff = 3.68284485227723,
                      spec_nltt_ks_dist = 0.0134823709734259,
                      endemic_nltt_ks_dist = 0.0947823929485676,
                      nonendemic_nltt_ks_dist = 0.0709766025852058),
                 tolerance = 0.2)
    expect_length(errors$novel_sim, 2)
    expect_length(errors$novel_sim[[1]][[1]], 17)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$not_present, 984)
    expect_equal(nrow(errors$novel_sim[[1]][[1]][[1]]$stt_all), 145)
    expect_equal(ncol(errors$novel_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.35806032940744997))
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$novel_sim[[2]][[1]], 20)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$not_present, 981)
    expect_equal(nrow(errors$novel_sim[[2]][[1]][[1]]$stt_all), 181)
    expect_equal(ncol(errors$novel_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.94633029917393996))
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$novel_ml,
                 list(data.frame("lambda_c" = 0.404207964874951,
                                 "mu" = 0.424505994047247,
                                 "K" = 3.5945530628872,
                                 "gamma" = 0.0093059654302906,
                                 "lambda_a" = 0.588978126473833,
                                 "loglik" = -116.575381396798,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.124055846117548,
                                 "mu" = 1.18542919047133e-06,
                                 "K" = 4.60184909129785,
                                 "gamma" = 0.00745540831037194,
                                 "lambda_a" = 3.92179971243802,
                                 "loglik" = -131.085927847614,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
    # oceanic_sim_1 reference
    expect_length(errors$oceanic_sim_1, 2)
    expect_length(errors$oceanic_sim_1[[1]][[1]], 19)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$not_present, 982)
    expect_equal(nrow(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 57)
    expect_equal(ncol(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 1.7544713646484400))
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$oceanic_sim_1[[2]][[1]], 25)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$not_present, 976)
    expect_equal(nrow(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 50)
    expect_equal(ncol(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.81414019300293, 0.76025389622326))
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
    # oceanic_sim_2 reference
    expect_length(errors$oceanic_sim_2, 2)
    expect_length(errors$oceanic_sim_2[[1]][[1]], 23)
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[1]]$not_present, 978)
    expect_equal(nrow(errors$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 71)
    expect_equal(ncol(errors$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.0384183984947399))
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$oceanic_sim_2[[2]][[1]], 33)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[1]]$not_present, 968)
    expect_equal(nrow(errors$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 75)
    expect_equal(ncol(errors$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.41121831296916))
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$sim_constraints, TRUE)
    expect_equal(errors$ml_constraints, TRUE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it fails sim_constraints", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    errors <- run_robustness(
      param_space_name = "nonoceanic",
      param_set = 195,
      replicates = 2,
      save_output = FALSE)
    expect_length(errors, 2)
    expect_false(errors$sim_constraints)
    expect_length(errors$novel_sim, 2)
    expect_length(errors$novel_sim[[1]][[1]], 15)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$island_age, 6.15)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$not_present, 986)
    expect_equal(nrow(errors$novel_sim[[1]][[1]][[1]]$stt_all), 325)
    expect_equal(ncol(errors$novel_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$branching_times,
                 c(6.15, 0.68784460201859099))
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$novel_sim[[2]][[1]], 9)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$island_age, 6.15)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$not_present, 992)
    expect_equal(nrow(errors$novel_sim[[2]][[1]][[1]]$stt_all), 348)
    expect_equal(ncol(errors$novel_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$branching_times,
                 c(6.15, 3.2808837514263902))
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it fails ml_constraints", {
  skip("Need to find a param_set that fails ml_constraints")
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    errors <- run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 10,
      replicates = 2,
      save_output = FALSE)
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
