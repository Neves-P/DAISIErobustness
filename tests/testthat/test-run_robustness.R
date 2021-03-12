context("run_robustness")

test_that("run_robustness output is correct when save_output = FALSE", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

      errors <- run_robustness(
        param_space_name = "nonoceanic",
        param_set = 2,
        replicates = 2,
        save_output = FALSE)

      expect_length(errors, 20)
      expect_equal(errors$spec_nltt_error,
                   c(15.64120547852360, 17.20955054767382)
      )
      expect_equal(errors$num_spec_error, c(0, 3))
      expect_equal(errors$num_col_error, c(0, 1))
      expect_equal(errors$endemic_nltt_error, c(17.25912182228838,
                                                12.53126140868229))
      expect_equal(errors$nonendemic_nltt_error, c(6.342975372372706,
                                                   6.180380779545204))
      expect_equal(errors$spec_baseline_nltt_error, c(9.255668289933380,
                                                      8.384191123443467))
      expect_equal(errors$num_spec_baseline_error, c(6, 12))
      expect_equal(errors$num_col_baseline_error, c(8, 14))
      expect_equal(errors$endemic_baseline_nltt_error, c(7.523345330264918,
                                                         7.355242155237033))
      expect_equal(errors$nonendemic_baseline_nltt_error, c(5.967789871010382,
                                                            12.200632581701466))
      expect_equal(errors$error_metrics,
                   list(num_spec_mean_diff = 7.5,
                        num_spec_sd_diff = 2.12132034355964,
                        num_col_mean_diff = 10.5,
                        num_col_sd_diff = 3.535533905932737,
                        spec_nltt_mean_diff = 7.605448306410288,
                        endemic_nltt_mean_diff = 7.455897872734361,
                        nonendemic_nltt_mean_diff = 2.82253315039697,
                        spec_nltt_sd_diff = 0.4927600195623473,
                        endemic_nltt_sd_diff = 3.224235263963091,
                        nonendemic_nltt_sd_diff = 4.292313607626216))
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
                   c(2.55, 0.42696237832183))
      expect_equal(errors$passed_novel_sims[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_novel_sims[[2]][[1]][[2]]$missing_species, 0)
      expect_length(errors$failed_novel_sims, 0)
      expect_equal(errors$passed_novel_mls,
                   list(data.frame("lambda_c" = 0.8824454895921542,
                                   "mu" = 0.3113755051386142,
                                   "K" = 13.82877297309126,
                                   "gamma" = 0.01186426339331943,
                                   "lambda_a" = 0.7015325993640438,
                                   "loglik" = -192.1211089141583,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 0.5824473612060577,
                                   "mu" = 2.251327624309094e-07,
                                   "K" = 10.65026507939477,
                                   "gamma" = 0.01179560146888651,
                                   "lambda_a" = 1.386815546156895,
                                   "loglik" = -223.3609848973665,
                                   "df" = 5,
                                   "conv" = 0)))
      # passed_oceanic_sims_1 reference
      expect_length(errors$passed_oceanic_sims_1, 2)
      expect_length(errors$passed_oceanic_sims_1[[1]][[1]], 25)
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$not_present, 976)
      expect_equal(
        nrow(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$stt_all), 111
      )
      expect_equal(ncol(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_1[[1]][[1]][[2]]$branching_times,
        c(2.55,
          1.90783279646280,
          1.62272377720208,
          1.31074939947538,
          0.60612219135438,
          0.53180055805722)
      )
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[2]]$missing_species,
                   0)
      expect_length(errors$passed_oceanic_sims_1[[2]][[1]], 31)
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$not_present, 970)
      expect_equal(nrow(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$stt_all),
                   72)
      expect_equal(ncol(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_1[[2]][[1]][[2]]$branching_times,
        c(2.55,
          1.46150144074839,
          1.07054096335454,
          1.01154789748655,
          0.71687359188619,
          0.34640863790593)
      )
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[2]]$missing_species,
                   0)

      # passed_oceanic_sims_2 reference
      expect_length(errors$passed_oceanic_sims_2, 2)
      expect_length(errors$passed_oceanic_sims_2[[1]][[1]], 33)
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$not_present, 968)
      expect_equal(
        nrow(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$stt_all), 108
      )
      expect_equal(ncol(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_2[[1]][[1]][[2]]$branching_times,
        c(2.55, 1.95327908492871)
      )
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[2]]$stac, 4)
      expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[2]]$missing_species,
                   0)
      expect_length(errors$passed_oceanic_sims_2[[2]][[1]], 45)
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$not_present, 956)
      expect_equal(nrow(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$stt_all),
                   89)
      expect_equal(ncol(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(
        errors$passed_oceanic_sims_2[[2]][[1]][[2]]$branching_times,
        c(2.55,
          0.63950191180121996,
          0.08370595190420980)
      )
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[2]]$missing_species,
                   0)

      # Failed oceanic_sims
      expect_length(errors$failed_oceanic_sims, 0)

      # Reference passed_oceanic_ml
      expect_length(errors$passed_oceanic_ml, 2)
      expect_equal(errors$passed_oceanic_ml,
                   list(data.frame("lambda_c" = 0.970578602639516,
                                   "mu" = 0.3989902426740486,
                                   "K" = 13.4216309707451,
                                   "gamma" = 0.0125270271558391,
                                   "lambda_a" = 0.328664192836639,
                                   "loglik" = -189.5704578980814,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 0.6004736902523847,
                                   "mu" = 0.01143988117220578,
                                   "K" = 6.192159218771516,
                                   "gamma" = 0.01192962663643799,
                                   "lambda_a" = 0.8827302460909572,
                                   "loglik" = -216.895235905354,
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

  expect_error(run_robustness(
    param_space_name = "trait_trans",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "trait_trans",
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

  expect_error(run_robustness(
    param_space_name = "trait_trans",
    param_set = 1,
    replicates = 0))
})
