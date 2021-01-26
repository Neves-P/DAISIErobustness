ontogeny_spec_nltt_mean_diff <- runif(n = 100, min = 0, max = 100)
sea_level_spec_nltt_mean_diff <- runif(n = 100, min = 0, max = 100)
ontogeny_sea_level_spec_nltt_mean_diff <- runif(n = 100, min = 0, max = 100)
nonoceanic_spec_nltt_mean_diff <- runif(n = 100, min = 0, max = 100)
nonoceanic_land_bridge_spec_nltt_mean_diff <- runif(n = 100, min = 0, max = 100)

data <- data.frame(ontogeny_spec_nltt_mean_diff,
                   sea_level_spec_nltt_mean_diff,
                   ontogeny_sea_level_spec_nltt_mean_diff,
                   nonoceanic_spec_nltt_mean_diff,
                   nonoceanic_land_bridge_spec_nltt_mean_diff)
colnames(data) <- c("Ontogeny", "Sea Level", "Ontogeny + Sea Level",
                    "Non-oceanic", "Non-oceanic + land-bridge")
data <- tidyr::gather(data)

ggplot2::ggplot(data = data, ggplot2::aes(y = value, x = key, fill = key)) +
  ggplot2::geom_boxplot()

ggplot2::ggplot(data = data, ggplot2::aes(y = value, x = key, fill = key)) +
  ggplot2::geom_violin()

plot_error_boxes <- function(error_metrics_list,
                            error = "spec_nltt",
                            parameter_spaces) {

}


