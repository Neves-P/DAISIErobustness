# Boxplots for nonoceanic vs nonoceanic_land_bridge for
# Neves et al 2021
source("scripts/plots/compile_stat_diffs.R")
source("scripts/plots/generate_paper_jitter_nonoceanic.R")
source("scripts/plots/plot_error_jitters_nonoceanic.R")

nonoceanic_stat_diff <- compile_stat_diffs(
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

xlabel_vec_nonoceanic <- c(expression(atop(Low~x[s], Low~x[n])),
                           expression(atop(High~x[s], Low~x[n])),
                           expression(atop(Low~x[s], High~x[n])),
                           expression(atop(High~x[s], High~x[n])))

nonoceanic_plots <- generate_paper_jitter_nonoceanic(
  list_to_plot = nonoceanic_stat_diff$stat_diffs,
  error_metrics_names = nonoceanic_metrics_names,
  x_axis_text = "Non-oceanic sampling parameters",
  scenario = "nonoceanic",
  xlabels = xlabel_vec_nonoceanic,
  save = TRUE
)



# Faceted
prow <- cowplot::plot_grid(
  nonoceanic_plots[[1]] + ggplot2::theme(legend.position = "none", axis.title.x = ggplot2::element_blank()) + ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  nonoceanic_plots[[2]] + ggplot2::theme(legend.position = "none", axis.title.x = ggplot2::element_blank()) + ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  nonoceanic_plots[[3]] + ggplot2::theme(legend.position = "none", axis.title.x = ggplot2::element_blank()) + ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  align = 'vh',
  labels = c("a", "b", "c"),
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

final_nonoceanic_facet <- cowplot::add_sub(
  nonoceanic_facet,
  "Non-oceanic sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 8
)


ggplot2::ggsave(
  plot = final_nonoceanic_facet,
  filename = "nonoceanic_fact.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_nonoceanic_facet,
  filename = "nonoceanic_fact.eps",
  device = "eps",
  width = 168,
  height = 100,
  units = "mm"
)
