context("simulation_constraints")

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for oceanic_ontogeny", {
  #geodynamic simulation output from oceanic_ontogeny param_set 2 with seed 1
  stt_all_rep_1 <- matrix(nrow = 137, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[137, ] <- c(0, 2, 1, 26, 11)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 198, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[198, ] <- c(0, 3, 4, 35, 17)
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
  #geodynamic simulation output from oceanic_ontogeny param_set 1 with seed 1
  stt_all_rep_1 <- matrix(nrow = 92, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[92, ] <- c(0, 3, 5, 6, 10)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 132, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[132, ] <- c(0, 4, 7, 17, 18)
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
  #geodynamic simulation output from oceanic_sea_level param_set 3 with seed 1
  stt_all_rep_1 <- matrix(nrow = 121, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[121, ] <- c(0, 3, 1, 12, 7)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 301, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[301, ] <- c(0, 1, 2, 37, 11)
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
  #geodynamic simulation output from oceanic_sea_level param_set 1 with seed 1
  stt_all_rep_1 <- matrix(nrow = 81, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[81, ] <- c(0, 2, 1, 5, 5)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 67, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[67, ] <- c(0, 4, 0, 6, 7)
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
  #geodynamic simulation output from oceanic_ontogeny_sea_level param_set 27
  #with seed 1
  stt_all_rep_1 <- matrix(nrow = 334, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[334, ] <- c(0, 2, 1, 27, 8)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 887, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[887, ] <- c(0, 1, 1, 64, 8)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for oceanic_ontogeny_sea_level", {
  #geodynamic simulation output from oceanic_ontogeny_sea_level param_set 1
  #with seed 1
  stt_all_rep_1 <- matrix(nrow = 71, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[71, ] <- c(0, 2, 1, 0, 3)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 129, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[129, ] <- c(0, 2, 1, 0, 3)
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
  #geodynamic simulation output from nonoceanic param_set 1 with seed 1
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
  #geodynamic simulation output from nonoceanic param_set 2 with seed 1
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
  #geodynamic simulation output from nonoceanic_sea_level param_set 2
  #with seed 1
  stt_all_rep_1 <- matrix(nrow = 695, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[695, ] <- c(0, 2, 4, 50, 18)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 494, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[494, ] <- c(0, 2, 4, 12, 10)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for nonoceanic_sea_level", {
  #geodynamic simulation output from nonoceanic_sea_level param_set 1
  #with seed 1
  stt_all_rep_1 <- matrix(nrow = 277, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[277, ] <- c(0, 2, 3, 5, 7)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 268, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[268, ] <- c(0, 5, 1, 10, 9)
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
  #geodynamic simulation output from nonoceanic_land_bridge param_set 4
  #with seed 1
  stt_all_rep_1 <- matrix(nrow = 216, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[216, ] <- c(0, 5, 21, 21, 34)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 221, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[221, ] <- c(0, 2, 17, 12, 24)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation meets
          constraints for nonoceanic_land_bridge", {
  #geodynamic simulation output from nonoceanic_land_bridge param_set 1
  #with seed 1
  stt_all_rep_1 <- matrix(nrow = 222, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[222, ] <- c(0, 4, 24, 63, 47)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 245, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[245, ] <- c(0, 4, 31, 69, 54)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, FALSE)
})
