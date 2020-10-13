context("run_analysis")

test_that("run full function", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 2
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
    param_space <- load_param_space(
      param_space_name = param_space_name)

    sim_pars <- extract_param_set(
      param_space_name = param_space_name,
      param_space = param_space,
      param_set = param_set)

    novel_sim <- run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )

    novel_ml <- run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars,
      distance_method = "abs"
    )

    expect_length(novel_ml, 14)
    expect_equal(novel_ml$spec_error, list(nltt = c(19.56066177046598,
                                                    20.62803757920803),
                                         num_spec_error = c(6, 2),
                                         num_col_error = c(7, 4)))
    expect_equal(novel_ml$endemic_error, list(nltt = c(26.58818868556481,
                                                       27.15731277537603)))
    expect_equal(novel_ml$nonendemic_error, list(nltt = c(10.488444003536307,
                                                          6.986535669285867)))
    expect_equal(novel_ml$spec_baseline_error, list(
      nltt = c(5.669822544410627,
               5.513043923340234),
      num_spec_error = c(1, 9),
      num_col_error = c(1, 13)))
    expect_equal(novel_ml$endemic_baseline_error,
                 list(nltt = c(7.419845462041067, 4.392692416339733)))
    expect_equal(novel_ml$nonendemic_baseline_error,
                 list(nltt = c(6.353891433570178, 4.432341543995483)))
    expect_equal(novel_ml$error_metrics,
                 list(num_spec_mean_diff = 1,
                      num_spec_sd_diff = 2.82842712474619,
                      num_col_mean_diff = 1.5,
                      num_col_sd_diff = 6.363961030678928,
                      spec_nltt_mean_diff = 14.50291644096157,
                      endemic_nltt_mean_diff = 20.96648179128002,
                      nonendemic_nltt_mean_diff = 3.344373347628256,
                      spec_nltt_sd_diff = 0.6438894463320254,
                      endemic_nltt_sd_diff = 1.738088943062793,
                      nonendemic_nltt_sd_diff = 1.117482172935644))
    expect_equal(novel_ml$novel_ml,
                 list(data.frame("lambda_c" = 0.8236330150593614,
                                 "mu" = 0.2214781714472619,
                                 "K" = 13.59983211441053,
                                 "gamma" = 0.0106794766544443,
                                 "lambda_a" = 0.6987602100153518,
                                 "loglik" = -187.8997920405084,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.803466328939126,
                                 "mu" = 2.001682354626096e-07,
                                 "K" = 9.091822417681556,
                                 "gamma" = 0.009827314785672257,
                                 "lambda_a" = 0.9568454404341787,
                                 "loglik" = -200.1698472949494,
                                 "df" = 5,
                                 "conv" = 0)))
    # oceanic_sim_1 reference
    expect_length(novel_ml$oceanic_sim_1, 2)
    expect_length(novel_ml$oceanic_sim_1[[1]][[1]], 31)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$not_present, 970)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 105)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 2.34337661579997))
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_1[[2]][[1]], 30)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$not_present, 971)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 78)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55000000000000, 0.82320728572358))
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
    # oceanic_sim_2 reference
    expect_length(novel_ml$oceanic_sim_2, 2)
    expect_length(novel_ml$oceanic_sim_2[[1]][[1]], 32)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$not_present, 969)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 74)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                 c(2.54999999999999982, 0.87069341955535))
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_2[[2]][[1]], 43)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$not_present, 958)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 94)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                 c(2.55,
                   0.59640943885209,
                   0.16582137166132))
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("abuse", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )

    param_space <- load_param_space(
      param_space_name = param_space_name)

    sim_pars <- extract_param_set(
      param_space_name = param_space_name,
      param_space = param_space,
      param_set = param_set)

    novel_sim <- run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )

    expect_error(
      novel_ml <- run_analysis(
        novel_sim = "nonsense",
        param_space_name = param_space_name,
        replicates = replicates,
        sim_pars = sim_pars,
        distance_method = "abs"
      )
    )
    expect_error(
      novel_ml <- run_analysis(
        novel_sim = novel_sim,
        param_space_name = 123,
        replicates = replicates,
        sim_pars = sim_pars,
        distance_method = "abs"
      )
    )
    expect_error(
      novel_ml <- run_analysis(
        novel_sim = novel_sim,
        param_space_name = param_space_name,
        replicates = "nonsense",
        sim_pars = sim_pars,
        distance_method = "abs"
      )
    )
    expect_error(
      novel_ml <- run_analysis(
        novel_sim = novel_sim,
        param_space_name = param_space_name,
        replicates = replicates,
        sim_pars = "nonsense",
        distance_method = "abs"
      )
    )
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("ml constraints fail", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
    param_space <- load_param_space(
      param_space_name = param_space_name)

    sim_pars <- extract_param_set(
      param_space_name = param_space_name,
      param_space = param_space,
      param_set = param_set)

    novel_sim <- run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )

    novel_ml <- run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars,
      distance_method = "abs"
    )

    expect_length(novel_ml, 14)
    expect_equal(novel_ml$spec_error, list(nltt = c(27.679341973678902,
                                                    13.671071163292904),
                                           num_spec_error = c(7, 5),
                                           num_col_error = c(5, 8)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_error, list(nltt = c(29.5263638870720300,
                                                       9.8948020034543731)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_error, list(nltt = c(5.460350721359557,
                                                          12.006277962756112)),
                 tolerance = 0.5)
    expect_equal(novel_ml$novel_ml,
                 list(data.frame("lambda_c" = 0.23906010636220965,
                                 "mu" = 0.24356250268081175,
                                 "K" = 140931.62687892388,
                                 "gamma" = 0.0090833815090014831,
                                 "lambda_a" = 0.73863832059330292,
                                 "loglik" = -125.64119535986262,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.24439860873663627,
                                 "mu" = 0.42644609536595218,
                                 "K" = 1576714.5654084363,
                                 "gamma" = 0.012694373614231853,
                                 "lambda_a" = 0.85985993559493179,
                                 "loglik" = -147.5290381584779,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
    # oceanic_sim_1 reference
    expect_length(novel_ml$oceanic_sim_1, 2)
    expect_length(novel_ml$oceanic_sim_1[[1]][[1]], 14)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$not_present, 987)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 35)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 1.1348308126515900))
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_1[[2]][[1]], 30)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$not_present, 971)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 95)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55000000000000, 1.8707119204798599))
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
