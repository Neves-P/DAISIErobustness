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

    expect_length(novel_ml, 15)
    expect_equal(novel_ml$spec_error, list(nltt = c(15.504723366971781,
                                                    20.628037579208026),
                                         num_spec_error = c(8, 2),
                                         num_col_error = c(7, 4)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_error, list(nltt = c(22.500522744548768,
                                                       27.157312775376028)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_error, list(nltt = c(10.4364121173104927,
                                                          6.9865356692858667)),
                 tolerance = 0.2)
    expect_equal(novel_ml$spec_baseline_error, list(
      nltt = c(22.2979430235588900,
               3.9836578128417264),
      num_spec_error = c(7, 2),
      num_col_error = c(1, 7)),
      tolerance = 0.2)
    expect_equal(novel_ml$endemic_baseline_error,
                 list(nltt = c(18.9807768208321477, 4.6650692726446508)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_baseline_error,
                 list(nltt = c(6.2852874607336569, 3.6480235281355120)),
                 tolerance = 0.2)
    expect_equal(novel_ml$error_metrics,
                 list(num_spec_mean_diff = 0.5,
                      num_spec_sd_diff = 0.70710678118654702,
                      num_col_mean_diff = 1.5,
                      num_col_sd_diff = 2.1213203435596424,
                      spec_nltt_mean_diff = 4.9255800548895952,
                      endemic_nltt_mean_diff = 13.005994713223998,
                      nonendemic_nltt_mean_diff = 3.7448183988635959,
                      spec_nltt_sd_diff = 9.3274250434609414,
                      endemic_nltt_sd_diff = 6.8298860754469564,
                      nonendemic_nltt_sd_diff = 0.5746038201351229),
                 tolerance = 0.2)
    expect_equal(novel_ml$novel_ml,
                 list(data.frame("lambda_c" = 0.80346632893912595,
                                 "mu" = 0.31150272931213729,
                                 "K" = 13.836817739664562,
                                 "gamma" = 0.011864165365333107,
                                 "lambda_a" = 0.70146033703308563,
                                 "loglik" = -192.12110941516548,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.80346632893912595,
                                 "mu" = 2.0016823546260964e-07,
                                 "K" = 9.0918224176815556,
                                 "gamma" = 0.0098273147856722566,
                                 "lambda_a" = 0.95684544043417874,
                                 "loglik" = -200.16984755974138,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
    # oceanic_sim_1 reference
    expect_length(novel_ml$oceanic_sim_1, 2)
    expect_length(novel_ml$oceanic_sim_1[[1]][[1]], 32)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$not_present, 969)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 118)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.041887456565899803))
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_1[[2]][[1]], 30)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$not_present, 971)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 78)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55000000000000, 0.82320728572358004))
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
    # oceanic_sim_2 reference
    expect_length(novel_ml$oceanic_sim_2, 2)
    expect_length(novel_ml$oceanic_sim_2[[1]][[1]], 33)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$not_present, 968)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 141)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.230393226905480003, 0.058048560603529697))
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_2[[2]][[1]], 37)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$not_present, 964)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 83)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                 c(2.55,
                   0.432405070355510013,
                   0.261396415512720026,
                   0.065332249010409807), tolerance = 0.001)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("run failed sim_constraints", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin"
      || Sys.getenv("APPVEYOR") != "") {
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

    expect_false(novel_ml$sim_constraints)
  } else {
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

    expect_length(novel_ml, 10)
    expect_equal(novel_ml$spec_error, list(nltt = c(27.672866899993707,
                                                    13.658638064673603),
                                           num_spec_error = c(7, 4),
                                           num_col_error = c(5, 8)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_error, list(nltt = c(29.5228064145322051,
                                                       9.8975411551966825)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_error, list(nltt = c(5.4611491100033316,
                                                          11.9934047964984707)),
                 tolerance = 0.5)
    expect_equal(novel_ml$novel_ml,
                 list(data.frame("lambda_c" = 0.2391080686600785,
                                 "mu" = 0.24376346547628622,
                                 "K" = 1373703.6829030684,
                                 "gamma" = 0.0090861265426438378,
                                 "lambda_a" = 0.73849953019711867,
                                 "loglik" = -125.64128158907532,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.24432201256427705,
                                 "mu" = 0.42565033735003227,
                                 "K" = 5746852.9702726277,
                                 "gamma" = 0.012682615307086051,
                                 "lambda_a" = 0.85982749644033374,
                                 "loglik" = -147.52903937918407,
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
                 c(2.55, 1.1352583531453999))
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_1[[2]][[1]], 30)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$not_present, 971)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 94)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55000000000000, 1.8700821388704600))
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
