context("sim_constraints")

test_that("test sim_constraints returns TRUE", {
  stt_all_rep_1 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[1, ] <- c(0, 5, 5, 10, 15)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[1, ] <- c(0, 5, 5, 10, 15)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_sim <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  sim_constraints <- sim_constraints(
    sim = fake_geodynamic_sim,
    replicates = 2)
  expect_equal(sim_constraints, TRUE)
})

test_that("test sim_constraints returns TRUE when number
          of species is under 15", {
  stt_all_rep_1 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[1, ] <- c(0, 4, 4, 4, 10)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[1, ] <- c(0, 4, 4, 4, 10)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_sim <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  sim_constraints <- sim_constraints(
    sim = fake_geodynamic_sim,
    replicates = 2)
  expect_equal(sim_constraints, TRUE)
})

test_that("test sim_constraints returns TRUE when number
          of species exceeds 100", {
  stt_all_rep_1 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[1, ] <- c(0, 40, 40, 40, 50)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[1, ] <- c(0, 40, 40, 40, 50)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_sim <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  sim_constraints <- sim_constraints(
    sim = fake_geodynamic_sim,
    replicates = 2)
  expect_equal(sim_constraints, TRUE)
})

test_that("test sim_constraints returns FALSE when number
          of independent colonisations is under 5", {
  stt_all_rep_1 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_1) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_1[1, ] <- c(0, 1, 1, 2, 3)
  replicate_1_island_info <- list(stt_all = stt_all_rep_1)
  stt_all_rep_2 <- matrix(nrow = 1, ncol = 5)
  colnames(stt_all_rep_2) <- c("Time", "nI", "nA", "nC", "present")
  stt_all_rep_2[1, ] <- c(0, 1, 1, 2, 3)
  replicate_2_island_info <- list(stt_all = stt_all_rep_2)
  fake_geodynamic_sim <- list(list(list(replicate_1_island_info)),
                                      list(list(replicate_2_island_info)))
  sim_constraints <- sim_constraints(
    sim = fake_geodynamic_sim,
    replicates = 2)
  expect_equal(sim_constraints, FALSE)
})
