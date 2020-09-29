context("run_robustness")

test_that("run_robustness output is correct when save_output = FALSE", {
    if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
        Sys.getenv("APPVEYOR") != "") {
      errors <- run_robustness(
        param_space_name = "nonoceanic",
        param_set = 2,
        replicates = 2,
        save_output = FALSE)

      expect_length(errors, 16)
      expect_equal(errors$spec_error, list(nltt = c(15.504723366971781,
                                                    20.628037579208026),
                                           num_spec_error = c(8, 2),
                                           num_col_error = c(7, 4)),
                   tolerance = 0.2)
      expect_equal(errors$endemic_error, list(nltt = c(22.500522744548768,
                                                       27.157312775376028)),
                   tolerance = 0.2)
      expect_equal(errors$nonendemic_error, list(nltt = c(10.4364121173104927,
                                                          6.9865356692858667)),
                   tolerance = 0.2)
      expect_equal(errors$spec_baseline_error, list(
        nltt = c(22.2979430235588900,
                 3.9836578128417264),
        num_spec_error = c(7, 2),
        num_col_error = c(1, 7)),
        tolerance = 0.2
      )
      expect_equal(errors$endemic_baseline_error,
                   list(nltt = c(18.9807768208321477, 4.6650692726446508)),
                   tolerance = 0.2)
      expect_equal(errors$nonendemic_baseline_error,
                   list(nltt = c(6.2852874607336569, 3.6480235281355120)),
                   tolerance = 0.2)
      expect_equal(errors$error_metrics,
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
      expect_length(errors$novel_sim, 2)
      expect_length(errors$novel_sim[[1]][[1]], 25)
      expect_equal(errors$novel_sim[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$novel_sim[[1]][[1]][[1]]$not_present, 976)
      expect_equal(nrow(errors$novel_sim[[1]][[1]][[1]]$stt_all), 120)
      expect_equal(ncol(errors$novel_sim[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$novel_sim[[1]][[1]][[2]]$branching_times,
                   c(2.55,
                     1.02163553349673997,
                     0.37188819214780000,
                     0.18270240256150000,
                     0.11913435616494999))
      expect_equal(errors$novel_sim[[1]][[1]][[2]]$stac, 2)
      expect_equal(errors$novel_sim[[1]][[1]][[2]]$missing_species, 0)
      expect_length(errors$novel_sim[[2]][[1]], 26)
      expect_equal(errors$novel_sim[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$novel_sim[[2]][[1]][[1]]$not_present, 975)
      expect_equal(nrow(errors$novel_sim[[2]][[1]][[1]]$stt_all), 142)
      expect_equal(ncol(errors$novel_sim[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$novel_sim[[2]][[1]][[2]]$branching_times,
                   c(2.55, 0.59116788792787001))
      expect_equal(errors$novel_sim[[2]][[1]][[2]]$stac, 4)
      expect_equal(errors$novel_sim[[2]][[1]][[2]]$missing_species, 0)
      expect_equal(errors$novel_ml,
                   list(data.frame("lambda_c" = 0.88235459277564676,
                                   "mu" = 0.31150272931213729,
                                   "K" = 13.836817739664562,
                                   "gamma" = 0.0098273147856722566,
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
      expect_length(errors$oceanic_sim_1, 2)
      expect_length(errors$oceanic_sim_1[[1]][[1]], 32)
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$not_present, 969)
      expect_equal(nrow(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 118)
      expect_equal(ncol(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                   c(2.55, 0.041908179742209797))
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
      expect_length(errors$oceanic_sim_1[[2]][[1]], 30)
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$not_present, 971)
      expect_equal(nrow(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 78)
      expect_equal(ncol(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                   c(2.55, 0.82320728572358004))
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
      # oceanic_sim_2 reference
      expect_length(errors$oceanic_sim_2, 2)
      expect_length(errors$oceanic_sim_2[[1]][[1]], 31)
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[1]]$not_present, 970)
      expect_equal(nrow(errors$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 139)
      expect_equal(ncol(errors$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                   c(2.55, 0.229137735142440013, 0.056686987265089701))
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$stac, 2)
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
      expect_length(errors$oceanic_sim_2[[2]][[1]], 37)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[1]]$not_present, 964)
      expect_equal(nrow(errors$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 83)
      expect_equal(ncol(errors$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                   c(2.549999999999999822,
                     0.432405070355510013,
                     0.261396415512720026,
                     0.065332249010409807), tolerance = 0.001)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
      expect_equal(errors$ml_constraints, TRUE)
    } else {
      skip("Run only on TRAVIS and AppVeyor")
    }
  })

test_that("run_robustness output is correct when save_output = FALSE and
          it fails ml_constraints", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    skip("ml doesn't fail converge")
    errors <- run_robustness(
      param_space_name = "nonoceanic",
      param_set = 1,
      replicates = 2,
      save_output = FALSE)
    expect_length(errors, 15)
    expect_length(errors$novel_sim, 2)
    expect_length(errors$novel_sim[[1]][[1]], 19)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$novel_sim[[1]][[1]][[1]]$not_present, 982)
    expect_equal(nrow(errors$novel_sim[[1]][[1]][[1]]$stt_all), 83)
    expect_equal(ncol(errors$novel_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.52495868988335004))
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$stac, 2)
    expect_equal(errors$novel_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$novel_sim[[2]][[1]], 22)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$novel_sim[[2]][[1]][[1]]$not_present, 979)
    expect_equal(nrow(errors$novel_sim[[2]][[1]][[1]]$stt_all), 91)
    expect_equal(ncol(errors$novel_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 0.058254267147279701))
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$stac, 4)
    expect_equal(errors$novel_sim[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$novel_ml_1,
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
                                 "conv" = 0)))
    expect_equal(errors$novel_ml_2,
                 list(data.frame("lambda_c" = 0.23926047862671004,
                                 "mu" = 0.24486874138083578,
                                 "K" = 778376.26012957911,
                                 "gamma" = 0.0090979993960109071,
                                 "lambda_a" = 0.73818876385537768,
                                 "loglik" = -125.64120122482315,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.24351970811997409,
                                 "mu" = 0.42076074717687389,
                                 "K" = 15237.879985131629,
                                 "gamma" = 0.012623570860338454,
                                 "lambda_a" = 0.86069809646336259,
                                 "loglik" = -147.52913304146895,
                                 "df" = 5,
                                 "conv" = 0)))
    expect_length(errors$oceanic_sim_1, 2)
    expect_length(errors$oceanic_sim_1[[1]][[1]], 14)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$not_present, 987)
    expect_equal(nrow(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 35)
    expect_equal(ncol(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 1.1348308126515900))
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
    expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(errors$oceanic_sim_1[[2]][[1]], 30)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$not_present, 971)
    expect_equal(nrow(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 95)
    expect_equal(ncol(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.8707119204798599))
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
    expect_equal(errors$oceanic_ml,
                 list(data.frame("lambda_c" = 34613.864171756359,
                                 "mu" = 0.43856923954065968,
                                 "K" = 1.0000094448483547,
                                 "gamma" = 0.0078898881290706963,
                                 "lambda_a" = 0.25292709001102692,
                                 "loglik" = -94.844717038469526,
                                 "df" = 5,
                                 "conv" = 0),
                      "ML didn't converge"))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("run pipeline = analysis", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin"
      || Sys.getenv("APPVEYOR") != "") {
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

    robustness_output <- run_robustness(
      param_space_name = param_space_name,
      param_set = param_set,
      replicates = replicates,
      pipeline = "analysis",
      novel_sim = novel_sim,
      load_from_file = FALSE,
      save_output = FALSE
    )

    expect_equal(robustness_output[[1]],
                 list(nltt = c(15.0535456449, 10.8167874321),
                      num_spec_error = c(0, 8),
                      num_col_error = c(1, 3)))
    expect_equal(robustness_output[[2]],
                 list(nltt = c(20.10011550079, 6.46028418133)))
    expect_equal(robustness_output[[3]],
                 list(nltt = c(5.79354106727, 5.41235833501)))
    expect_equal(robustness_output[[4]],
                 list(nltt = c(3.72638871516, 12.50021786771),
                      num_spec_error = c(0, 10),
                      num_col_error = c(1, 9)))
    expect_equal(robustness_output[[5]],
                 list(nltt = c(2.99517292662, 5.91814693938)))
    expect_equal(robustness_output[[6]],
                 list(nltt = c(4.40207229277, 13.71478256780)))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("run pipeline = novel_sim", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin"
      || Sys.getenv("APPVEYOR") != "") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 195

    robustness_output <- run_robustness(
      param_space_name = param_space_name,
      param_set = param_set,
      replicates = replicates,
      pipeline = "novel_sim",
      load_from_file = FALSE,
      save_output = FALSE
    )

    expect_length(robustness_output, 2)
    expect_length(robustness_output[[1]][[1]], 17)
    expect_equal(robustness_output[[1]][[1]][[1]]$island_age, 6.15)
    expect_equal(robustness_output[[1]][[1]][[1]]$not_present, 984)
    expect_equal(nrow(robustness_output[[1]][[1]][[1]]$stt_all), 196)
    expect_equal(ncol(robustness_output[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(robustness_output[[1]][[1]][[2]]$branching_times,
                 c(6.15, 0.68784460201859099))
    expect_equal(robustness_output[[1]][[1]][[2]]$stac, 4)
    expect_equal(robustness_output[[1]][[1]][[2]]$missing_species, 0)
    expect_length(robustness_output[[2]][[1]], 11)
    expect_equal(robustness_output[[2]][[1]][[1]]$island_age, 6.15)
    expect_equal(robustness_output[[2]][[1]][[1]]$not_present, 990)
    expect_equal(nrow(robustness_output[[2]][[1]][[1]]$stt_all), 249)
    expect_equal(ncol(robustness_output[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(robustness_output[[2]][[1]][[2]]$branching_times,
                 c(6.15, 0.82445054549913, 0.75623539857472))
    expect_equal(robustness_output[[2]][[1]][[2]]$stac, 2)
    expect_equal(robustness_output[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
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

  expect_error(run_robustness(
    param_space_name = "trait",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "trait",
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

  expect_error(run_robustness(
    param_space_name = "trait",
    param_set = 1,
    replicates = 0))
})
