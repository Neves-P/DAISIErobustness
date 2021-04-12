# Accessory functions for boxplot plotting for Neves et al 2021
compile_stat_diffs <- function(scenario, chunk_size, total_length) {
  folder_path <- file.path("G:\\Shared drives\\DAISIE-RUG\\Josh_Pedro_paper\\results", scenario)
  n_chunks <- total_length / chunk_size
  testit::assert("Is whole number", identical(round(n_chunks), n_chunks))

  lower_range <- seq(from = 1, to = total_length, by = chunk_size)
  upper_range <- seq(from = 0, to = total_length, by = chunk_size)[-1]
  testit::assert(identical(length(lower_range), length(upper_range)))
  testit::assert(identical(upper_range[length(upper_range)], total_length))

  stat_diffs <- list()
  n_data <- c()
  for (i in seq_len(n_chunks)) {
    stat_diffs[[i]] <- calc_stat_diff(folder_path, lower_range[i]:upper_range[i])
    n_data[i] <- length(stat_diffs[[i]][[1]])
  }
  return(list(
    stat_diffs = stat_diffs,
    n_data = n_data))
}
