# Boxplots for nonoceanic vs nonoceanic_land_bridge for
# Neves et al 2021
source("scripts/plots/plot_error_jitters_grouped.R")
source("scripts/plots/generate_paper_jitter_plots.R")
nonoceanic_land_bridge_stat_diff <- compile_stat_diffs(
  scenario = "nonoceanic_land_bridge",
  chunk_size = 32,
  total_length = 256
)

nonoceanic_land_bridge_metrics_names <- c(
  "l",
  "h",
  "l",
  "h",
  "l",
  "h",
  "l",
  "h"
)

xlabel_vec <- c("2",
                "10",
                "2",
                "10")
nonoceanic_land_bridge_plots <- generate_paper_jitter_plots(
  list_to_plot = nonoceanic_land_bridge_stat_diff$stat_diffs,
  error_metrics_names = nonoceanic_land_bridge_metrics_names,
  x_axis_text = "Land-bridge immigration multiplier",
  scenario = "nonoceanic_land_bridge",
  xlabels = xlabel_vec,
  save = FALSE
)


prow <- cowplot::plot_grid(
  nonoceanic_land_bridge_plots[[1]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank(),
    plot.margin = ggplot2::margin(6, 1.5, 6, 1.5)),
  nonoceanic_land_bridge_plots[[2]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank(),
    plot.margin = ggplot2::margin(6, 1.5, 6, 1.5)),
  nonoceanic_land_bridge_plots[[3]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank(),
    plot.margin = ggplot2::margin(6, 1.5, 6, 1.5)),
  align = 'vh',
  labels = c("a", "b", "c"),
  hjust = -0.2,
  nrow = 1
)

legend <- cowplot::get_legend(
  # create some space to the left of the legend
  nonoceanic_land_bridge_plots[[1]] + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 2))
)

final_land_bridge <- cowplot::plot_grid(prow, legend, rel_widths = c(3, 0.6))

final_land_bridge <- cowplot::add_sub(
  final_land_bridge,
  "Land-bridge immigration multiplier",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 10
)

ggplot2::ggsave(
  plot = final_land_bridge,
  filename = "nonoceanic_lb_fact.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_land_bridge,
  filename = "nonoceanic_lb_fact.eps",
  device = "eps",
  width = 168,
  height = 100,
  units = "mm"
)
