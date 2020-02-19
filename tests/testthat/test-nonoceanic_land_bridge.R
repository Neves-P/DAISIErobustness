context("run_robustness nonoceanic_land_bridge")

test_that("nonoceanic_land_bridge works across parameter sets", {
  if (1 == 2) {
    expect_silent(error_1 <- run_robustness(
      param_space_name = "nonoceanic_land_bridge",
      param_set = 1,
      replicates = 2))
    expect_length(error_1, 13)
    species_error <- list(nltt = c(171.0539, 173.4640),
                          num_spec_error = c(16, 9),
                          num_colonist_error = c(72, 52))
    expect_equal(error_1$species_error, species_error)
    endemic_error <- list(nltt = c(32.290208, 8.507572))
    expect_equal(error_1$endemic_error, endemic_error)
    nonendemic_error <- list(nltt = c(198.8055, 173.2959))
    expect_equal(error_1$nonendemic_error, nonendemic_error)
    rates_error <- list(clado_error = c(0.2734599, 0.2651820),
                        ext_error = c(0.4999999, 0.4999998),
                        K_error = c(Inf, Inf),
                        immig_error = c(0.01862479, 0.01039437),
                        ana_error = c(0.228017, 2.080941))
    expect_equal(error_1$rates_error, rates_error)
    species_baseline_error <- list(nltt = c(6.819918, 8.982071),
                                   num_spec_error = c(5, 10),
                                   num_colonist_error = c(0, 0))
    expect_equal(error$species_baseline_error, species_baseline_error)
    endemic_baseline_error <- list(nltt = c(5.642022, 4.930769))
    expect_equal(error_1$endemic_baseline_error, endemic_baseline_error)
    nonendemic_baseline_error <- list(nltt = c(5.260328, 9.232351))
    expect_equal(error_1$nonendemic_baseline_error, nonendemic_baseline_error)
    rates_baseline_error <- list(clado_error = c(0.04502040, 0.04447554),
                                 ext_error = c(5.427929e-08, 8.134764e-02),
                                 K_error = c(NaN, NaN),
                                 immig_error = c(0.001976756, 0.003465786),
                                 ana_error = c(0.2571729, 1.0289714))
    expect_equal(error_1$rates_baseline_error, rates_baseline_error)

    expect_silent(error_2 <- run_robustness(param_space_name = "nonoceanic",
                                            param_set = 2,
                                            replicates = 2))
    expect_length(error_2, 13)
    species_error <- list(nltt = c(290.8331, 225.2527),
                          num_spec_error = c(93, 19),
                          num_colonist_error = c(81, 83))
    expect_equal(error_2$species_error, species_error)
    endemic_error <- list(nltt = c(22.24651, 24.59885))
    expect_equal(error_2$endemic_error, endemic_error)
    nonendemic_error <- list(nltt = c(310.7796, 247.5921))
    expect_equal(error_2$nonendemic_error, nonendemic_error)
    rates_error <- list(clado_error = c(0.5251806, 0.5299823),
                        ext_error = c(0.4999964, 0.4999958),
                        K_error = c(Inf, Inf),
                        immig_error = c(0.02213929, 0.02334889),
                        ana_error = c(0.3896976, 0.8493483))
    expect_equal(error_2$rates_error, rates_error)
    species_baseline_error <- list(nltt = c(8.723395, 22.798788),
                                   num_spec_error = c(11, 17),
                                   num_colonist_error = c(0, 0))
    expect_equal(error_2$species_baseline_error, species_baseline_error)
    endemic_baseline_error <- list(nltt = c(11.43755, 12.00743))
    expect_equal(error_2$endemic_baseline_error, endemic_baseline_error)
    nonendemic_baseline_error <- list(nltt = c(9.03152, 13.80733))
    expect_equal(error_2$nonendemic_baseline_error, nonendemic_baseline_error)
    rates_baseline_error <- list(clado_error = c(0.07535362, 0.06805306),
                                 ext_error = c(3.484234e-06, 1.696618e-06),
                                 K_error = c(NaN, NaN),
                                 immig_error = c(0.0000263862, 0.0070588433),
                                 ana_error = c(0.3026197, 0.1523947))
    expect_equal(error_2$rates_baseline_error, rates_baseline_error)
  }
})
