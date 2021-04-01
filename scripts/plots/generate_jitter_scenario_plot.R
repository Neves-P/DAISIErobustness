# Scenario boxplots for Neves et al 2021
source("scripts/plots/plot_error_jitters.R")
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
spec_nltt_list_oceanic <- list(
  oceanic_ontogeny_stat_diff[[1]],
  oceanic_sea_level_stat_diff[[1]],
  oceanic_ontogeny_sea_level_stat_diff[[1]]
)
spec_nltt_list_nonoceanic <- list(
  nonoceanic_stat_diff[[1]],
  nonoceanic_land_bridge_stat_diff[[1]]
)
num_spec_list_oceanic <- list(
  oceanic_ontogeny_stat_diff[[4]],
  oceanic_sea_level_stat_diff[[4]],
  oceanic_ontogeny_sea_level_stat_diff[[4]]
)
num_spec_list_nonoceanic <- list(
  nonoceanic_stat_diff[[4]],
  nonoceanic_land_bridge_stat_diff[[4]]
)
# Make labels
error_metrics_names <- c("Oceanic\nontogeny",
                         "Oceanic\nsea-level",
                         "Oceanic\nontogeny\nsea-level",
                         "Non-oceanic",
                         "Non-oceanic\nland-bridge")

# Create spec nltt jitters
spec_nltt_oceanic_jitters <- plot_error_jitters(
  error_metrics_list = spec_nltt_list_oceanic,
  error = "spec_nltt",
  error_metrics_names = error_metrics_names[1:3],
  x_axis_text = "Geodynamic scenario"
) + ggplot2::scale_color_manual(values = c(rep("#66C2A5", 3)))


spec_nltt_nonoceanic_jitters <- plot_error_jitters(
  error_metrics_list = spec_nltt_list_nonoceanic,
  error = "spec_nltt",
  error_metrics_names = error_metrics_names[4:5],
  x_axis_text = "Geodynamic scenario"
) + ggplot2::scale_color_manual(values = c(rep("#FC8D62", 2)))


facet_spec_nltt_jitters <- cowplot::plot_grid(
  spec_nltt_oceanic_jitters + ggplot2::theme(legend.position = "none"),
  spec_nltt_nonoceanic_jitters + ggplot2::theme(legend.position = "none", axis.title.y = ggplot2::element_blank()),
  align = 'vh',
  labels = c("A", "B"),
  hjust = -0.2,
  nrow = 1
)


# Create num spec jitters

num_spec_oceanic_jitters <- plot_error_jitters(
  error_metrics_list = num_spec_list_oceanic,
  error = "num_spec",
  error_metrics_names = error_metrics_names[1:3],
  x_axis_text = "Geodynamic scenario"
) + ggplot2::scale_color_manual(values = c(rep("#66C2A5", 3)))
num_spec_nonoceanic_jitters <- plot_error_jitters(
  error_metrics_list = num_spec_list_nonoceanic,
  error = "num_spec",
  error_metrics_names = error_metrics_names[4:5],
  x_axis_text = "Geodynamic scenario"
) + ggplot2::scale_color_manual(values = c(rep("#FC8D62", 2)))

facet_num_spec_jitters <- cowplot::plot_grid(
  num_spec_oceanic_jitters + ggplot2::theme(legend.position = "none"),
  num_spec_nonoceanic_jitters + ggplot2::theme(legend.position = "none", axis.title.y = ggplot2::element_blank()),
  align = 'vh',
  labels = c("A", "B"),
  hjust = -0.2,
  nrow = 1
)

# Save tif
ggplot2::ggsave(
  plot = facet_spec_nltt_jitters,
  filename = "jitters_spec_nltt.tif",
  device = "tiff",
  width = 5.2,
  height = 3.9,
  dpi = 300,
  compression = "lzw"
)
ggplot2::ggsave(
  plot = facet_num_spec_jitters,
  filename = "jitters_num_spec.tiff",
  device = "tiff",
  width = 5.2,
  height = 3.9,
  dpi = 300,
  compression = "lzw"
)
# Save png
ggplot2::ggsave(
  plot = facet_spec_nltt_jitters,
  filename = "jitters_spec_nltt.png",
  device = "png",
  width = 5.2,
  height = 3.9,
  dpi = 300
)
ggplot2::ggsave(
  plot = facet_num_spec_jitters,
  filename = "jitters_num_spec.png",
  device = "png",
  width = 5.2,
  height = 3.9,
  dpi = 300
)

