#' Plot histogram of errors
#'
#' @param run_robustness
#' @param error
#'
#' @return a plot with two error distributions
#' @author Pedro Neves, Joshua Lambert
plot_error_dists <- function(output_file,
                             error = "spec_nltt",
                             param_set) {
  if (error == "spec_nltt") {
    error <- output_file$spec_error$nltt
    baseline_error <- output_file$spec_baseline_error$nltt
    error_label <- " species \u0394nLTT"
  } else if (error == "endemic_nltt") {
    error <- output_file$endemic_error$nltt
    baseline_error <- output_file$endemic_baseline_error$nltt
    error_label <- " endemic species \u0394nLTT"
  } else if (error == "nonendemic_nltt") {
    error <- output_file$nonendemic_error$nltt
    baseline_error <- output_file$nonendemic_baseline_error$nltt
    error_label <- " nonendemic species \u0394nLTT"
  } else if (error == "num_spec") {
    error <- output_file$spec_error$num_spec_error
    baseline_error <- output_file$spec_baseline_error$num_spec_error
    error_label <- " species number"
  } else if (error == "num_col") {
    error <- output_file$spec_error$num_col_error
    baseline_error <- output_file$spec_baseline_error$num_col_error
    error_label <- " colonist number"
  }
    data <- data.frame(error, baseline_error)
    colnames(data) <- c("Geodynamic error", "Oceanic error")
    data <- tidyr::gather(data) #change gather to pivot_longer
    title_label <- paste0("Parameter set ", param_set, error_label)

    ggplot2::ggplot(data = data, ggplot2::aes(x = value, fill = key)) +
      ggplot2::geom_histogram(binwidth = 1,
                              alpha = 0.5,
                              position = "identity",
                              color = "black") +
      ggplot2::theme_bw() +
      ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.5)) +
      ggplot2::ylab("Count") +
      ggplot2::xlab("Error") +
      ggplot2::ggtitle(title_label)

  }
