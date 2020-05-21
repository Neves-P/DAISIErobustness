context("run_analysis")

test_that("run full function", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(1)

    param_space <- load_param_space(
      param_space_name = param_space_name)

    sim_pars <- extract_param_set(
      param_space_name = param_space_name,
      param_space = param_space,
      param_set = param_set)

    novel_sim <- DAISIErobustness:::run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )

    novel_ml <- DAISIErobustness:::run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars
    )

    expect_length(novel_ml, 14)
    expect_equal(novel_ml$spec_error, list(nltt = c(71.910805073082173,
                                                  100.708372820776702),
                                         num_spec_error = c(4, 17),
                                         num_col_error = c(11, 1)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_error, list(nltt = c(82.303410951901256,
                                                     112.880392818994778)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_error, list(nltt = c(12.380230664767586,
                                                        14.774476655652149)),
                 tolerance = 0.5)
    expect_equal(novel_ml$spec_baseline_error, list(nltt = c(5.3710716544601240,
                                                           6.9716217422051763),
                                                  num_spec_error = c(4, 5),
                                                  num_col_error = c(1, 11)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_baseline_error,
                 list(nltt = c(6.8004093247947388, 4.0432906251505649)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_baseline_error,
                 list(nltt = c(8.2947807823431976, 7.9569630701904321)),
                 tolerance = 0.2)
    expect_equal(novel_ml$error_metrics,
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
    expect_equal(novel_ml$novel_ml,
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
    expect_length(novel_ml$oceanic_sim_1, 2)
    expect_length(novel_ml$oceanic_sim_1[[1]][[1]], 44)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$not_present, 957)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 81)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.80610633813919996))
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_1[[2]][[1]], 36)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$not_present, 965)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 71)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.65644916628558003, 0.44149275753137002))
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
    # oceanic_sim_2 reference
    expect_length(novel_ml$oceanic_sim_2, 2)
    expect_length(novel_ml$oceanic_sim_2[[1]][[1]], 45)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$not_present, 956)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 80)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                 c(2.55, 2.3657408958238300))
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_2[[2]][[1]], 47)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$not_present, 954)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 75)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.63156195888175004))
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)

  } else{
    skip("Run only on TRAVIS")
  }
})

test_that("run failed sim_constraints", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(1)

    param_space <- load_param_space(
      param_space_name = param_space_name)

    sim_pars <- extract_param_set(
      param_space_name = param_space_name,
      param_space = param_space,
      param_set = param_set)

    novel_sim <- DAISIErobustness:::run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )

    novel_ml <- DAISIErobustness:::run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars
    )
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("abuse", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(1)

    param_space <- load_param_space(
      param_space_name = param_space_name)

    sim_pars <- extract_param_set(
      param_space_name = param_space_name,
      param_space = param_space,
      param_set = param_set)

    novel_sim <- DAISIErobustness:::run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )

    expect_error(
      novel_ml <- DAISIErobustness:::run_analysis(
        novel_sim = "nonsense",
        param_space_name = param_space_name,
        replicates = replicates,
        sim_pars = sim_pars
      )
    )
    expect_error(
      novel_ml <- DAISIErobustness:::run_analysis(
        novel_sim = novel_sim,
        param_space_name = 123,
        replicates = replicates,
        sim_pars = sim_pars
      )
    )
    expect_error(
      novel_ml <- DAISIErobustness:::run_analysis(
        novel_sim = novel_sim,
        param_space_name = param_space_name,
        replicates = "nonsense",
        sim_pars = sim_pars
      )
    )
    expect_error(
      novel_ml <- DAISIErobustness:::run_analysis(
        novel_sim = novel_sim,
        param_space_name = param_space_name,
        replicates = replicates,
        sim_pars = "nonsense"
      )
    )
  } else {
    skip("Run only on TRAVIS")
  }
})
