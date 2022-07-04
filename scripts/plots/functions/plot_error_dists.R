#' Plot histogram of errors
#'
#' @param output_file
#' @param error
#'
#' @return a plot with two error distributions
#' @author Pedro Santos Neves, Joshua W. Lambert
plot_error_dists <- function(output_file,
                             error = "spec_nltt") {
  if (error == "spec_nltt") {
    error <- output_file$spec_nltt_error
    baseline_error <- output_file$spec_baseline_nltt_error
    error_label <- " species \u0394nLTT"
  } else if (error == "endemic_nltt") {
    error <- output_file$endemic_nltt_error
    baseline_error <- output_file$endemic_baseline_nltt_error
    error_label <- " endemic species \u0394nLTT"
  } else if (error == "nonendemic_nltt") {
    error <- output_file$nonendemic_nltt_error
    baseline_error <- output_file$nonendemic_baseline_nltt_error
    error_label <- " nonendemic species \u0394nLTT"
  } else if (error == "num_spec") {
    error <- output_file$num_spec_error
    baseline_error <- output_file$num_spec_baseline_error
    error_label <- " species number"
  } else if (error == "num_col") {
    error <- output_file$num_col_error
    baseline_error <- output_file$num_col_baseline_error
    error_label <- " colonist number"
  }

  boundary <- quantile(baseline_error, 0.95)
  data <- data.frame(error, baseline_error)

  colnames(data) <- c("Error", "Baseline error")
  data <- tidyr::gather(data) #change gather to pivot_longer

  ggplot2::ggplot(data = data, ggplot2::aes(x = value, fill = key)) +
    ggplot2::geom_histogram(bins = 40,
                            alpha = 0.5,
                            position = "identity",
                            color = "black") +
    ggplot2::theme_classic() +
    ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.7)) +
    ggplot2::scale_fill_brewer(
      palette = "Set2",
      name = "",
      labels = c(expression(E[0]), paste0(expression(E), " "))) +
    ggplot2::theme(legend.box.just = "right") +
    ggplot2::geom_vline(
      xintercept = boundary,
      linetype = "dashed",
      colour = "#FC8D62",
      size = 0.5) +
    ggplot2::xlab("Error") +
    ggplot2::theme(axis.title.y = ggplot2::element_blank()) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 8)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 5, 6, 5))
}
