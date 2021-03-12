# Barplots for Neves et al 2021
source("scripts/plot_error_dists.R")
# Nonoceanic 13 - hide legend
load("G:/Discos partilhados/DAISIE-RUG/Josh_Pedro_paper/results/nonoceanic/nonoceanic_param_set_13.RData")
barplot_13 <- plot_error_dists(output, "spec_nltt")

# Nonoceanic 161
load("G:/Discos partilhados/DAISIE-RUG/Josh_Pedro_paper/results/nonoceanic/nonoceanic_param_set_161.RData")
barplot_161 <- plot_error_dists(output, "spec_nltt")

# Arrange in grid, hide legends
side_by_side_plot <- cowplot::plot_grid(
  barplot_13 + ggplot2::theme(legend.position = "none"),
  barplot_161 +  ggplot2::theme(legend.position = "none"),
  ncol = 2,
  labels = "AUTO"
)

## Make legend
legend <- cowplot::get_legend(
  # create some space to the left of the legend
  barplot_13 + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 12))
)

## Add legend
side_by_side_plot_legend <- cowplot::plot_grid(
  side_by_side_plot,
  legend,
  rel_widths = c(3, 0.45)
)

# Save plot
ggplot2::ggsave(
  plot = side_by_side_plot_legend,
  filename = "hist_spec_nltt_nonoceanic_13_161.tif",
  device = "tiff",
  width = 5.2,
  height = 2.9,
  dpi = 300,
  compression = "lzw"
)
ggplot2::ggsave(
  plot = side_by_side_plot_legend,
  filename = "hist_spec_nltt_nonoceanic_13_161.png",
  device = "png",
  width = 5.2,
  height = 2.9,
  dpi = 300
)
