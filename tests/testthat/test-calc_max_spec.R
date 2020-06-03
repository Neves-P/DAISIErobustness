test_that("use", {
  replicates <- 2
  param_space_name <- "nonoceanic"
  param_set <- 27
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )

  param_space <- load_param_space(
    param_space_name = param_space_name)

  sim_pars <- extract_param_set(
    param_space_name = param_space_name,
    param_space = param_space,
    param_set = param_set)

  novel_sim <- DAISIErobustness:::run_novel_sim(
    param_space_name = param_space_name,
    sim_pars = sim_pars,
    replicates = replicates
  )

  expect_silent(calc_max_spec(novel_sim))
  expect_true(length(calc_max_spec(novel_sim)[[1]]) == length(novel_sim))
  expect_true(length(calc_max_spec(novel_sim)[[2]]) == length(novel_sim))
  expect_equal(calc_max_spec(novel_sim), list(max_spec_clade = c(3, 3),
                                              num_island_spec = c(23, 24)))
})

test_that("abuse", {
  expect_error(calc_max_spec("novel_sim"))
})
