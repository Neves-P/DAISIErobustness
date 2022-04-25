# Accessory functions for stripchart plotting for Neves et al 2022
compile_ed95s <- function(param_space_name) {
  if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "P282067"))) {
    folder_path <- file.path(
      "G:\\Shared drives\\DAISIE-RUG\\Robustness\\resubmission\\results\\", param_space_name
    )
  } else if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "Pedro"))) {
    folder_path <- file.path(
      "G:\\Discos partilhados\\DAISIE-RUG\\Robustness\\results", param_space_name
    )
  } else {
    folder_path <- choose.dir(caption = "Select 'results' folder")
  }
  testit::assert("Chosen directory exists", dir.exists(folder_path))

  param_space <- DAISIErobustness::load_param_space(param_space_name = param_space_name)
  scenario_res <- calc_ed95_for_plots(
    folder_path = folder_path,
    param_space = param_space
  )

  if (length(unique(scenario_res$time)) == 2) {
    Island <- factor(
      ifelse(scenario_res$time == 2.55, "Maui Nui", "Kaua'i"),
      levels = c("Maui Nui", "Kaua'i"),
      ordered = TRUE
    )
  }
  if (length(unique(scenario_res$x_s)) > 1) {
    Island <- factor(
      ifelse(scenario_res$time == 2.55, "Young", "Old"),
      levels = c("Young", "Old"),
      ordered = TRUE
    )
  }
  if (length(unique(scenario_res$time)) == 3) {
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
