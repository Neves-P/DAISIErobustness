test_that("run_robustness output is correct when save_output = FALSE", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

      errors <- run_robustness(
        param_space_name = "nonoceanic_cs",
        param_set = 2,
        replicates = 2,
        save_output = FALSE,
        test = TRUE)

      expect_length(errors, 20)
      expect_equal(errors$spec_nltt_error,
                   c(15.3327387659622, 11.6699125909692)
      )
      expect_equal(errors$num_spec_error, c(9, 1))
      expect_equal(errors$num_col_error, c(5, 4))
      expect_equal(errors$endemic_nltt_error, c(16.7236817389599,
                                                15.4028689206418))
      expect_equal(errors$nonendemic_nltt_error, c(5.83925826951656,
                                                   7.05727411894769))
      expect_equal(errors$spec_baseline_nltt_error, c(4.91807424871029,
                                                      18.88365588269255))
      expect_equal(errors$num_spec_baseline_error, c(2, 18))
      expect_equal(errors$num_col_baseline_error, c(0, 12))
      expect_equal(errors$endemic_baseline_nltt_error, c(7.81223286237336,
                                                         13.07079482203278))
      expect_equal(errors$nonendemic_baseline_nltt_error, c(4.84059933234724,
                                                            9.53419053853203))
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
                   list(data.frame("lambda_c" = 0.629301603690909,
                                   "mu" = 1.44570333436959e-06,
                                   "K" = 2.59883208475663,
                                   "gamma" = 0.0111157167928523,
                                   "lambda_a" = 0.459869552006253,
                                   "loglik" = -188.339372678026,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 0.441605499873771,
                                   "mu" = 9.73574726507059e-09,
                                   "K" = 6.41978260660493,
                                   "gamma" = 0.0126808566355502,
                                   "lambda_a" = 0.471846634413505,
                                   "loglik" = -224.302730575663,
                                   "df" = 5,
                                   "conv" = 0)))
      # passed_oceanic_sims_1 reference
      expect_length(errors$passed_oceanic_sims_1, 2)
      expect_length(errors$passed_oceanic_sims_1[[1]][[1]], 34)
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$not_present, 967)
      expect_equal(
        nrow(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$stt_all), 61
      )
      expect_equal(ncol(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_1[[1]][[1]][[2]]$branching_times,
        c(2.5499999999999998,
          0.30835802648825)
      )
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[2]]$stac, 4)
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[2]]$missing_species,
                   0)
      expect_length(errors$passed_oceanic_sims_1[[2]][[1]], 37)
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$not_present, 964)
      expect_equal(nrow(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$stt_all),
                   66)
      expect_equal(ncol(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_1[[2]][[1]][[2]]$branching_times,
        c(2.55000000000000, 1.23334935088527)
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
        nrow(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$stt_all), 62
      )
      expect_equal(ncol(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_2[[1]][[1]][[2]]$branching_times,
        c(2.55, 1.45351762717123, 1.27532551589234)
      )
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[2]]$missing_species,
                   0)
      expect_length(errors$passed_oceanic_sims_2[[2]][[1]], 49)
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$not_present, 952)
      expect_equal(nrow(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$stt_all),
                   83)
      expect_equal(ncol(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_2[[2]][[1]][[2]]$branching_times,
        c(2.55, 0.26139881318694)
      )
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[2]]$stac, 4)
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[2]]$missing_species,
                   0)

      # Failed oceanic_sims
      expect_length(errors$failed_oceanic_sims, 0)

      # Reference passed_oceanic_ml
      expect_length(errors$passed_oceanic_ml, 2)
      expect_equal(errors$passed_oceanic_ml,
                   list(data.frame("lambda_c" = 1.22716867883903,
                                   "mu" = 0.0355396029442225,
                                   "K" = 2.06236442174917,
                                   "gamma" = 0.0135172513863857,
                                   "lambda_a" = 0.50580782711002,
                                   "loglik" = -214.084992593303,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 0.413804474738857,
                                   "mu" = 1.84394820865793e-05,
                                   "K" = 4.43279342140854,
                                   "gamma" = 0.0143167537372298,
                                   "lambda_a" = 0.427355705746798,
                                   "loglik" = -239.136571905099,
                                   "df" = 5,
                                   "conv" = 0)))
      expect_length(errors$failed_oceanic_mls, 0)

  })

test_that("abuse param_set", {
  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_cs",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level_cs",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level_cs",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_cs",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge_cs",
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
    param_space_name = "oceanic_ontogeny_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_sea_level_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "trait_CES",
    param_set = 1,
    replicates = 0))
})
