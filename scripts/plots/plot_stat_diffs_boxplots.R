# Accessory functions for boxplot plotting for Neves et al 2021
compile_stat_diffs <- function(scenario, chunk_size, total_length) {
  folder_path <- file.path("G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results", scenario)
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

generate_paper_boxplots <- function(list_to_plot,
                                 error_metrics_names,
                                 x_axis_text,
                                 scenario,
                                 xlabels,
                                 save = TRUE) {
  metric_to_plot <- c(
    "spec_nltt",
    "endemic_nltt",
    "nonendemic_nltt",
    "num_spec",
    "num_col"
  )

  error_metrics_list <- list()
  output_list <- list()
  # Cycle over metrics
  for (i in seq_along(metric_to_plot)) {
    # Cycle over param space divisions
    for (j in seq_along(list_to_plot)) {
      error_metrics_list[[j]] <- list_to_plot[[j]][[i]]
    }
    p <- plot_error_boxes_grouped(
      error_metrics_list = error_metrics_list,
      error = metric_to_plot[i],
      error_metrics_names = error_metrics_names,
      xlabels = xlabels,
      x_axis_text = x_axis_text
    )
    if (save) {
      ggplot2::ggsave(
        plot = p,
        filename = paste0(scenario, "_", metric_to_plot[i], ".tif"),
        device = "tiff",
        width = 5.2,
        height = 3.9,
        dpi = 300,
        compression = "lzw"
      )
    } else {
      output_list[[i]] <- p
    }
  }
  return(output_list)
}
