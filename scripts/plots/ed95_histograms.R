# Histograms for Neves et al 2022
# Fig 3
source("scripts/plots/functions/plot_error_dists.R")
# Nonoceanic 13 - hide legend
if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "P282067"))) {
  folder_path <-
    "G:\\Shared drives\\DAISIE-RUG\\Robustness\\resubmission\\results\\\\continental_land_bridge_cs\\"

} else if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "pedro"))) {
  folder_path <-
    "G:\\Discos partilhados\\DAISIE-RUG\\Robustness\\results\\resubmission\\continental_land_bridge_cs\\"

} else {
  folder_path <- choose.dir(caption = "Select 'results/continental_land_bridge_cs' folder")
}
testit::assert("Chosen directory exists", dir.exists(folder_path))


res_2 <- readRDS(file.path(folder_path, "continental_land_bridge_cs_param_set_2.rds"))
barplot_2 <- plot_error_dists(res_2, "spec_nltt")

# Nonoceanic 61
res_61 <- readRDS(file.path(folder_path, "continental_land_bridge_cs_param_set_61.rds"))
barplot_61 <- plot_error_dists(res_61, "spec_nltt")

# Arrange in grid, hide legends
stacked_plot <- cowplot::plot_grid(
  barplot_2 + ggplot2::theme(legend.position = "none"),
  barplot_61 +  ggplot2::theme(legend.position = "none"),
  ncol = 1,
  labels = c("(a)", "(b)"),
  label_size = 8
)

## Make legend
legend <- cowplot::get_legend(
  # create some space to the left of the legend
  barplot_2 + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 12))
)

## Add legend
stacked_plot_legend <- cowplot::plot_grid(
  stacked_plot,
  legend,
  rel_widths = c(1.5, 0.5)
)

# Save plot
ggplot2::ggsave(
  plot = stacked_plot_legend,
  filename = "JBI-21-0508_Fig3.pdf",
  device = "pdf",
  width = 79,
  height = 130,
  units = "mm"
)
ggplot2::ggsave(
  plot = stacked_plot_legend,
  filename = "JBI-21-0508_Fig3.png",
  device = "png",
  width = 79,
  height = 130,
  units = "mm",
  dpi = 600
)
