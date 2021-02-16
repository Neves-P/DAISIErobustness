plot_error_boxes <- function(error_metrics_list,
                             error = "spec_nltt",
                             error_metrics_names) {
  error_metrics_sizes <- sapply(X = error_metrics_list, FUN = length)
  larger_vector_size <- max(error_metrics_sizes)
  for (i in seq_along(error_metrics_list)) {
    n_elements_to_append <- larger_vector_size - length(error_metrics_list[[i]])

    error_metrics_list[[i]] <- c(
      error_metrics_list[[i]],
      rep(NA, n_elements_to_append)
    )
  }

  if (error == "spec_nltt") {
    error_label <- expression(P[95] * " species number " * Delta * "nLTT")
  } else if (error == "endemic_nltt") {
    error_label <- expression(P[95] * " endemic species number " * Delta * "nLTT")
  } else if (error == "nonendemic_nltt") {
    error_label <- expression(P[95]* " non-endemic species number " * Delta * "nLTT")
  } else if (error == "num_spec") {
    error_label <- expression(P[95]* " species number")
  } else if (error == "num_col") {
    error_label <- expression(P[95]* " colonist number")
  }

  data <- as.data.frame(do.call(cbind, error_metrics_list))
  colnames(data) <- error_metrics_names
  data <- tidyr::gather(data)
  p <- ggplot2::ggplot(data = data, ggplot2::aes(y = value, x = key, fill = key)) +
    ggplot2::geom_boxplot(na.rm = TRUE, show.legend = FALSE) + ggplot2::xlab("Island") + ggplot2::ylab(error_label)
 p
}


