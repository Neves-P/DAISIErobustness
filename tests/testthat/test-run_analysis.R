context("run_analysis")

test_that("run full function", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(1)

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

    novel_ml <- DAISIErobustness:::run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars
    )
  } else{
    skip("Run only on TRAVIS")
  }
})

test_that("run failed sim_constraints", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(1)

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

    novel_ml <- DAISIErobustness:::run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars
    )
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("abuse", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(1)

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

    expect_error(
      novel_ml <- DAISIErobustness:::run_analysis(
        novel_sim = "nonsense",
        param_space_name = param_space_name,
        replicates = replicates,
        sim_pars = sim_pars
      )
    )
    expect_error(
      novel_ml <- DAISIErobustness:::run_analysis(
        novel_sim = novel_sim,
        param_space_name = 123,
        replicates = replicates,
        sim_pars = sim_pars
      )
    )
    expect_error(
      novel_ml <- DAISIErobustness:::run_analysis(
        novel_sim = novel_sim,
        param_space_name = param_space_name,
        replicates = "nonsense",
        sim_pars = sim_pars
      )
    )
    expect_error(
      novel_ml <- DAISIErobustness:::run_analysis(
        novel_sim = novel_sim,
        param_space_name = param_space_name,
        replicates = replicates,
        sim_pars = "nonsense"
      )
    )
  } else {
    skip("Run only on TRAVIS")
  }
})
