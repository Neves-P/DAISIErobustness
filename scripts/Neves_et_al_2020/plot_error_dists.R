#' Plot histogram of errors
#'
#' @param run_robustness
#' @param error
#'
#' @return a plot with two error distibutions
#' @author Pedro Neves, Joshua Lambert
plot_error_dists <- function(output_file,
                             error = "spec_nltt") {
  if (error == "spec_nltt") {
    error <- output_file$spec_error$nltt
    baseline_error <- output_file$spec_baseline_error$nltt
  } else if (error == "endemic_nltt") {
    error <- output_file$endemic_error$nltt
    baseline_error <- output_file$endemic_baseline_error$nltt
  } else if (error == "nonendemic_nltt") {
    error <- output_file$nonendemic_error$nltt
    baseline_error <- output_file$nonendemic_baseline_error$nltt
  } else if (error == "num_spec") {
    error <- output_file$spec_error$num_spec_error
    baseline_error <- output_file$spec_baseline_error$num_spec_error
  } else if (error == "num_col") {
    error <- output_file$spec_error$num_col_error
    baseline_error <- output_file$spec_baseline_error$num_col_error
  }
    data <- data.frame(error, baseline_error)
    colnames(data) <- c("Geodynamic error", "Oceanic error")
    data <- tidyr::gather(data) #change gather to pivot_longer
    ggplot2::ggplot(data = data, ggplot2::aes(x = value, fill = key)) +
      ggplot2::geom_histogram(binwidth = 1,
                              alpha = 0.5,
                              position = "identity",
                              color = "black") +
      ggplot2::theme_bw() +
      ggplot2::ylab("count") +
      ggplot2::xlab("Error")
  }
