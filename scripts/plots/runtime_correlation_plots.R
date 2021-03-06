# Fig S1
runtime_params <- get_runtime_params(
  "G:/Shared drives/DAISIE-RUG/Josh_Pedro_paper/logs/"
)

results_total <- calc_ed95_param_set(
  "G:/Shared drives/DAISIE-RUG/Josh_Pedro_paper/results"
)

runtime_cors <- calc_runtime_ed95_cor(
  runtime_params = runtime_params,
  ed95_param_sets = results_total
)

runtime_pars <- merge(
  runtime_params, results_total, by = c("param_space_name", "param_set")
)
plot_cor(runtime_pars)
