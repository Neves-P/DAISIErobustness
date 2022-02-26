# Strip charts for continental for Neves et al 2022
# Fig 6 S12
source("scripts/plots/functions/compile_ed95s.R")
source("scripts/plots/functions/plot_error_stripchart_grouped.R")
source("scripts/plots/functions/generate_paper_stripchart_plots.R")
source("scripts/plots/functions/tidy_data.R")

continental_stat_diff <- rbind(
  compile_ed95s(param_space_name = "continental_cs"),
  compile_ed95s(param_space_name = "continental_di"),
  compile_ed95s(param_space_name = "continental_iw")
)

xlabel_vec <- c("Low x<sub>s</sub>  \nLow x<sub>n</sub>",
                           "High x<sub>s</sub>  \nLow x<sub>n</sub>",
                           "Low x<sub>s</sub>  \nHigh x<sub>n</sub>",
                           "High x<sub>s</sub>  \nHigh x<sub>n</sub>")

continental_plots <- generate_paper_stripchart_plots(
  scenario_res = continental_stat_diff,
  x_axis_text = "Continental sampling parameters",
  scenario = "continental",
  partition_by = "sample_parameters",
  xlabels = xlabel_vec,
  save = FALSE,
  add_plot_title = FALSE
)

# Figure out ylim
plot_1_ylim <- ggplot2::layer_scales(continental_plots[[1]])$y$range$range[2]
plot_2_ylim <- ggplot2::layer_scales(continental_plots[[2]])$y$range$range[2]
plot_3_ylim <- ggplot2::layer_scales(continental_plots[[3]])$y$range$range[2]
faceted_ylim <- max(plot_1_ylim, plot_2_ylim, plot_3_ylim)
# Faceted
prow <- cowplot::plot_grid(
  continental_plots[[1]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  continental_plots[[2]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  continental_plots[[3]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  align = 'vh',
  labels = c("(a)", "(b)", "(c)"),
  label_size = 10.5,
  hjust = -0.2,
  nrow = 1
)

plot_1_ylim <- ggplot2::layer_scales(continental_plots[[4]])$y$range$range[2]
plot_2_ylim <- ggplot2::layer_scales(continental_plots[[5]])$y$range$range[2]
faceted_ylim <- max(plot_1_ylim, plot_2_ylim)
prow_spec_col <- cowplot::plot_grid(
  continental_plots[[4]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  continental_plots[[5]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  align = 'vh',
  labels = c("(a)", "(b)"),
  label_size = 10.5,
  hjust = -0.2,
  nrow = 1
)

legend <- cowplot::get_legend(
  # create some space to the left of the legend
  continental_plots[[1]] + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 4))
)

continental_facet <- cowplot::plot_grid(
  prow,
  legend,
  rel_widths = c(3, 0.4)
)
continental_spec_col_facet <- cowplot::plot_grid(
  prow_spec_col,
  legend,
  rel_widths = c(3, 0.4)
)

final_continental_facet <- cowplot::add_sub(
  continental_facet,
  "Continental sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 8
)

final_continental_spec_col_facet <- cowplot::add_sub(
  continental_spec_col_facet,
  "Continental sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 8
)


ggplot2::ggsave(
  plot = final_continental_facet,
  filename = "continental_facet.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_continental_facet,
  filename = "continental_facet.pdf",
  device = "pdf",
  width = 168,
  height = 100,
  units = "mm"
)
ggplot2::ggsave(
  plot = final_continental_spec_col_facet,
  filename = "continental_spec_col_facet_.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_continental_spec_col_facet,
  filename = "continental_spec_col_facet.pdf",
  device = "pdf",
  width = 168,
  height = 100,
  units = "mm"
)
