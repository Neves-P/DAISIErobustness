boxplot_error_dists <- function(output_file,
                             error = "spec_nltt") {
  if (error == "spec_nltt") {
    error <- output_file$spec_error$nltt
    baseline_error <- output_file$spec_baseline_error$nltt
  }
  if (error == "endemic_nltt") {
    error <- output_file$endemic_error$nltt
    baseline_error <- output_file$endemic_baseline_error$nltt
  }
  if (error == "nonendemic_nltt") {
    error <- output_file$nonendemic_error$nltt
    baseline_error <- output_file$nonendemic_baseline_error$nltt
  }
  if (error == "num_spec") {
    error <- output_file$spec_error$num_spec_error
    baseline_error <- output_file$spec_baseline_error$num_spec_error
  }
  if (error == "num_col") {
    error <- output_file$spec_error$num_col_error
    baseline_error <- output_file$spec_baseline_error$num_col_error
  }
  data <- data.frame(error, baseline_error)
  colnames(data) <- c("TraiSIE error", "baseline error")
  data <- tidyr::gather(data) #change gather to pivot_longer
  # ggplot2::ggplot(data = data, ggplot2::aes(x = value, fill = key)) +
  #   ggplot2::geom_histogram(binwidth = 1,
  #                           alpha = 0.5,
  #                           position = "identity",
  #                           color="black") +
  #   ggplot2::theme_bw() +
  #   ggplot2::ylab("count") +
  #   ggplot2::xlab("Error")

  # ggplot2::ggplot(data = data, ggplot2::aes(x = key, y = value)) +
  #   geom_boxplot() +
  #   theme_classic() +
  #   geom_signif(comparisons = c("TraiSIE error", "baseline error"), test = wilcox.test, step_increase = 0.2, map_signif_level = T)
  ggplot2::ggplot(data = data, ggplot2::aes(x = key, y = value)) +
    geom_boxplot() +
    ggpubr::stat_compare_means()+
    ggplot2::ylab("error") +
    ggplot2::xlab("Error type")
}
