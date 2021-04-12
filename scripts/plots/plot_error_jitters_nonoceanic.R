plot_error_jitters_nonoceanic <- function(error_metrics_list,
                                          error = "spec_nltt",
                                          error_metrics_names,
                                          xlabels,
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
    error_label <- expression(P[95] ~ Delta * "ESTT")
  } else if (error == "nonendemic_nltt") {
    error_label <- expression(P[95] ~ Delta * "NESTT")
  } else if (error == "num_spec") {
    error_label <- expression(P[95] * " Species Number")
  } else if (error == "num_col") {
    error_label <- expression(P[95] * " Colonist Number")
  }

  data <- as.data.frame(do.call(cbind, error_metrics_list))
  data <- tidyr::gather(data)
  pars_scenario <- unlist(lapply(X = error_metrics_names,
                                 FUN = rep,
                                 larger_vector_size))
  data$key <- factor(pars_scenario,
                     ordered = TRUE,
                     levels = unique(pars_scenario)
  )
  Island <- factor(c(rep("Young", length(pars_scenario) / 3),
              rep("Old", length(pars_scenario) / 3),
              rep("Ancient", length(pars_scenario) / 3)),
              levels = c("Young", "Old", "Ancient"),
              ordered = FALSE)


  data <- cbind(data, Island)
  p <- ggplot2::ggplot(data = data, ggplot2::aes(y = value, x = key, color = Island)) +
    ggplot2::theme_bw() +
    ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(0.2)) +
    ggplot2::scale_color_brewer(palette = "Set2") +
    ggplot2::scale_x_discrete(labels = xlabels) +
    ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
    ggplot2::xlab(x_axis_text) +
    ggplot2::ylab(error_label) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 8)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 8)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 8)) +
    ggplot2::guides(fill = ggplot2::guide_legend(title = "Island")) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2))
  p
}
