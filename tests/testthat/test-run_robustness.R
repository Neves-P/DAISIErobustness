context("run_robustness")


test_that("run_robustness output is correct when save_output = FALSE and
          it passes sim_constraints", {
    if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
        Sys.getenv("APPVEYOR") != "") {
      errors <- run_robustness(
        param_space_name = "nonoceanic",
        param_set = 1,
        replicates = 2,
        save_output = FALSE)

      expect_length(errors, 16)
      expect_equal(errors$spec_error, list(nltt = c(25.515372113927832,
                                                    17.316937448436175),
                                           num_spec_error = c(4, 6),
                                           num_col_error = c(3, 10)),
                   tolerance = 0.2)
      expect_equal(errors$endemic_error, list(nltt = c(27.781149320114856,
                                                       10.441288792652346)),
                   tolerance = 0.2)
      expect_equal(errors$nonendemic_error, list(nltt = c(12.22276273470610,
                                                          3.40199020751629)),
                   tolerance = 0.2)
      expect_equal(errors$spec_baseline_error, list(nltt = c(6.2306180560764322,
                                                             12.0647872734570285),
                                                    num_spec_error = c(0, 6),
                                                    num_col_error = c(4, 7)),
                   tolerance = 0.2)
      expect_equal(errors$endemic_baseline_error,
                   list(nltt = c(3.1439813769708422, 3.5658758943827520)),
                   tolerance = 0.2)
      expect_equal(errors$nonendemic_baseline_error,
                   list(nltt = c(5.7447802246984843, 11.5124077405201994)),
                   tolerance = 0.2)
      expect_equal(errors$error_metrics,
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
      expect_equal(errors$novel_ml,
                   list(data.frame("lambda_c" = 0.23912273801051481,
                                   "mu" = 0.24385478076483247 ,
                                   "K" = 2.7934254388614228,
                                   "gamma" = 0.0090869116405250423,
                                   "lambda_a" = 0.73853172597597438,
                                   "loglik" = -125.64128155272468,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 0.24420632616026083,
                                   "mu" = 0.42524208522712609,
                                   "K" = 1.2231040909412574 ,
                                   "gamma" = 0.012675787360822477,
                                   "lambda_a" = 0.8599879726471561,
                                   "loglik" = -147.52903816158667,
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
              expect_length(errors$novel_sim[[1]][[1]], 17)
              expect_equal(errors$novel_sim[[1]][[1]][[1]]$island_age, 6.15)
              expect_equal(errors$novel_sim[[1]][[1]][[1]]$not_present, 984)
              expect_equal(nrow(errors$novel_sim[[1]][[1]][[1]]$stt_all), 196)
              expect_equal(ncol(errors$novel_sim[[1]][[1]][[1]]$stt_all), 5)
              expect_equal(errors$novel_sim[[1]][[1]][[2]]$branching_times,
                           c(6.15, 0.68784460201859099))
              expect_equal(errors$novel_sim[[1]][[1]][[2]]$stac, 4)
              expect_equal(errors$novel_sim[[1]][[1]][[2]]$missing_species, 0)
              expect_length(errors$novel_sim[[2]][[1]], 11)
              expect_equal(errors$novel_sim[[2]][[1]][[1]]$island_age, 6.15)
              expect_equal(errors$novel_sim[[2]][[1]][[1]]$not_present, 990)
              expect_equal(nrow(errors$novel_sim[[2]][[1]][[1]]$stt_all), 249)
              expect_equal(ncol(errors$novel_sim[[2]][[1]][[1]]$stt_all), 5)
              expect_equal(errors$novel_sim[[2]][[1]][[2]]$branching_times,
                           c(6.15, 0.82445054549913, 0.75623539857472))
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

test_that("run pipeline = analysis", {
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

    robustness_output <- run_robustness(
      param_space_name = param_space_name,
      param_set = param_set,
      replicates = replicates,
      pipeline = "analysis",
      novel_sim = novel_sim,
      load_from_file = FALSE,
      save_output = FALSE
    )

    expect_false(robustness_output$sim_constraints)
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
