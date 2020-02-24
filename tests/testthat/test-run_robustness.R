context("run_robustness")

test_that("test_run_robustness output is correct for
          oceanic_ontogeny", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "oceanic_ontogeny",
    param_set = 1,
    replicates = 2)

  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)

  expect_silent(error_2 <- run_robustness(param_space_name = "oceanic_ontogeny",
                                          param_set = 2,
                                          replicates = 2))
  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)
})

test_that("test_run_robustness output is correct for
          oceanic_sea_level", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "oceanic_sea_level",
    param_set = 1,
    replicates = 2)

  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)

  error_2 <- run_robustness(
    param_space_name = "oceanic_sea_level",
    param_set = 2,
    replicates = 2)
  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)
})

test_that("test_run_robustness output is correct for
          oceanic_ontogeny_sea_level", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 1,
    replicates = 2)

  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)

  error_2 <- run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 2,
    replicates = 2)
  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)
})

test_that("test_run_robustness output is correct for
          nonoceanic", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "nonoceanic",
    param_set = 1,
    replicates = 2)

  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)

  error_2 <- run_robustness(
    param_space_name = "nonoceanic",
    param_set = 2,
    replicates = 2)
  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)
})

test_that("test_run_robustness output is correct for
          nonoceanic_sea_level", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "nonoceanic_sea_level",
    param_set = 1,
    replicates = 2)

  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)

  error_2 <- run_robustness(
    param_space_name = "nonoceanic_sea_level",
    param_set = 2,
    replicates = 2)
  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)
})

test_that("test_run_robustness output is correct for
          nonoceanic_land_bridge", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 1,
    replicates = 2)

  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)

  error_2 <- run_robustness(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 2,
    replicates = 2)
  expect_length(error, 13)
  species_error <- list(nltt = c(7.476325, 25.582615),
                        num_spec_error = c(22, 28),
                        num_colonist_error = c(19, 17))
  expect_equal(error$species_error, species_error)
  endemic_error <- list(nltt = c(4.268442, 3.964897))
  expect_equal(error$endemic_error, endemic_error)
  nonendemic_error <- list(nltt = c(5.608418, 26.075752))
  expect_equal(error$nonendemic_error, nonendemic_error)
  rates_error <- list(clado_error = c(0.9740681, 1.1962083),
                      ext_error = c(0.9999944, 0.4407934),
                      K_error = c(Inf, Inf),
                      immig_error = c(0.0009473277, 0.0010732816),
                      ana_error = c(1.911651, 0.188361))
  expect_equal(error$rates_error, rates_error)
  species_baseline_error <- list(nltt = c(8.642979, 11.659693),
                                 num_spec_error = c(8, 14),
                                 num_colonist_error = c(0, 0))
  expect_equal(error$species_baseline_error, species_baseline_error)
  endemic_baseline_error <- list(nltt = c(3.986954, 8.864132))
  expect_equal(error$endemic_baseline_error, endemic_baseline_error)
  nonendemic_baseline_error <- list(nltt = c(6.077315, 4.237040))
  expect_equal(error$nonendemic_baseline_error, nonendemic_baseline_error)
  rates_baseline_error <- list(clado_error = c(0.08162505, 0.17180347),
                               ext_error = c(1.740744e-06, 1.588942e+00),
                               K_error = c(NaN, NaN),
                               immig_error = c(0.002368688, 0.012751820),
                               ana_error = c(1.11244790, 0.07893092))
  expect_equal(error$rates_baseline_error, rates_baseline_error)
})

test_that("Output is correct when conditioning not met for
          oceanic_ontogeny", {
  skip("WIP")
  error <- run_robustness(
      param_space_name = "oceanic_ontogeny",
      param_set = 1,
      replicates = 2)
  expect_equal(error,
                 "95% of replicates did not have 20 species or did not\n    have 5 colonisation to the present")
})

test_that("Output is correct when conditioning not met for
          oceanic_sea_level", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "oceanic_sea_level",
    param_set = 1,
    replicates = 2)
  expect_equal(error,
               "95% of replicates did not have 20 species or did not\n    have 5 colonisation to the present")
})

test_that("Output is correct when conditioning not met for
          oceanic_ontogeny_sea_level", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 1,
    replicates = 2)
  expect_equal(error,
               "95% of replicates did not have 20 species or did not\n    have 5 colonisation to the present")
})

test_that("Output is correct when conditioning not met for
          nonoceanic", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "nonoceanic",
    param_set = 1,
    replicates = 2)
  expect_equal(error,
               "95% of replicates did not have 20 species or did not\n    have 5 colonisation to the present")
})

test_that("Output is correct when conditioning not met for
          nonoceanic_sea_level", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "nonoceanic_sea_level",
    param_set = 1,
    replicates = 2)
  expect_equal(error,
               "95% of replicates did not have 20 species or did not\n    have 5 colonisation to the present")
})

test_that("Output is correct when conditioning not met for
          nonoceanic_land_bridge", {
  skip("WIP")
  error <- run_robustness(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 1,
    replicates = 2)
  expect_equal(error,
               "95% of replicates did not have 20 species or did not\n    have 5 colonisation to the present")
})

test_that("abuse param_space_name", {
  skip("WIP")
  expect_error(run_robustness(
    param_space_name = "nonsense",
    param_set = 1,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonsense",
    param_set = 2,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonsense",
    param_set = 1,
    replicates = 3))
})

test_that("abuse param_set", {
  skip("WIP")
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
})

test_that("abuse replicates", {
  skip("WIP")
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
})