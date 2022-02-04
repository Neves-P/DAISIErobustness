# Accessory functions for stripchart plotting for Neves et al 2022
compile_ed95s <- function(scenario) {
  if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "P282067"))) {
    folder_path <- file.path(
      "G:\\Shared drives\\DAISIE-RUG\\Robustness\\results", scenario
    )
    testit::assert("Chosen directory exists", dir.exists(folder_path))
  } else if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "Pedro"))) {
    folder_path <- file.path(
      "G:\\Discos partilhados\\DAISIE-RUG\\Robustness\\results", scenario
    )
    testit::assert("Chosen directory exists", dir.exists(folder_path))
  } else {
    folder_path <- choose.dir(caption = "Select 'results' folder")
    testit::assert("Chosen directory exists", dir.exists(folder_path))
  }

  scenario <- load_param_space(param_space_name = scenario)
  scenario_res <- calc_ed95_for_plots(
    folder_path = folder_path,
    scenario = scenario
  )

  return(scenario_res)
}
