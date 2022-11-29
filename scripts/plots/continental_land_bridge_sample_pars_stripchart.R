# Fig S10 - S11
# Strip charts for continental land bridge by sample parameter for Neves et al
# 2022
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
  add_plot_title = FALSE,
  alt_colours = TRUE
)

# Figure out ylim
plot_1_ylim <- ggplot2::layer_scales(continental_land_bridge_plots[[1]])$y$range$range[2]
plot_2_ylim <- ggplot2::layer_scales(continental_land_bridge_plots[[2]])$y$range$range[2]
plot_3_ylim <- ggplot2::layer_scales(continental_land_bridge_plots[[3]])$y$range$range[2]
faceted_ylim <- max(plot_1_ylim, plot_2_ylim, plot_3_ylim)
# Faceted

plot_left <- continental_land_bridge_plots[[1]] + ggplot2::theme(
  legend.position = "none", axis.title.x = ggplot2::element_blank()) +
  ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2))
plot_mid <- continental_land_bridge_plots[[2]] + ggplot2::theme(
  legend.position = "none", axis.title.x = ggplot2::element_blank(),
  axis.text.y = ggplot2::element_blank()) +
  ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2))
plot_right <- continental_land_bridge_plots[[3]] + ggplot2::theme(
  legend.position = "none", axis.title.x = ggplot2::element_blank(),
  axis.text.y = ggplot2::element_blank()) +
  ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2))

continental_land_bridge_facet <- patchwork::guide_area() +
  patchwork::wrap_plots(
    plot_left,
    plot_mid,
    plot_right) + patchwork::plot_layout(
      nrow = 2,
      heights = c(0.05, 15),
      guides = "collect"
    ) + patchwork::plot_annotation(
      tag_levels = "a",
      tag_prefix = "(",
      tag_suffix = ")"
    ) & ggplot2::theme(
      legend.position = "top",
      plot.tag = ggplot2::element_text(size = 8, hjust = 0.2, vjust = 1),
      plot.tag.position = c(0, 1)
    )

faceted_ylim <- 0.6
spec_plot <- continental_land_bridge_plots[[4]] + ggplot2::theme(
  legend.position = "none", axis.title.x = ggplot2::element_blank()) +
  ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2))
col_plot <- continental_land_bridge_plots[[5]] + ggplot2::theme(
  legend.position = "none", axis.title.x = ggplot2::element_blank(),
  axis.text.y = ggplot2::element_blank()) +
  ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2))

continental_land_bridge_spec_col_facet <- patchwork::guide_area() +
  patchwork::wrap_plots(
    spec_plot,
    col_plot) + patchwork::plot_layout(
      nrow = 2,
      heights = c(0.05, 15),
      guides = "collect"
    ) + patchwork::plot_annotation(
      tag_levels = "a",
      tag_prefix = "(",
      tag_suffix = ")"
    ) & ggplot2::theme(
      legend.position = "top",
      plot.tag = ggplot2::element_text(size = 8, hjust = 0.2, vjust = 1),
      plot.tag.position = c(0, 1)
    )


final_continental_land_bridge_facet <- cowplot::add_sub(
  continental_land_bridge_facet,
  "Continental land-bridge sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 6.2,
  size = 8
)

final_continental_land_bridge_spec_col_facet <- cowplot::add_sub(
  continental_land_bridge_spec_col_facet,
  "Continental land-bridge sampling parameters",
  vpadding = grid::unit(0, "lines"),
  y = 5,
  x = 0.5,
  vjust = 6.2,
  size = 8
)


ggplot2::ggsave(
  plot = final_continental_land_bridge_facet,
  filename = "continental_land_bridge_sample_facet.png",
  device = "png",
  width = 168,
  height = 60,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_continental_land_bridge_facet,
  filename = "continental_land_bridge_sample_facet.pdf",
  device = "pdf",
  width = 168,
  height = 60,
  units = "mm"
)
ggplot2::ggsave(
  plot = final_continental_land_bridge_spec_col_facet,
  filename = "continental_land_bridge_sample_spec_col_facet.png",
  device = "png",
  width = 168,
  height = 60,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_continental_land_bridge_spec_col_facet,
  filename = "continental_land_bridge_sample_spec_col_facet.pdf",
  device = "pdf",
  width = 168,
  height = 60,
  units = "mm"
)

