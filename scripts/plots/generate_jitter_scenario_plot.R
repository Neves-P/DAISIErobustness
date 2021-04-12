# Scenario strip charts for Neves et al 2021
source("scripts/plots/plot_error_jitters.R")
root_folder <- "G:/Shared drives/DAISIE-RUG/Josh_Pedro_paper/results/"
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



# Make labels
scenario_name <- c("Oceanic\nontogeny",
                   "Oceanic\nsea-level",
                   "Oceanic\nontogeny\nsea-level",
                   "Non-oceanic",
                   "Non-oceanic\nland-bridge")
error_names_vec <- c(
  "spec_nltt",
  "endemic_nltt",
  "nonendemic_nltt",
  "num_spec",
  "num_col"
)

stat_diff_error_name <- c(
  "stat_diff_spec_nltt",
  "stat_diff_endemic_nltt",
  "stat_diff_nonendemic_nltt",
  "stat_diff_num_spec",
  "stat_diff_num_col"
)


# Subset by oceanic vs nonoceanic
oceanic_list <- list()
nonoceanic_list <- list()
for (i in stat_diff_error_name) {
  oceanic_list[[i]] <- list(
    oceanic_ontogeny_stat_diff[[i]],
    oceanic_sea_level_stat_diff[[i]],
    oceanic_ontogeny_sea_level_stat_diff[[i]]
  )
  nonoceanic_list[[i]] <- list(
    nonoceanic_stat_diff[[i]],
    nonoceanic_land_bridge_stat_diff[[i]]
  )
}


for (i in seq_along(error_names_vec)) {


  # Create spec nltt strip charts
  spec_nltt_oceanic_jitters <- plot_error_jitters(
    error_metrics_list = oceanic_list[[i]][[stat_diff_error_name[i]]],
    error = error_names_vec[i],
    error_metrics_names = scenario_name[1:3],
    x_axis_text = "Geodynamic scenario"
  ) + ggplot2::scale_color_manual(values = c(rep("#FC8D62#66C2A5", 3)))


  spec_nltt_nonoceanic_jitters <- plot_error_jitters(
    error_metrics_list = nonoceanic_list[[i]][[stat_diff_error_name[i]]],
    error = error_names_vec[i],
    error_metrics_names = scenario_name[4:5],
    x_axis_text = "Geodynamic scenario"
  ) + ggplot2::scale_color_manual(values = c(rep("#66C2A5", 2)))


  facet_spec_nltt_jitters <- cowplot::plot_grid(
    spec_nltt_oceanic_jitters + ggplot2::theme(legend.position = "none"),
    spec_nltt_nonoceanic_jitters + ggplot2::theme(
      legend.position = "none",
      axis.title.y = ggplot2::element_blank()),
    align = 'vh',
    labels = c("a", "b"),
    hjust = -0.2,
    nrow = 1
  )

}
