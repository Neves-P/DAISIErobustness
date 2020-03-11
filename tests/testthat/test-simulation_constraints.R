context("simulation_constraints")

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for oceanic_ontogeny", {
  #geodynamic simulation output from oceanic_ontogeny param_set 1
  stt_all_rep_1 <- matrix(nrow = 107, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[107, ] <- c(0, 2, 5, 9, 10)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 112, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[112, ] <- c(0, 4, 7, 14, 17)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for oceanic_ontogeny", {
  #geodynamic simulation output from oceanic_ontogeny param_set 4
  stt_all_rep_1 <- matrix(nrow = 533, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[533, ] <- c(0, 3, 0, 112, 20)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 292, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[292, ] <- c(0, 4, 0, 74, 18)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for oceanic_sea_level", {
  #geodynamic simulation output from oceanic_sea_level param_set 1301
  stt_all_rep_1 <- matrix(nrow = 243, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[243, ] <- c(0, 3, 4, 13, 12)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 225, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[225, ] <- c(0, 6, 2, 10, 11)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for oceanic_sea_level", {
  #geodynamic simulation output from oceanic_sea_level param_set 1
  stt_all_rep_1 <- matrix(nrow = 34, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[34, ] <- c(0, 0, 0, 0, 0)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 43, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[43, ] <- c(0, 0, 0, 0, 0)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, FALSE)
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
  #geodynamic simulation output from oceanic_ontogeny_sea_level param_set 1
  stt_all_rep_1 <- matrix(nrow = 57, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[57, ] <- c(0, 0, 0, 0, 0)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 56, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[56, ] <- c(0, 0, 0, 0, 0)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for nonoceanic", {
  #geodynamic simulation output from nonoceanic param_set 1
  stt_all_rep_1 <- matrix(nrow = 161, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[161, ] <- c(0, 6, 11, 39, 32)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 190, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[190, ] <- c(0, 5, 18, 41, 36)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for nonoceanic", {
  #geodynamic simulation output from nonoceanic param_set 2
  stt_all_rep_1 <- matrix(nrow = 321, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[321, ] <- c(0, 6, 14, 122, 48)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 350, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[350, ] <- c(0, 0, 12, 141, 49)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, FALSE)
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
  #geodynamic simulation output from nonoceanic_sea_level param_set 1
  stt_all_rep_1 <- matrix(nrow = 83, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[83, ] <- c(0, 0, 0, 0, 0)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 94, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[94, ] <- c(0, 0, 0, 0, 0)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns TRUE when simulation meets
          constraints for nonoceanic_land_bridge", {
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
})

test_that("test simulation_constraints returns FALSE when simulation meets
          constraints for nonoceanic_land_bridge", {
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
})
