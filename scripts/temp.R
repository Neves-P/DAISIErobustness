out <- get_runtime_params(logs_folder_path = "robustness_pilot/logs/")
length(which(is.na(out$runtime)))
nrow(out)
877/2602
running <- jap::check_jobs()$job_states # 760
names <- unique(out$param_space_name)

nas_list <- list()
fail_ratio <- c()
for (i in seq_along(names)) {
  space_length <- nrow(load_param_space(names[i]))

  nas_list[[i]] <- dplyr::filter(
    out,
    param_space_name == names[i],
    is.na(runtime)
  )
  fail_ratio[i] <- nrow(nas_list[[i]]) / space_length
}

