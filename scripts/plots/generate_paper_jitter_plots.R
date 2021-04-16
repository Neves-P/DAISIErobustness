generate_paper_jitter_plots <- function(list_to_plot,
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
    p <- plot_error_jitters_grouped(
      error_metrics_list = error_metrics_list,
      error = metric_to_plot[i],
      error_metrics_names = error_metrics_names,
      xlabels = xlabels,
      x_axis_text = x_axis_text,
      scenario = scenario,
      save = save,
      n_ages = n_ages,
      add_plot_title = add_plot_title
    )
    if (save) {
      ggplot2::ggsave(
        plot = p,
        filename = paste0(scenario, "_", metric_to_plot[i], ".eps"),
        device = "eps",
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
