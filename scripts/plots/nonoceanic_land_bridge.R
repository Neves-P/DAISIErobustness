# Strip charts for nonoceanic_land_bridge lb effect for Neves et al 2021
source("scripts/plots/functions/compile_ed95s.R")
source("scripts/plots/functions/plot_error_stripchart_grouped.R")
source("scripts/plots/functions/generate_paper_stripchart_plots.R")
source("scripts/plots/functions/save_faceted.R")
source("scripts/plots/functions/tidy_data.R")
nonoceanic_land_bridge_stat_diff <- compile_ed95s(
  scenario = "nonoceanic_land_bridge",
  chunk_size = 8,
  total_length = 256
)

nonoceanic_land_bridge_metrics_names <- c("l_l", "h_l", "l_h", "h_h", "l_l", "h_l", "l_h", "h_h")

xlabel_vec <- c("Low x  \nLow d",
                "High x  \nLow d",
                "Low x  \nHigh d",
                "High x  \nHigh d")

nonoceanic_land_bridge_plots <- generate_paper_stripchart_plots(
  list_to_plot = nonoceanic_land_bridge_stat_diff$ed95s,
  error_metrics_names = nonoceanic_land_bridge_metrics_names,
  x_axis_text = "Non-oceanic sampling parameters",
  scenario = "nonoceanic_land_bridge",
  xlabels = xlabel_vec,
  save = FALSE,
  add_plot_title = FALSE
)


# Figure out ylim
plot_1_ylim <-
  ggplot2::layer_scales(nonoceanic_land_bridge_plots[[1]])$y$range$range[2]
plot_2_ylim <-
  ggplot2::layer_scales(nonoceanic_land_bridge_plots[[2]])$y$range$range[2]
plot_3_ylim <-
  ggplot2::layer_scales(nonoceanic_land_bridge_plots[[3]])$y$range$range[2]
faceted_ylim <- max(plot_1_ylim, plot_2_ylim, plot_3_ylim)
prow <- cowplot::plot_grid(
  nonoceanic_land_bridge_plots[[1]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank(),
    plot.margin = ggplot2::margin(6, 1.5, 6, 1.5)) +
    ggplot2::ylim(0, faceted_ylim),
  nonoceanic_land_bridge_plots[[2]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank(),
    plot.margin = ggplot2::margin(6, 1.5, 6, 1.5)) +
    ggplot2::ylim(0, faceted_ylim),
  nonoceanic_land_bridge_plots[[3]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank(),
    plot.margin = ggplot2::margin(6, 1.5, 6, 1.5)) +
    ggplot2::ylim(0, faceted_ylim),
  align = 'vh',
  labels = c("(a)", "(b)", "(c)"),
  label_size = 10.5,
  hjust = -0.2,
  nrow = 1
)

# Figure out ylim
plot_1_ylim <-
  ggplot2::layer_scales(nonoceanic_land_bridge_plots[[4]])$y$range$range[2]
plot_2_ylim <-
  ggplot2::layer_scales(nonoceanic_land_bridge_plots[[5]])$y$range$range[2]
faceted_ylim <- max(plot_1_ylim, plot_2_ylim)
prow_spec_col <- cowplot::plot_grid(
  nonoceanic_land_bridge_plots[[4]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank(),
    plot.margin = ggplot2::margin(6, 1.5, 6, 1.5)) +
    ggplot2::ylim(0, faceted_ylim),
  nonoceanic_land_bridge_plots[[5]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank(),
    plot.margin = ggplot2::margin(6, 1.5, 6, 1.5)) +
    ggplot2::ylim(0, faceted_ylim),
  align = 'vh',
  labels = c("(a)", "(b)", "(c)"),
  label_size = 10.5,
  hjust = -0.2,
  nrow = 1
)

legend <- cowplot::get_legend(
  # create some space to the left of the legend
  nonoceanic_land_bridge_plots[[1]] + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 2))
)

final_land_bridge <- cowplot::plot_grid(prow, legend, rel_widths = c(3, 0.6))
final_land_bridge_spec_col <- cowplot::plot_grid(prow_spec_col, legend, rel_widths = c(3, 0.6))

final_land_bridge <- cowplot::add_sub(
  final_land_bridge,
  "Non-oceanic sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 10
)

final_land_bridge_spec_col <- cowplot::add_sub(
  final_land_bridge_spec_col,
  "Non-oceanic sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 10
)

ggplot2::ggsave(
  plot = final_land_bridge,
  filename = "nonoceanic_lb_sampling_facet.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_land_bridge,
  filename = "nonoceanic_lb_sampling_facet.pdf",
  device = "pdf",
  width = 168,
  height = 100,
  units = "mm"
)

ggplot2::ggsave(
  plot = final_land_bridge_spec_col,
  filename = "nonoceanic_lb_sampling_spec_col_facet.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_land_bridge_spec_col,
  filename = "nonoceanic_lb_sampling_spec_col_facet.pdf",
  device = "pdf",
  width = 168,
  height = 100,
  units = "mm"
)
