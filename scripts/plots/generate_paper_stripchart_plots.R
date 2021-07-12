generate_paper_stripchart_plots <- function(list_to_plot,
                                        error_metrics_names,
                                        x_axis_text,
                                        scenario,
                                        xlabels,
                                        save = TRUE,
                                        n_ages = 2,
                                        add_plot_title = TRUE) {
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
    data_n_df <- tidy_data(
      error_metrics_list = error_metrics_list,
      error_metrics_names = error_metrics_names,
      n_ages = n_ages
    )
    p <- plot_error_stripchart_grouped(
      data_n_df = data_n_df,
      error = metric_to_plot[i],
      xlabels = xlabels,
      x_axis_text = x_axis_text,
      scenario = scenario,
      n_ages = n_ages,
      save = save,
      add_plot_title = add_plot_title
    )
    if (save) {
      ggplot2::ggsave(
        plot = p,
        filename = paste0(scenario, "_", metric_to_plot[i], ".pdf"),
        device = "pdf",
        width = 168,
        height = 100,
        units = "mm"
      )
      ggplot2::ggsave(
        plot = p,
        filename = paste0(scenario, "_", metric_to_plot[i], ".png"),
        device = "png",
        width = 168,
        height = 100,
        units = "mm",
        dpi = 600
      )
    } else {
      output_list[[i]] <- p
    }
  }
  return(output_list)
}
