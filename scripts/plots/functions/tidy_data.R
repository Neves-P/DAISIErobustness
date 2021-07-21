tidy_data <- function(error_metrics_list, error_metrics_names, n_ages = 2) {

  # Buffer with NAs
  error_metrics_sizes <- sapply(X = error_metrics_list, FUN = length)
  larger_vector_size <- max(error_metrics_sizes)
  for (i in seq_along(error_metrics_list)) {
    n_elements_to_append <- larger_vector_size - length(error_metrics_list[[i]])
    error_metrics_list[[i]] <- c(
      error_metrics_list[[i]],
      rep(NA, n_elements_to_append)
    )
  }
  # Build dataframe
  data <- as.data.frame(do.call(cbind, error_metrics_list))
  data <- tidyr::gather(data)
  pars_scenario <- unlist(lapply(X = error_metrics_names,
                                 FUN = rep,
                                 larger_vector_size))
  data$key <- factor(pars_scenario,
                     ordered = TRUE,
                     levels = unique(pars_scenario)
  )
  if (n_ages == 2) {
    Island <- factor(c(rep("Young", length(pars_scenario) / 2),
                       rep("Old", length(pars_scenario) / 2)),
                     levels = c("Young", "Old"),
                     ordered = FALSE)
  } else if (n_ages == 3) {
    Island <- factor(c(rep("Young", length(pars_scenario) / 3),
                       rep("Old", length(pars_scenario) / 3),
                       rep("Ancient", length(pars_scenario) / 3)),
                     levels = c("Young", "Old", "Ancient"),
                     ordered = FALSE)
  }
  data <- cbind(data, Island)

  # Compute N per strip and make it into legend
  data_no_na <- na.omit(data)
  n_df <- data_no_na %>% dplyr::group_by(key, Island) %>%
    dplyr::tally() %>% dplyr::arrange(Island)
  return(list(data = data, n_df = n_df))
}
