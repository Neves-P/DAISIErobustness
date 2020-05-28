context("run_analysis")

test_that("run full function", {
  if (Sys.getenv("TRAVIS") != "") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 27
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
    expect_equal(novel_ml$spec_error, list(nltt = c(52.866483034693012,
                                                    69.540606539802951),
                                         num_spec_error = c(3, 1),
                                         num_col_error = c(2, 5)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_error, list(nltt = c(63.393615988617832,
                                                       68.125250812847412)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_error, list(nltt = c(12.2303012183021149,
                                                          3.3945808663611126)),
                 tolerance = 0.5)
    expect_equal(novel_ml$spec_baseline_error, list(nltt = c(4.981983364697995,
                                                            12.374282921452831),
                                                  num_spec_error = c(2, 9),
                                                  num_col_error = c(0, 9)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_baseline_error,
                 list(nltt = c(3.5510782437365402, 12.4570074504115578)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_baseline_error,
                 list(nltt = c(6.0765231591715274, 2.3692779045604966)),
                 tolerance = 0.2)
    expect_equal(novel_ml$error_metrics,
                 list(num_spec_mean_diff = 3.5,
                      num_spec_sd_diff = 3.5355339059327378,
                      num_col_mean_diff = 1,
                      num_col_sd_diff = 4.2426406871192857,
                      spec_nltt_mean_diff = 52.525411644172564,
                      endemic_nltt_mean_diff = 57.755390553658572,
                      nonendemic_nltt_mean_diff = 3.5895405104656017,
                      spec_nltt_sd_diff = 6.5632406556615885,
                      endemic_nltt_sd_diff = 2.9516718644960802,
                      nonendemic_nltt_sd_diff = 3.626379518468362,
                      spec_nltt_ks_dist = 0.14484835097749771,
                      endemic_nltt_ks_dist = 0.2601812869384717,
                      nonendemic_nltt_ks_dist = 0.063272501102437095),
                 tolerance = 0.2)
    expect_equal(novel_ml$novel_ml,
                 list(data.frame("lambda_c" = 0.40420796487495131,
                                 "mu" = 0.42450599404724676,
                                 "K" = 3.5597140691362381,
                                 "gamma" = 0.0093059654302905977,
                                 "lambda_a" = 0.58897812647383263,
                                 "loglik" = -116.57538139679836,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.12405002787003723,
                                 "mu" = 7.2877431788514479e-07,
                                 "K" = 1.8202454094852671,
                                 "gamma" = 0.007452604853362116,
                                 "lambda_a" = 3.9218128452032133,
                                 "loglik" = -131.08592107486021,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
    # oceanic_sim_1 reference
    expect_length(novel_ml$oceanic_sim_1, 2)
    expect_length(novel_ml$oceanic_sim_1[[1]][[1]], 19)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$not_present, 982)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 57)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 1.7544713646484400))
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_1[[2]][[1]], 25)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$not_present, 976)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 49)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.81386338356854004, 0.24752145307414999))
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
    # oceanic_sim_2 reference
    expect_length(novel_ml$oceanic_sim_2, 2)
    expect_length(novel_ml$oceanic_sim_2[[1]][[1]], 19)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$not_present, 982)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 73)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.039455961768839899))
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_2[[2]][[1]], 34)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$not_present, 967)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 75)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.45635442220773997))
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
  } else{
    skip("Run only on TRAVIS")
  }
})

test_that("run failed sim_constraints", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 195
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

    expect_false(novel_ml$sim_constraints)
  } else {
    skip("Run only on TRAVIS")
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
