# Histograms for Neves et al 2022
# Fig 3
source("scripts/plots/functions/plot_error_dists.R")
# Nonoceanic 13 - hide legend
if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "P282067"))) {
  folder_path <-
    "G:\\Shared drives\\DAISIE-RUG\\Robustness\\data_neves_lambert_et_al_2022\\results\\continental_land_bridge_cs\\"

} else if (isTRUE(identical(Sys.getenv()[["USERNAME"]], "pedro"))) {
  folder_path <-
    "G:\\Discos partilhados\\DAISIE-RUG\\Robustness\\results\\data_neves_lambert_et_al_2022\\continental_land_bridge_cs\\"

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
  barplot_2 + ggplot2::theme(
    legend.position = c(0.9, 0.8)),
  barplot_61 +  ggplot2::theme(legend.position = "none"),
  ncol = 1,
  labels = c("(a)", "(b)"),
  label_size = 8
)

## Make legend



# Save plot
ggplot2::ggsave(
  plot = stacked_plot,
  filename = "JBI-21-0508_Fig3.png",
  device = "png",
  width = 79,
  height = 90,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = stacked_plot,
  filename = "JBI-21-0508_Fig3.pdf",
  device = "pdf",
  width = 79,
  height = 90,
  units = "mm"
)

