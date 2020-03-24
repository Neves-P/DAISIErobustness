#' Plot histogram of errors
#'
#' @param run_robustness
#' @param error
#'
#' @return a plot with two error distibutions
#' @author Pedro Neves, Joshua Lambert
plot_error_dists <- function(run_robustness,
                             error = "spec_nltt",
                             plot_type = "density") {
  if (error == "num_spec") {
    num_spec_error <- spec_error$num_spec
    num_spec_baseline_error <- spec_baseline_error$num_spec
    data <- data.frame(error, baseline_error)
    colnames(data) <- c("Geodynamic error", "Oceanic error")
    data <- tidyr::gather(data) #change gather to pivot_longer
    if (plot_type == "density") {
      ggplot2::ggplot(data = data, ggplot2::aes(x = value, fill = key)) +
        ggplot2::geom_density(alpha = 0.5)
    }
    if (plot_type == "histogram") {
      ggplot2::ggplot(data = data, ggplot2::aes(x = value, fill = key)) +
        ggplot2::geom_histogram(binwidth = 0.2,
                                alpha = 0.5,
                                position = "identity",
                                color="black") +
        ggplot2::theme_bw() +
        ggplot2::ylab("count") +
        ggplot2::xlab("Error")
    }
  }
  if (error == "num_col") {
    num_col_error <- spec_error$num_col
    num_col_baseline_error <- spec_baseline_error$nul_col
    data <- data.frame(error, baseline_error)
    data <- tidyr::gather(data) #change gather to pivot_longer
    if (plot_type == "density") {
      ggplot2::ggplot(data = data, aes(x = value, fill = variable)) +
        ggplot2::geom_density(alpha = 0.5)
    }
    if (plot_type == "histogram") {
      ggplot2::ggplot(data = data, aes(x = value, fill = variable)) +
        ggplot2::geom_histogram(binwidth = 0.5)
    }
  }
  if (error == "spec_nltt") {
    spec_nltt <- spec_error$nltt
    spec_baseline_nltt <- spec_baseline_error$nltt

  }
  if (error == "endemic_nltt") {
    spec_error
    endemic_error
    nonendemic_error
    spec_baseline_error
    endemic_baseline_error
    nonendemic_baseline_error

  }
  if (error == "nonendemic_nltt") {
    spec_error
    endemic_error
    nonendemic_error
    spec_baseline_error
    endemic_baseline_error
    nonendemic_baseline_error

  }
}
