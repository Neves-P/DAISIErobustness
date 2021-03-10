# Scenario boxplots for Neves et al 2021
source("scripts/calc_stat_diff.R")
source("scripts/plot_error_boxes.R")
root_folder <- "G:/Discos partilhados/DAISIE-RUG/Josh_Pedro_paper/results/"
# Load and calculate P95 stat from all results
oceanic_ontogeny_stat_diff <- calc_stat_diff(
  folder_path = file.path(root_folder, "oceanic_ontogeny")
)
oceanic_sea_level_stat_diff <- calc_stat_diff(
  folder_path = file.path(root_folder, "oceanic_sea_level")
)
oceanic_ontogeny_sea_level_stat_diff <- calc_stat_diff(
  folder_path = file.path(root_folder, "oceanic_ontogeny_sea_level")
)
nonoceanic_stat_diff <- calc_stat_diff(
  folder_path = file.path(root_folder, "nonoceanic")
)
nonoceanic_land_bridge_stat_diff <- calc_stat_diff(
  folder_path = file.path(root_folder, "nonoceanic_land_bridge")
)

# Subset by spec_nltt and num_spec
spec_nltt_list <- list(
  oceanic_ontogeny_stat_diff[[1]],
  oceanic_sea_level_stat_diff[[1]],
  oceanic_ontogeny_sea_level_stat_diff[[1]],
  nonoceanic_stat_diff[[1]],
  nonoceanic_land_bridge_stat_diff[[1]]
)
num_spec_list <- list(
  oceanic_ontogeny_stat_diff[[4]],
  oceanic_sea_level_stat_diff[[4]],
  oceanic_ontogeny_sea_level_stat_diff[[4]],
  nonoceanic_stat_diff[[4]],
  nonoceanic_land_bridge_stat_diff[[4]]
)
# Make labels
error_metrics_names <- c("Oceanic ontogeny",
                         "Oceanic sea-level",
                         "Oceanic ontogeny\nsea-level",
                         "Non-oceanic",
                         "Non-oceanic\nland-bridge")

# Create boxplots
spec_nltt_boxplot <- plot_error_boxes(
  error_metrics_list = spec_nltt_list,
  error = "spec_nltt",
  error_metrics_names = error_metrics_names,
  x_axis_text = "Geodynamic scenario"
)
num_spec_boxplot <- plot_error_boxes(
  error_metrics_list = num_spec_list,
  error = "num_spec",
  error_metrics_names = error_metrics_names,
  x_axis_text = "Geodynamic scenario"
)

# Save tif
ggplot2::ggsave(
  plot = spec_nltt_boxplot,
  filename = "boxplot_spec_nltt.tif",
  device = "tiff",
  width = 5.2,
  height = 3.9,
  dpi = 300,
  compression = "lzw"
)
ggplot2::ggsave(
  plot = num_spec_boxplot,
  filename = "boxplot_num_spec.tiff",
  device = "tiff",
  width = 5.2,
  height = 3.9,
  dpi = 300,
  compression = "lzw"
)
# Save png
ggplot2::ggsave(
  plot = spec_nltt_boxplot,
  filename = "boxplot_spec_nltt.png",
  device = "png",
  width = 5.2,
  height = 3.9,
  dpi = 300
)
ggplot2::ggsave(
  plot = num_spec_boxplot,
  filename = "boxplot_num_spec.png",
  device = "png",
  width = 5.2,
  height = 3.9,
  dpi = 300
)

