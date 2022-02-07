# Histograms for Neves et al 2021
# Fig 3
source("scripts/plots/functions/plot_error_dists.R")
# Nonoceanic 13 - hide legend
if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "P282067"))) {
  folder_path <-
    "G:\\Shared drives\\DAISIE-RUG\\Robustness\\results\\continental_land_bridge_cs\\"

} else if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "Pedro"))) {
  folder_path <-
    "G:\\Discos partilhados\\DAISIE-RUG\\Robustness\\results\\continental_land_bridge_cs\\"

} else {
  folder_path <- choose.dir(caption = "Select 'results/continental_land_bridge_cs' folder")
}
testit::assert("Chosen directory exists", dir.exists(folder_path))


res_13 <- readRDS(file.path(folder_path, "continental_land_bridge_cs_param_set_13.rds"))
barplot_13 <- plot_error_dists(res_13, "spec_nltt")

# Nonoceanic 161
res_111 <- readRDS(file.path(folder_path, "continental_land_bridge_cs_param_set_111.rds"))
barplot_111 <- plot_error_dists(res_111, "spec_nltt")

# Arrange in grid, hide legends
side_by_side_plot <- cowplot::plot_grid(
  barplot_111 +  ggplot2::theme(legend.position = "none"),
  barplot_13 + ggplot2::theme(legend.position = "none"),
  ncol = 2,
  labels = c("(a)", "(b)"),
  label_size = 10.5
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
  filename = "hist_spec_nltt_nonoceanic_land_bridge_13_111.pdf",
  device = "pdf",
  width = 168,
  height = 100,
  units = "mm"
)
ggplot2::ggsave(
  plot = side_by_side_plot_legend,
  filename = "hist_spec_nltt_nonoceanic_land_bridge_13_111.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)

