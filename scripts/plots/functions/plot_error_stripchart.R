plot_error_stripchart <- function(scenarios_res,
                                  error = "spec_nltt",
                                  scenario,
                                  x_axis_text) {
  error_metrics_sizes <- sapply(X = scenarios_res, FUN = length)
  larger_vector_size <- max(error_metrics_sizes)
  for (i in seq_along(scenarios_res)) {
    n_elements_to_append <- larger_vector_size - length(scenarios_res[[i]])

    scenarios_res[[i]] <- c(
      scenarios_res[[i]],
      rep(NA, n_elements_to_append)
    )
  }

  if (error == "ed95_spec_nltt") {
    error_label <- expression(ED[95] ~ Delta * "STT")
  } else if (error == "ed95_endemic_nltt") {
    error_label <- expression(ED[95] ~ Delta * "ESTT")
  } else if (error == "ed95_nonendemic_nltt") {
    error_label <- expression(ED[95] ~ Delta * "NESTT")
  } else if (error == "ed95_num_spec") {
    error_label <- expression(ED[95] * " N Spec")
  } else if (error == "ed95_num_col") {
    error_label <- expression(ED[95] * " N Col")
  }

  data <- as.data.frame(do.call(cbind, scenarios_res))
  colnames(data) <- scenario
  data <- tidyr::gather(data)
  data$key <- factor(
    data$key,
    scenario
  )


  # Compute N per strip and make it into legend
  data_no_na <- na.omit(data)
  n_df <- data_no_na |> dplyr::group_by(key) |>
    dplyr::tally()
  label_ns <- c()
  label_ns <- paste0(scenario, "\nN = ", as.character(n_df$n))


    p <- ggplot2::ggplot(data = data, ggplot2::aes(y = value, x = key, color = key)) +
      ggplot2::theme_classic() +
      ggplot2::geom_jitter(cex = 0.5) +
      ggplot2::ylim(0, 1) +
      ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.4) +
      ggplot2::ylab(error_label) +
      ggplot2::scale_x_discrete(labels = label_ns) +
      ggplot2::theme(axis.title.y = ggplot2::element_text(size = 8)) +
      ggplot2::theme(axis.title.x = ggplot2::element_blank()) +
      ggplot2::theme(axis.text.x = ggplot2::element_text(size = 8)) +
      ggplot2::theme(axis.text.y = ggplot2::element_text(size = 8)) +
      # ggplot2::theme(axis.text.x = ggplot2::element_text()) +
      ggplot2::theme(legend.position = "none") +
      ggplot2::theme(plot.margin = ggplot2::margin(6, 0.7, 6, 0.7))
    p
  }
