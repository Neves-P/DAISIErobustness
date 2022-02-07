# Fig S10 - S11
# Strip charts for continental land bridge by sample parameter for Neves et al 2022
library(DAISIErobustness)
source("scripts/plots/functions/compile_ed95s.R")
source("scripts/plots/functions/plot_error_stripchart_grouped.R")
source("scripts/plots/functions/generate_paper_stripchart_plots.R")
source("scripts/plots/functions/tidy_data.R")

continental_land_bridge_ed95s <- rbind(
  compile_ed95s("continental_land_bridge_cs"),
  compile_ed95s("continental_land_bridge_di"),
  compile_ed95s("continental_land_bridge_iw")
)



xlabel <- c(
  "Low x<sub>s</sub>  \nLow x<sub>n</sub>",
  "High x<sub>s</sub>  \nLow x<sub>n</sub>",
  "Low x<sub>s</sub>  \nHigh x<sub>n</sub>",
  "High x<sub>s</sub>  \nHigh x<sub>n</sub>"
)

continental_land_bridge_plots <- generate_paper_stripchart_plots(
  scenario_res = continental_land_bridge_ed95s,
  partition_by = "sample_parameters",
  x_axis_text = "Continental land-bridge sampling parameters",
  scenario = "continental_land_bridge",
  xlabels = xlabel,
  save = FALSE,
  add_plot_title = FALSE
)

# Figure out ylim
plot_1_ylim <- ggplot2::layer_scales(continental_land_bridge_plots[[1]])$y$range$range[2]
plot_2_ylim <- ggplot2::layer_scales(continental_land_bridge_plots[[2]])$y$range$range[2]
plot_3_ylim <- ggplot2::layer_scales(continental_land_bridge_plots[[3]])$y$range$range[2]
faceted_ylim <- max(plot_1_ylim, plot_2_ylim, plot_3_ylim)
# Faceted
prow <- cowplot::plot_grid(
  continental_land_bridge_plots[[1]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  continental_land_bridge_plots[[2]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  continental_land_bridge_plots[[3]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  align = 'vh',
  labels = c("(a)", "(b)", "(c)"),
  label_size = 10.5,
  hjust = -0.2,
  nrow = 1
)

# plot_1_ylim <- ggplot2::layer_scales(continental_land_bridge_plots[[4]])$y$range$range[2]
# plot_2_ylim <- ggplot2::layer_scales(continental_land_bridge_plots[[5]])$y$range$range[2]
faceted_ylim <- 0.6
prow_spec_col <- cowplot::plot_grid(
  continental_land_bridge_plots[[4]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  continental_land_bridge_plots[[5]] + ggplot2::theme(
    legend.position = "none", axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, faceted_ylim) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)),
  align = 'vh',
  labels = c("(a)", "(b)"),
  label_size = 10.5,
  hjust = -0.2,
  nrow = 1
)

legend <- cowplot::get_legend(
  # create some space to the left of the legend
  continental_land_bridge_plots[[1]] + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 4))
)

continental_land_bridge_facet <- cowplot::plot_grid(
  prow,
  legend,
  rel_widths = c(3, 0.4)
)
continental_land_bridge_spec_col_facet <- cowplot::plot_grid(
  prow_spec_col,
  legend,
  rel_widths = c(3, 0.4)
)

final_continental_land_bridge_facet <- cowplot::add_sub(
  continental_land_bridge_facet,
  "Continental land-bridge sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 8
)

final_continental_land_bridge_spec_col_facet <- cowplot::add_sub(
  continental_land_bridge_spec_col_facet,
  "Continental land-bridge sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 4.5,
  size = 8
)


ggplot2::ggsave(
  plot = final_continental_land_bridge_facet,
  filename = "continental_land_bridge_sample_facet.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_continental_land_bridge_facet,
  filename = "continental_land_bridge_sample_facet.pdf",
  device = "pdf",
  width = 168,
  height = 100,
  units = "mm"
)
ggplot2::ggsave(
  plot = final_continental_land_bridge_spec_col_facet,
  filename = "continental_land_bridge_sample_spec_col_facet_.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_continental_land_bridge_spec_col_facet,
  filename = "continental_land_bridge_sample_spec_col_facet.pdf",
  device = "pdf",
  width = 168,
  height = 100,
  units = "mm"
)
