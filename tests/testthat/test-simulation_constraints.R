context("simulation_constraints")

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    #geodynamic simulation output from oceanic_ontogeny param_set 1
    stt_all <- matrix(nrow = 112, ncol = 5)
    colnames(stt_all) <- c("Time", "nI", "nA", "nC", "present")
    stt_all[1, ] <- c(2.54999999999999982, 0, 0, 0, 0)
    stt_all[2, ] <- c(2.53852689750492555, 1, 0, 0, 1)
    stt_all[3, ] <- c(2.53419858304282020, 0, 0, 0, 0)
    stt_all[29, ] <- c(1.381159255315790979, 1, 0, 10, 6)
    stt_all[41, ] <- c(0.970857228597442390, 4, 4, 8, 11)
    stt_all[95, ] <- c(0.167138343063989225, 3, 7, 15, 15)
    stt_all[105, ] <- c(0.032361981288045794, 3, 5, 9, 11)
    stt_all[106, ] <- c(0.024259422462705960, 2, 5, 9, 10)
    stt_all[107, ] <- c(0.000000000000000000, 2, 5, 9, 10)
    replicate_1_island_info <- list(island_age = 2.55,
                                    not_present = 990,
                                    stt_all = stt_all)
    replicate_1_taxon_list_1 <- list(branching_times = c(2.55, 0.16583840374981),
                                     stac = 4,
                                     missing_species = 0)
    replicate_1_taxon_list_2 <- list(branching_times = c(2.55, 0.26161495047347),
                                     stac = 4,
                                     missing_species = 0)
    replicate_1_taxon_list_3 <- list(branching_times = c(2.55, 0.5694025672972201),
                                     stac = 2,
                                     missing_species = 0)
    replicate_1_taxon_list_4 <- list(branching_times = c(2.55,
                                                         1.3912428331249300,
                                                         0.6830817212089501,
                                                         0.3609718102498500),
                                     stac = 2,
                                     missing_species = 0)
    replicate_1_taxon_list_5 <- list(branching_times = c(2.55, 1.05755278415504),
                                     stac = 2,
                                     missing_species = 0)
    replicate_1_taxon_list_6 <- list(branching_times = c(2.55,
                                                         1.6391030989587301,
                                                         1.4371649217519300,
                                                         0.8354585544611201),
                                     stac = 2,
                                     missing_species = 0)
    replicate_1_taxon_list_7 <- list(branching_times = c(2.55, 1.30976774038051),
                                     stac = 2,
                                     missing_species = 0)
    replicate_1_taxon_list_8 <- list(branching_times = c(2.55, 1.50685422234237),
                                     stac = 2,
                                     missing_species = 0)
    replicate_1_taxon_list_9 <- list(branching_times = c(2.55, 2.23578987754881),
                                     stac = 2,
                                     missing_species = 0)
    replicate_1_taxon_list_10 <- list(branching_times = c(2.55,
                                                          0.85594841486772,
                                                          0.80903212943811,
                                                          0.31633454531757),
                                      stac = 2,
                                      missing_species = 0)
    fake_geodynamic_simulations <- list(replicate_1_island_info,
                                        replicate_1_taxon_list_1,
                                        replicate_1_taxon_list_2,
                                        replicate_1_taxon_list_3,
                                        replicate_1_taxon_list_4,
                                        replicate_1_taxon_list_5,
                                        replicate_1_taxon_list_6,
                                        replicate_1_taxon_list_7,
                                        replicate_1_taxon_list_8,
                                        replicate_1_taxon_list_9,
                                        replicate_1_taxon_list_10)


  simulation_constraints <- simulation_constraints(
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
    param_space = param_space,
    param_set = 4)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVseyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for oceanic_sea_level", {
  skip("cannot find param_set that passes conditioning")
  param_space <- load_param_space(
    param_space_name = "oceanic_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_sea_level",
    param_space = param_space,
    param_set = 17)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for oceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for oceanic_ontogeny_sea_level", {
  skip("cannot find param_set that passes keep looking")
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_space = param_space,
    param_set = 25)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for oceanic_ontogeny_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for nonoceanic", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})


test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for nonoceanic", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic",
    param_space = param_space,
    param_set = 2)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for nonoceanic_sea_level", {
  skip("Cannot find param_set that passes keep looking")
  param_space <- load_param_space(
    param_space_name = "nonoceanic_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_sea_level",
    param_space = param_space,
    param_set = 10)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for nonoceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation meets
          constraints for nonoceanic_land_bridge", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic_land_bridge")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_land_bridge",
    param_space = param_space,
    param_set = 4)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic_land_bridge",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns FALSE when simulation meets
          constraints for nonoceanic_land_bridge", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic_land_bridge")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_land_bridge",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic_land_bridge",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})
