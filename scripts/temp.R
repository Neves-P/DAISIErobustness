out <- get_runtime_params(logs_folder_path = "robustness_pilot/logs/")
length(which(is.na(out$runtime)))
n_logs_total <- nrow(out)
total_n_res_total <- length(
  list.files("robustness_pilot/results/", recursive = TRUE)
)
success_ratio_total <-  total_n_res_total / n_logs_total

names <- unique(out$param_space_name)
status <- unique(out$status)

resultless_list <- list()
failed_list <- list()
timeout_list <- list()
success_ratio <- data.frame(
  "param_space" = character(),
  "sucess_rate" = numeric(),
  "failed_rate" = numeric(),
  "timeout_rate" = numeric()
)
for (i in seq_along(names)) {
  space_length <- nrow(load_param_space(names[i]))

  resultless_list[[i]] <- dplyr::filter(
    out,
    param_space_name == names[i],
    status != "COMPLETED" & status != "RUNNING"
  )
  failed_list[[i]] <- dplyr::filter(
    out,
    param_space_name == names[i],
    status == "FAILED"
  )
  timeout_list[[i]] <- dplyr::filter(
    out,
    param_space_name == names[i],
    status != "COMPLETED" & status != "RUNNING" & status != "FAILED"
  )
  success_ratio[i, 1] <- names[i]
  success_ratio[i, 2] <- (space_length - nrow(resultless_list[[i]])) /
    space_length
  success_ratio[i, 3] <- nrow(failed_list[[i]]) / space_length
  success_ratio[i, 4] <- nrow(timeout_list[[i]]) / space_length
}

names(resultless_list) <- names
names(failed_list) <- names
names(timeout_list) <- names


ggplot2::ggplot(data = success_ratio, ggplot2::aes(param_space, sucess_rate)) +
  ggplot2::geom_col() +
  ggplot2::theme_classic() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 25))

ggplot2::ggplot(data = success_ratio, ggplot2::aes(param_space, failed_rate)) +
  ggplot2::geom_col() +
  ggplot2::theme_classic() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 25))

ggplot2::ggplot(data = success_ratio, ggplot2::aes(param_space, timeout_rate)) +
  ggplot2::geom_col() +
  ggplot2::theme_classic() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 25))

ran_novel_sim_list <- list()
ran_sim <- c()
for (i in seq_along(timeout_list)) {
  paths <- file.path("robustness_pilot", "logs", timeout_list[[i]]$log_name)

  for (j in seq_along(paths)) {
    log_lines <- readLines(con = paths[j], n = 2000)
    ran_sim[j] <- any(grepl("novel_ml:", log_lines))

  }
  ran_novel_sim_list[[i]] <- ran_sim
}
names(ran_novel_sim_list) <- names(timeout_list)
starttime_line_bools <- grepl("Start               : ", log_lines)

run_robustness(param_space_name = "oceanic_ontogeny_iw", param_set = 219, replicates = 2,save_output = FALSE, test = TRUE)
