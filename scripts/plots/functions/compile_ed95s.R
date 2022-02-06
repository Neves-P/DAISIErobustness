# Accessory functions for stripchart plotting for Neves et al 2022
compile_ed95s <- function(scenario) {
  if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "P282067"))) {
    folder_path <- file.path(
      "G:\\Shared drives\\DAISIE-RUG\\Robustness\\results", scenario
    )
  } else if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "Pedro"))) {
    folder_path <- file.path(
      "G:\\Discos partilhados\\DAISIE-RUG\\Robustness\\results", scenario
    )
  } else {
    folder_path <- choose.dir(caption = "Select 'results' folder")
  }
  testit::assert("Chosen directory exists", dir.exists(folder_path))

  scenario <- DAISIErobustness::load_param_space(param_space_name = scenario)
  scenario_res <- calc_ed95_for_plots(
    folder_path = folder_path,
    scenario = scenario
  )

  if (length(unique(scenario_res$time)) == 2) {
    Island <- factor(
      ifelse(scenario_res$time == 2.55, "Kaua'i", "Maui Nui"),
      levels = c("Kaua'i", "Maui Nui"),
      ordered = FALSE
    )
  } else {
    Island <- factor(
      ifelse(scenario_res$time == 2.55, "Young",
             ifelse(scenario_res$time == 6.15, "Old",
                    ifelse(scenario_res$time == 50, "Ancient", "Ancient"
                    )
             )
      ),
      levels = c("Young", "Old", "Ancient"), ordered = FALSE)

  }
  scenario_res <- cbind(scenario_res, Island)

  return(scenario_res)
}
