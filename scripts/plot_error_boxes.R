plot_error_boxes <- function(error_metrics_list,
                             error = "spec_nltt",
                             error_metrics_names,
                             x_axis_text) {
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
    error_label <- expression(P[95] ~ Delta * "STT")
  } else if (error == "endemic_nltt") {
    error_label <- expression(P[95] ~ Delta * "endTT")
  } else if (error == "nonendemic_nltt") {
    error_label <- expression(P[95] ~ Delta * "nonendTT")
  } else if (error == "num_spec") {
    error_label <- expression(P[95] * " Species Number")
  } else if (error == "num_col") {
    error_label <- expression(P[95] * " Colonist Number")
  }

  data <- as.data.frame(do.call(cbind, error_metrics_list))
  colnames(data) <- error_metrics_names
  data <- tidyr::gather(data)
  data$key <- factor(
    data$key,
    error_metrics_names
  )

  p <- ggplot2::ggplot(data = data, ggplot2::aes(y = value, x = key, fill = key)) +
    ggplot2::theme_bw() +
    ggplot2::geom_boxplot(na.rm = TRUE, show.legend = FALSE) +
    ggplot2::scale_fill_manual(values = c(rep("#66C2A5", 3), rep("#FC8D62", 2))) +
    ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
    ggplot2::ylab(error_label) +
    ggplot2::xlab(x_axis_text) +
    ggplot2::scale_y_continuous(labels = function(x){sprintf("%.3f", x)}) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 10)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 10)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 8)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2))
 p
}


