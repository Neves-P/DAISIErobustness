test_that("run_robustness output is correct when save_output = FALSE", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

      errors <- run_robustness(
        param_space_name = "nonoceanic",
        param_set = 2,
        replicates = 2,
        save_output = FALSE,
        test = TRUE)

      expect_length(errors, 20)
      expect_equal(errors$spec_nltt_error,
                   c(15.52582643203648, 15.99564455288479)
      )
      expect_equal(errors$num_spec_error, c(1, 1))
      expect_equal(errors$num_col_error, c(0, 4))
      expect_equal(errors$endemic_nltt_error, c(17.09946643054420,
                                                11.37876544948862))
      expect_equal(errors$nonendemic_nltt_error, c(6.465348879159919,
                                                   6.461890657081636))
      expect_equal(errors$spec_baseline_nltt_error, c(12.30484116611210,
                                                      15.50883054992463))
      expect_equal(errors$num_spec_baseline_error, c(11, 11))
      expect_equal(errors$num_col_baseline_error, c(9, 9))
      expect_equal(errors$endemic_baseline_nltt_error, c(8.731882753827461,
                                                         11.716863799924219))
      expect_equal(errors$nonendemic_baseline_nltt_error, c(6.228061578173801,
                                                            17.135801431736716))
      expect_equal(errors$error_metrics,
                   list(num_spec_mean_diff = 10,
                        num_spec_sd_diff = 0,
                        num_col_mean_diff = 7,
                        num_col_sd_diff = 2.82842712474619,
                        spec_nltt_mean_diff = 1.853899634442268,
                        endemic_nltt_mean_diff = 4.01474266314057,
                        nonendemic_nltt_mean_diff = 5.218311736834481,
                        spec_nltt_sd_diff = 1.93335104096739,
                        endemic_nltt_sd_diff = 1.934446117436603,
                        nonendemic_nltt_sd_diff = 7.710491485590693))
      expect_length(errors$passed_novel_sims, 2)
      expect_length(errors$passed_novel_sims[[1]][[1]], 25)
      expect_equal(errors$passed_novel_sims[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_novel_sims[[1]][[1]][[1]]$not_present, 976)
      expect_equal(nrow(errors$passed_novel_sims[[1]][[1]][[1]]$stt_all), 120)
      expect_equal(ncol(errors$passed_novel_sims[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$passed_novel_sims[[1]][[1]][[2]]$branching_times,
                   c(2.55,
                     1.02163553349673997,
                     0.37188819214780000,
                     0.18270240256150000,
                     0.11913435616494999))
      expect_equal(errors$passed_novel_sims[[1]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_novel_sims[[1]][[1]][[2]]$missing_species, 0)
      expect_length(errors$passed_novel_sims[[2]][[1]], 30)
      expect_equal(errors$passed_novel_sims[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_novel_sims[[2]][[1]][[1]]$not_present, 971)
      expect_equal(nrow(errors$passed_novel_sims[[2]][[1]][[1]]$stt_all), 138)
      expect_equal(ncol(errors$passed_novel_sims[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$passed_novel_sims[[2]][[1]][[2]]$branching_times,
                   c(2.55, 0.43385268494715))
      expect_equal(errors$passed_novel_sims[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_novel_sims[[2]][[1]][[2]]$missing_species, 0)
      expect_length(errors$failed_novel_sims, 0)
      expect_equal(errors$passed_novel_mls,
                   list(data.frame("lambda_c" = 0.8812744279777417,
                                   "mu" = 0.3137905075456297,
                                   "K" = 13.9158426095739,
                                   "gamma" = 0.01193531780123828,
                                   "lambda_a" = 0.6930438468036783,
                                   "loglik" = -192.0244090973387,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 0.5802135954753809,
                                   "mu" = 7.694325106776144e-07,
                                   "K" = 10.74620717992655,
                                   "gamma" = 0.01184340530972317,
                                   "lambda_a" = 1.375357558403272,
                                   "loglik" = -223.2290502084475,
                                   "df" = 5,
                                   "conv" = 0)))
      # passed_oceanic_sims_1 reference
      expect_length(errors$passed_oceanic_sims_1, 2)
      expect_length(errors$passed_oceanic_sims_1[[1]][[1]], 25)
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$not_present, 976)
      expect_equal(
        nrow(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$stt_all), 112
      )
      expect_equal(ncol(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_1[[1]][[1]][[2]]$branching_times,
        c(2.5499999999999998,
          1.9116558040435101,
          1.6268894135445500,
          1.3159283264455499,
          0.6137777533990501,
          0.5397077477001100)
      )
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[2]]$missing_species,
                   0)
      expect_length(errors$passed_oceanic_sims_1[[2]][[1]], 34)
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$not_present, 967)
      expect_equal(nrow(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$stt_all),
                   77)
      expect_equal(ncol(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_1[[2]][[1]][[2]]$branching_times,
        c(2.55000000000000,
          1.46589497542163,
          1.07228863006643,
          1.01319519594910,
          0.71843448339137,
          0.34854497136888)
      )
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[2]]$missing_species,
                   0)

      # passed_oceanic_sims_2 reference
      expect_length(errors$passed_oceanic_sims_2, 2)
      expect_length(errors$passed_oceanic_sims_2[[1]][[1]], 34)
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$not_present, 967)
      expect_equal(
        nrow(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$stt_all), 122
      )
      expect_equal(ncol(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_2[[1]][[1]][[2]]$branching_times,
        c(2.55, 1.96962636045154)
      )
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[2]]$stac, 4)
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[2]]$missing_species,
                   0)
      expect_length(errors$passed_oceanic_sims_2[[2]][[1]], 43)
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$not_present, 958)
      expect_equal(nrow(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$stt_all),
                   120)
      expect_equal(ncol(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_2[[2]][[1]][[2]]$branching_times,
        c(2.55,
          0.74439313302727,
          0.56222651719687)
      )
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[2]]$missing_species,
                   0)

      # Failed oceanic_sims
      expect_length(errors$failed_oceanic_sims, 0)

      # Reference passed_oceanic_ml
      expect_length(errors$passed_oceanic_ml, 2)
      expect_equal(errors$passed_oceanic_ml,
                   list(data.frame("lambda_c" = 1.046302248572556,
                                   "mu" = 0.4421239288337835,
                                   "K" = 12.45447731091126,
                                   "gamma" = 0.01287987358173419,
                                   "lambda_a" = 0.301296283432853,
                                   "loglik" = -189.6491818617442,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 0.7779257403290123,
                                   "mu" = 0.2261367266026388,
                                   "K" = 5.749651007077706,
                                   "gamma" = 0.01572796534618783,
                                   "lambda_a" = 0.7026894854238971,
                                   "loglik" = -230.8649755264762,
                                   "df" = 5,
                                   "conv" = 0)))
      expect_length(errors$failed_oceanic_mls, 0)

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
    param_space_name = "nonoceanic_land_bridge",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "trait_CES",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "trait_CES",
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
    param_space_name = "trait_CES",
    param_set = 1,
    replicates = 0))
})
