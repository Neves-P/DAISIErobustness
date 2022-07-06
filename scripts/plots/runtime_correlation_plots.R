# Fig S1

if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "P282067"))) {
  folder_path <- "G:\\Shared drives\\DAISIE-RUG\\Robustness\\resubmission\\"

} else if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "pedro"))) {
  folder_path <-
    "G:\\Discos partilhados\\DAISIE-RUG\\Robustness\\resubmission\\"

} else {
  folder_path <- choose.dir(
    caption = "Select root of 'results' and 'logs' folders."
  )
}
testit::assert("Chosen directory exists", dir.exists(folder_path))

runtime_params <- get_runtime_params(
  file.path(folder_path, "logs")
)

results_total <- calc_ed95_param_set(
  file.path(folder_path, "results")
)

runtime_cors <- calc_runtime_ed95_cor(
  runtime_params = runtime_params,
  ed95_param_sets = results_total
)

runtime_pars <- merge(
  runtime_params, results_total, by = c("param_space_name", "param_set")
)
plot_cor(runtime_pars)
