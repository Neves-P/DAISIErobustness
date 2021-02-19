plot_error_boxes_grouped <- function(error_metrics_list,
                             error = "spec_nltt",
                             error_metrics_names,
                             xlabels) {
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
  data <- tidyr::gather(data)
  pars_scenario <- unlist(lapply(X = error_metrics_names,
                                 FUN = rep,
                                 larger_vector_size))
  data$key <- ordered(pars_scenario, levels = unique(error_metrics_names))
  island_name <- c(rep("Maui Nui", larger_vector_size),
                   rep("Kauai", larger_vector_size),
                   rep("Maui Nui", larger_vector_size),
                   rep("Kauai", larger_vector_size),
                   rep("Maui Nui", larger_vector_size),
                   rep("Kauai", larger_vector_size),
                   rep("Maui Nui", larger_vector_size),
                   rep("Kauai", larger_vector_size))

  data <- cbind(data, island_name)
  p <- ggplot2::ggplot(data = data, ggplot2::aes(y = value, x = key, fill = island_name)) +
    ggplot2::theme_bw() +
    ggplot2::geom_boxplot(na.rm = TRUE, show.legend = TRUE) +
    ggplot2::scale_fill_brewer(palette = "Pastel1") +
    # ggplot2::scale_x_discrete(labels = xlabels) +
    ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.75) +
    ggplot2::xlab("Number of land-bridges") +
    ggplot2::ylab(error_label) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = ggplot2::rel(1.3))) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = ggplot2::rel(1.4))) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = ggplot2::rel(1.3))) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = ggplot2::rel(1.4))) +
    ggplot2::guides(fill = ggplot2::guide_legend(title = "Island"))
  p
}


