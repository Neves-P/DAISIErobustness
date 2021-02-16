plot_error_boxes <- function(error_metrics_list,
                             error = "spec_nltt",
                             error_metrics_names) {
  colnames(data) <- c("key", "value")

  data <- data.frame(island = c(rep("maui_nui", 180), rep("kauai", 187)), spec_nltt_diff = c(maui_nui, kauai))

  ggplot2::ggplot(data = data, ggplot2::aes(y = value, x = key, fill = key)) +
    ggplot2::geom_boxplot() + ggplot2::xlab("Island") + ggplot2::ylab(expression(P[95]*" species number" * Delta * " nLTT"))

}


