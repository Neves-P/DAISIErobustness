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

    expect_length(errors, 15)
    expect_equal(errors$spec_error, list(nltt = c(71.910805073082173,
                                                    100.708372820776702),
                                           num_spec_error = c(4, 17),
                                           num_col_error = c(11, 1)),
                 tolerance = 0.2)
    expect_equal(errors$endemic_error, list(nltt = c(82.303410951901256,
                                                       112.880392818994778)),
                 tolerance = 0.2)
    expect_equal(errors$nonendemic_error, list(nltt = c(12.380230664767586,
                                                          14.774476655652149)),
                 tolerance = 0.5)
    expect_equal(errors$spec_baseline_error, list(nltt = c(5.3710716544601240,
                                                             6.9716217422051763),
                                                    num_spec_error = c(4, 5),
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
                      nonendemic_nltt_sd_diff = 0.70548324858401434,
                      spec_nltt_ks_dist = 0.025228299186023484,
                      endemic_nltt_ks_dist = 0.20545866555305919,
                      nonendemic_nltt_ks_dist = 0.054478560214712035),
                 tolerance = 0.2)
    expect_length(errors$novel_sim, 2)
    expect_length(errors$novel_sim[[1]][[1]], 33)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$not_present, 968)
    expect_equal(nrow(errors$novel_sim[[1]][[1]][[1]]$stt_all), 161)
    expect_equal(ncol(errors$novel_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 2.55))
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$stac, 2)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$novel_sim[[2]][[1]], 37)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$not_present, 964)
    expect_equal(nrow(errors$novel_sim[[2]][[1]][[1]]$stt_all), 190)
    expect_equal(ncol(errors$novel_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 2.55))
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$novel_ml,
                 list(data.frame("lambda_c" = 0.30467936074202134,
                                 "mu" = 2.4981565432527827e-08,
                                 "K" = 3.2274103544130068,
                                 "gamma" = 0.012548744402927305,
                                 "lambda_a" = 1.1734744959585373,
                                 "loglik" = -229.70545640640151,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.30211546717296933,
                                 "mu" = 1.5251216253265062e-13,
                                 "K" = 6.5496585833354759,
                                 "gamma" = 0.014117647886421657,
                                 "lambda_a" = 1.237666715904699,
                                 "loglik" = -260.14046356512824,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
    # oceanic_sim_1 reference
    expect_length(errors$oceanic_sim_1, 2)
    expect_length(errors$oceanic_sim_1[[1]][[1]], 44)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$not_present, 957)
    expect_equal(nrow(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 81)
    expect_equal(ncol(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.80610633813919996))
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$stac, 2)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$oceanic_sim_1[[2]][[1]], 36)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$not_present, 965)
    expect_equal(nrow(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 71)
    expect_equal(ncol(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.65644916628558003, 0.44149275753137002))
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
    # oceanic_sim_2 reference
    expect_length(errors$oceanic_sim_2, 2)
    expect_length(errors$oceanic_sim_2[[1]][[1]], 45)
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[1]]$not_present, 956)
    expect_equal(nrow(errors$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 80)
    expect_equal(ncol(errors$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                 c(2.55, 2.3657408958238300))
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$stac, 2)
    expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$oceanic_sim_2[[2]][[1]], 47)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[1]]$not_present, 954)
    expect_equal(nrow(errors$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 75)
    expect_equal(ncol(errors$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.63156195888175004))
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$stac, 4)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$sim_constraints, TRUE)
    expect_equal(errors$ml_constraints, TRUE)

  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it fails sim_constraints", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    errors <- run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 1,
      replicates = 2,
      save_output = FALSE)
    expect_length(errors, 2)
    expect_false(errors$sim_constraints)
    expect_length(errors$novel_sim, 2)
    expect_length(errors$novel_sim[[1]][[1]], 105)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$not_present, 896)
    expect_equal(nrow(errors$novel_sim[[1]][[1]][[1]]$stt_all), 315)
    expect_equal(ncol(errors$novel_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.38367935319962998))
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$novel_sim[[2]][[1]], 96)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$not_present, 905)
    expect_equal(nrow(errors$novel_sim[[2]][[1]][[1]]$stt_all), 290)
    expect_equal(ncol(errors$novel_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.13779792541013999))
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$stac, 4)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run_robustness output is correct when save_output = FALSE and
          it fails ml_constraints", {
  skip("skip to pass build")
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
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
