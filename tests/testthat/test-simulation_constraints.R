context("simulation_constraints")

test_that("test simulation_constraints returns TRUE", {
  stt_all_rep_1 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[1, ] <- c(0, 5, 5, 10, 15)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[1, ] <- c(0, 5, 5, 10, 15)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when number
          of species is under 15", {
  stt_all_rep_1 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[1, ] <- c(0, 4, 4, 4, 10)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[1, ] <- c(0, 4, 4, 4, 10)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns FALSE when number
          of species exceeds 100", {
  stt_all_rep_1 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[1, ] <- c(0, 40, 40, 40, 50)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[1, ] <- c(0, 40, 40, 40, 50)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns FALSE when number
          of independent colonisations is under 5", {
  stt_all_rep_1 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[1, ] <- c(0, 1, 1, 2, 3)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[1, ] <- c(0, 1, 1, 2, 3)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_simulations <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  simulation_constraints <- simulation_constraints(
    simulations = fake_geodynamic_simulations,
    replicates = 2)
  expect_equal(simulation_constraints, FALSE)
})
