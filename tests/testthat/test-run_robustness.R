context("run_robustness")


test_that("run_robustness output is correct when save_output = FALSE and
          it passes sim_constraints (does not run on APPVEYOR due to
          time limit)", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    errors <- run_robustness(
      param_space_name = "nonoceanic",
      param_set = 1,
      replicates = 2,
      save_output = FALSE)
    expect_length(errors, 12)
    expect_equal(errors$spec_error, list(nltt = c(71.030799425225112,
                                                  101.500940257229004),
                                         num_spec_error = c(3, 17),
                                         num_col_error = c(11, 1)),
                 tolerance = 0.2)
    expect_equal(errors$endemic_error, list(nltt = c(82.303410951901256,
                                                     112.880392818994778)),
                 tolerance = 0.2)
    expect_equal(errors$nonendemic_error, list(nltt = c(12.380230664767586,
                                                        14.774476655652149)),
                 tolerance = 0.5)
    expect_equal(errors$spec_baseline_error, list(nltt = c(5.920816293998610,
                                                           7.6302788732376241),
                                                  num_spec_error = c(2, 4),
                                                  num_col_error = c(1, 11)),
                 tolerance = 0.2)
    expect_equal(errors$endemic_baseline_error,
                 list(nltt = c(6.8004093247947388, 4.0432906251505649)),
                 tolerance = 0.2)
    expect_equal(errors$nonendemic_baseline_error,
                 list(nltt = c(8.2947807823431976, 7.9569630701904321)),
                 tolerance = 0.2)
    expect_equal(errors$error_metrics,
                 list(num_spec_mean_diff = 7,
                      num_spec_sd_diff = 8.4852813742385695,
                      num_col_mean_diff = 0,
                      num_col_sd_diff = 0,
                      spec_nltt_mean_diff = 79.490322257608938,
                      endemic_nltt_mean_diff = 92.170051910475365,
                      nonendemic_nltt_mean_diff = 5.4514817339430532,
                      spec_nltt_sd_diff = 20.336870624054512,
                      endemic_nltt_sd_diff = 19.671613897385299,
                      nonendemic_nltt_sd_diff = 1.4541143809150341,
                      spec_nltt_ks_dist = 0.025228299186023484,
                      endemic_nltt_ks_dist = 0.20545866555305919,
                      nonendemic_nltt_ks_dist = 0.054478560214712035),
                 tolerance = 0.2)
    expect_length(errors$geodynamic_sim, 2)
    expect_length(errors$geodynamic_sim[[1]][[1]], 33)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[1]]$not_present, 968)
    expect_equal(nrow(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 161)
    expect_equal(ncol(errors$geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 2.55))
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$stac, 2)
    expect_equal(errors$geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$geodynamic_sim[[2]][[1]], 37)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[1]]$not_present, 964)
    expect_equal(nrow(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 190)
    expect_equal(ncol(errors$geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 2.55))
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$geodynamic_ml,
                 list(c("lambda_c" = 3.0469458306664360e-01,
                        "mu" = 9.8884493328196801e-08,
                        "K" = 3.7470275691742216e+00,
                        "gamma" = 1.2549216297316085e-02,
                        "lambda_a" = 1.1732912066401813e+00,
                        "loglik" = -2.2970545686614952e+02,
                        "df" = 5,
                        "conv" = 0),
                      c("lambda_c" = 3.0214183518884752e-01,
                        "mu" = 1.3919463526006242e-09,
                        "K" = 5.1567844821041318e+00,
                        "gamma" = 1.4110245018677369e-02,
                        "lambda_a" = 1.2377028184782040e+00,
                        "loglik" = -2.6014047327536701e+02,
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
