# Strip charts for nonoceanic for Neves et al 2021
source("scripts/plots/compile_ed95s.R")
source("scripts/plots/plot_error_stripchart_grouped.R")
source("scripts/plots/generate_paper_stripchart_plots.R")

nonoceanic_stat_diff <- compile_ed95s(
  scenario = "nonoceanic",
  chunk_size = 48,
  total_length = 576
)

nonoceanic_metrics_names <- c(
  "l_l",
  "h_l",
  "l_h",
  "h_h",
  "l_l",
  "h_l",
  "l_h",
  "h_h",
  "l_l",
  "h_l",
  "l_h",
  "h_h"
)

xlabel_vec_nonoceanic <- c("Low x<sub>s</sub>  \nLow x<sub>n</sub>",
                           "High x<sub>s</sub>  \nLow x<sub>n</sub>",
                           "Low x<sub>s</sub>  \nHigh x<sub>n</sub>",
                           "High x<sub>s</sub>  \nHigh x<sub>n</sub>")

nonoceanic_plots <- generate_paper_stripchart_plots(
  list_to_plot = nonoceanic_stat_diff$stat_diffs,
  error_metrics_names = nonoceanic_metrics_names,
  x_axis_text = "Non-oceanic sampling parameters",
  scenario = "nonoceanic",
  xlabels = xlabel_vec_nonoceanic,
  save = FALSE,
  n_ages = 3,
  add_plot_title = FALSE
)

# Figure out ylim
plot_1_ylim <- ggplot2::layer_scales(nonoceanic_plots[[1]])$y$range$range[2]
plot_2_ylim <- ggplot2::layer_scales(nonoceanic_plots[[2]])$y$range$range[2]
plot_3_ylim <- ggplot2::layer_scales(nonoceanic_plots[[3]])$y$range$range[2]
faceted_ylim <- max(plot_1_ylim, plot_2_ylim, plot_3_ylim)
# Faceted
prow <- cowplot::plot_grid(
  nonoceanic_plots[[1]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  nonoceanic_plots[[2]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  nonoceanic_plots[[3]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  align = 'vh',
  labels = c("a", "b", "c"),
  hjust = -0.2,
  nrow = 1
)

plot_1_ylim <- ggplot2::layer_scales(nonoceanic_plots[[4]])$y$range$range[2]
plot_2_ylim <- ggplot2::layer_scales(nonoceanic_plots[[5]])$y$range$range[2]
faceted_ylim <- max(plot_1_ylim, plot_2_ylim)
prow_spec_col <- cowplot::plot_grid(
  nonoceanic_plots[[4]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  nonoceanic_plots[[5]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  align = 'vh',
  labels = c("a", "b"),
  hjust = -0.2,
  nrow = 1
)

legend <- cowplot::get_legend(
  # create some space to the left of the legend
  nonoceanic_plots[[1]] + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 4))
)

nonoceanic_facet <- cowplot::plot_grid(
  prow,
  legend,
  rel_widths = c(3, 0.4)
)
nonoceanic_spec_col_facet <- cowplot::plot_grid(
  prow_spec_col,
  legend,
  rel_widths = c(3, 0.4)
)

final_nonoceanic_facet <- cowplot::add_sub(
  nonoceanic_facet,
  "Non-oceanic sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 8
)

final_nonoceanic_spec_col_facet <- cowplot::add_sub(
  nonoceanic_spec_col_facet,
  "Non-oceanic sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 8
)


ggplot2::ggsave(
  plot = final_nonoceanic_facet,
  filename = "nonoceanic_facet.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_nonoceanic_facet,
  filename = "nonoceanic_facet.eps",
  device = "eps",
  width = 168,
  height = 100,
  units = "mm"
)
ggplot2::ggsave(
  plot = final_nonoceanic_spec_col_facet,
  filename = "nonoceanic_spec_col_facet_.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_nonoceanic_spec_col_facet,
  filename = "nonoceanic_spec_col_facet.eps",
  device = "eps",
  width = 168,
  height = 100,
  units = "mm"
)
