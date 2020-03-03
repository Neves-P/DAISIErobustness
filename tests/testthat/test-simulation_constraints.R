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
    stt_all[4, ] <- c()
    stt_all[5, ] <- c()
    stt_all[6, ] <- c()
    stt_all[7, ] <- c()
    stt_all[8, ] <- c()
    stt_all[9, ] <- c()
    stt_all[10, ] <- c()
    stt_all[11, ] <- c()
    stt_all[12, ] <- c()
    stt_all[13, ] <- c()
    stt_all[14, ] <- c()
    stt_all[15, ] <- c()
    stt_all[16, ] <- c()
    stt_all[17, ] <- c()
    stt_all[18, ] <- c()
    stt_all[19, ] <- c()
    stt_all[20, ] <- c()
    stt_all[21, ] <- c()
    stt_all[22, ] <- c()
    stt_all[23, ] <- c()
    stt_all[24, ] <- c()
    stt_all[25, ] <- c()
    stt_all[26, ] <- c()
    stt_all[27, ] <- c()
    stt_all[28, ] <- c()
    stt_all[29, ] <- c()
    stt_all[30, ] <- c()
    stt_all[31, ] <- c()
    stt_all[32, ] <- c()
    stt_all[33, ] <- c()
    stt_all[34, ] <- c()
    stt_all[35, ] <- c()
    stt_all[36, ] <- c()
    stt_all[37, ] <- c()
    stt_all[38, ] <- c()
    stt_all[39, ] <- c()
    stt_all[40, ] <- c()
    stt_all[41, ] <- c()
    stt_all[42, ] <- c()
    stt_all[43, ] <- c()
    stt_all[44, ] <- c()
    stt_all[45, ] <- c()
    stt_all[46, ] <- c()
    stt_all[47, ] <- c()
    stt_all[48, ] <- c()
    stt_all[49, ] <- c()
    stt_all[50, ] <- c()
    stt_all[51, ] <- c()
    stt_all[52, ] <- c()
    stt_all[53, ] <- c()
    stt_all[54, ] <- c()
    stt_all[55, ] <- c()
    stt_all[56, ] <- c()
    stt_all[57, ] <- c()
    stt_all[58, ] <- c()
    stt_all[59, ] <- c()
    stt_all[60, ] <- c()
    stt_all[61, ] <- c()
    stt_all[62, ] <- c()
    stt_all[63, ] <- c()
    stt_all[64, ] <- c()
    stt_all[65, ] <- c()
    stt_all[66, ] <- c()
    stt_all[67, ] <- c()
    stt_all[68, ] <- c()
    stt_all[69, ] <- c()
    stt_all[70, ] <- c()
    stt_all[71, ] <- c()
    stt_all[72, ] <- c()
    stt_all[73, ] <- c()
    stt_all[74, ] <- c()
    stt_all[75, ] <- c()
    stt_all[76, ] <- c()
    stt_all[77, ] <- c()
    stt_all[78, ] <- c()
    stt_all[79, ] <- c()
    stt_all[80, ] <- c()
    stt_all[81, ] <- c()
    stt_all[82, ] <- c()
    stt_all[83, ] <- c()
    stt_all[84, ] <- c()
    stt_all[85, ] <- c()
    stt_all[86, ] <- c()
    stt_all[87, ] <- c()
    stt_all[88, ] <- c()
    stt_all[89, ] <- c()
    stt_all[90, ] <- c()
    stt_all[91, ] <- c()
    stt_all[92, ] <- c()
    stt_all[93, ] <- c()
    stt_all[94, ] <- c()
    stt_all[95, ] <- c()
    stt_all[96, ] <- c()
    stt_all[97, ] <- c()
    stt_all[98, ] <- c()
    stt_all[99, ] <- c()
    stt_all[100, ] <- c()
    stt_all[101, ] <- c()
    stt_all[102, ] <- c()
    stt_all[103, ] <- c()
    stt_all[104, ] <- c()
    stt_all[105, ] <- c()
    stt_all[106, ] <- c()
    stt_all[107, ] <- c()
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
