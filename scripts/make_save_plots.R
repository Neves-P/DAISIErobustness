
compile_stat_diffs <- function(scenario, lenght_section, total_length) {
folder_path <- file.path("G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results", scenario)
  for (variable in vector) {

  }

oceanic_ontogeny_m_low_low <- calc_stat_diff(folder_path, 1:48)
oceanic_ontogeny_m_high_low <- calc_stat_diff(folder_path, 49:96)
oceanic_ontogeny_m_low_high <- calc_stat_diff(folder_path, 97:144)
oceanic_ontogeny_m_high_high <- calc_stat_diff(folder_path, 145:192)
oceanic_ontogeny_k_low_low <- calc_stat_diff(folder_path, 193:240)
oceanic_ontogeny_k_high_low <- calc_stat_diff(folder_path, 241:288)
oceanic_ontogeny_k_low_high  <- calc_stat_diff(folder_path, 289:336)
oceanic_ontogeny_k_high_high <- calc_stat_diff(folder_path, 337:384)
}
beepr::beep(8)

oceanic_ontogeny_input <- list(
  oceanic_ontogeny_m_low_low,
  oceanic_ontogeny_k_low_low,
  oceanic_ontogeny_m_high_low,
  oceanic_ontogeny_k_high_low,
  oceanic_ontogeny_m_low_high,
  oceanic_ontogeny_k_low_high,
  oceanic_ontogeny_m_high_high,
  oceanic_ontogeny_k_high_high
)


generate_paper_plots <- function(list_to_plot,
                                 error_metrics_names,
                                 x_axis_text,
                                 scenario) {
  metric_to_plot <- c(
    "spec_nltt",
    "endemic_nltt",
    "nonendemic_nltt",
    "num_spec",
    "num_col"
  )

  error_metrics_list <- list()

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
    ggplot2::ggsave(
      plot = p,
      filename = paste0(scenario, "_", metric_to_plot[i], ".tiff"),
      device = "tiff",
      width = 5.2,
      height = 3.9,
      dpi = 300,
      compression = "lzw"
    )
  }
}


