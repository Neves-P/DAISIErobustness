context("run_analysis")

test_that("run full function", {
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

    expect_length(novel_ml, 15)
    expect_equal(novel_ml$spec_error, list(nltt = c(25.515372113927832,
                                                    17.316937448436175),
                                         num_spec_error = c(4, 6),
                                         num_col_error = c(3, 10)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_error, list(nltt = c(27.781149320114856,
                                                       10.441288792652346)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_error, list(nltt = c(5.4741610710417001,
                                                          14.1591733521834033)),
                 tolerance = 0.5)
    expect_equal(novel_ml$spec_baseline_error, list(
      nltt = c(6.2306180560764322,
               12.0647872734570285),
      num_spec_error = c(0, 6),
      num_col_error = c(4, 7)),
      tolerance = 0.2)
    expect_equal(novel_ml$endemic_baseline_error,
                 list(nltt = c(3.1439813769708422, 3.5658758943827520)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_baseline_error,
                 list(nltt = c(5.7447802246984843, 11.5124077405201994)),
                 tolerance = 0.2)
    expect_equal(novel_ml$error_metrics,
                 list(num_spec_mean_diff = 2,
                      num_spec_sd_diff = 2.8284271247461898,
                      num_col_mean_diff = 1,
                      num_col_sd_diff = 2.8284271247461903,
                      spec_nltt_mean_diff = 12.268452116415272,
                      endemic_nltt_mean_diff = 15.756290420706803,
                      nonendemic_nltt_mean_diff = 1.1880732290032103,
                      spec_nltt_sd_diff = 1.6717881308843827,
                      endemic_nltt_sd_diff = 11.9628084895903,
                      nonendemic_nltt_sd_diff = 2.0629025508880883),
                 tolerance = 0.2)
    expect_equal(novel_ml$novel_ml,
                 list(data.frame("lambda_c" = 0.23912273801051481,
                                 "mu" = 0.24385478076483247,
                                 "K" = 2.7934254388614228,
                                 "gamma" = 0.0090869116405250423,
                                 "lambda_a" = 0.73853172597597438,
                                 "loglik" = -125.64128155272468,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.24420632616026083,
                                 "mu" = 0.42524208522712609,
                                 "K" = 1.2231040909412574,
                                 "gamma" = 0.012675787360822477,
                                 "lambda_a" = 0.8599879726471561,
                                 "loglik" = -147.52903816158667,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
    # oceanic_sim_1 reference
    expect_length(novel_ml$oceanic_sim_1, 2)
    expect_length(novel_ml$oceanic_sim_1[[1]][[1]], 16)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$not_present, 985)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 35)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 1.1353805850668000))
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_1[[2]][[1]], 32)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$not_present, 969)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 89)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55000000000000, 1.8697158939590199))
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
    # oceanic_sim_2 reference
    expect_length(novel_ml$oceanic_sim_2, 2)
    expect_length(novel_ml$oceanic_sim_2[[1]][[1]], 20)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$not_present, 981)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 50)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.44591226744999002))
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_2[[2]][[1]], 39)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$not_present, 962)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 106)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.80577967734552003))
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
