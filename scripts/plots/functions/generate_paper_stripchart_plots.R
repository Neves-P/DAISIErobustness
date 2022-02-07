generate_paper_stripchart_plots <- function(scenario_res,
                                            partition_by,
                                            x_axis_text,
                                            scenario,
                                            xlabels,
                                            save = TRUE,
                                            add_plot_title = TRUE) {
  metric_to_plot <- c(
    "ed95_spec_nltt",
    "ed95_endemic_nltt",
    "ed95_nonendemic_nltt",
    "ed95_num_spec",
    "ed95_num_col"
  )
  scenario_res <- DAISIErobustness:::append_factor_key(
    scenario_res,
    partition_by = partition_by
  )
  output_list <- list()
  # Cycle over metrics
  for (i in seq_along(metric_to_plot)) {
    p <- plot_error_stripchart_grouped(
      scenario_res,
      error = metric_to_plot[i],
      xlabels,
      x_axis_text,
      scenario,
      save,
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
