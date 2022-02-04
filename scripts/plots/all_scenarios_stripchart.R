# Scenario strip charts for Neves et al 2021
# Figure 4
source("scripts/plots/functions/plot_error_stripchart.R")
# Load and calculate ED95 stat from all results
oceanic_ontogeny_ed95 <- compile_ed95s("continental_land_bridge_cs")

oceanic_sea_level_ed95 <- calc_ed95_for_plots(
  folder_path = file.path(folder_path, "oceanic_sea_level")
)
oceanic_ontogeny_sea_level_ed95 <- calc_ed95_for_plots(
  folder_path = file.path(folder_path, "oceanic_ontogeny_sea_level")
)
nonoceanic_ed95 <- calc_ed95_for_plots(
  folder_path = file.path(folder_path, "nonoceanic")
)
nonoceanic_land_bridge_ed95 <- calc_ed95_for_plots(
  folder_path = file.path(folder_path, "nonoceanic_land_bridge")
)



# Make labels
scenario_name <- c("Oceanic\nontogeny",
                   "Oceanic\nsea-level",
                   "Oceanic\nontogeny\nsea-level",
                   "Continental",
                   "Continental\nland-bridge")
error_names_vec <- c(
  "spec_nltt",
  "endemic_nltt",
  "nonendemic_nltt",
  "num_spec",
  "num_col"
)

ed95_error_name <- c(
  "ed95_spec_nltt",
  "ed95_endemic_nltt",
  "ed95_nonendemic_nltt",
  "ed95_num_spec",
  "ed95_num_col"
)


oceanic_list <- list()
nonoceanic_list <- list()
oceanic_list[[1]] <- oceanic_ontogeny_ed95
oceanic_list[[2]] <- oceanic_sea_level_ed95
oceanic_list[[3]] <- oceanic_ontogeny_sea_level_ed95
nonoceanic_list[[1]] <- nonoceanic_ed95
nonoceanic_list[[2]] <- nonoceanic_land_bridge_ed95


facet_spec_nltt_stripchart <- list()
label_list <- list(c("(a)", "(b)"),
                   c("(c)", "(d)"),
                   c("(e)", "(f)"),
                   c("(g)", "(h)"),
                   c("(i)", "(j)"))
for (i in seq_along(error_names_vec)) {
  # Create spec nltt strip charts
  list_plot_oceanic <- list(
    oceanic_list[[1]][[i]],
    oceanic_list[[2]][[i]],
    oceanic_list[[3]][[i]]
  )
  list_plot_nonoceanic <- list(
    nonoceanic_list[[1]][[i]],
    nonoceanic_list[[2]][[i]]
  )
  spec_nltt_oceanic_stripchart <- plot_error_stripchart(
    error_metrics_list = list_plot_oceanic,
    error = error_names_vec[i],
    error_metrics_names = scenario_name[1:3],
    x_axis_text = "Geodynamic scenario"
  )
  spec_nltt_oceanic_stripchart$mapping$colour <- NULL

  spec_nltt_nonoceanic_stripchart <- plot_error_stripchart(
    error_metrics_list = list_plot_nonoceanic,
    error = error_names_vec[i],
    error_metrics_names = scenario_name[4:5],
    x_axis_text = "Geodynamic scenario"
  )
  spec_nltt_nonoceanic_stripchart$mapping$colour <- NULL

  if (i == 5) {
    facet_spec_nltt_stripchart[[i]] <- cowplot::plot_grid(
      spec_nltt_oceanic_stripchart + ggplot2::theme(legend.position = "none"),
      spec_nltt_nonoceanic_stripchart + ggplot2::theme(
        axis.title.y = ggplot2::element_blank()),
      align = 'vh',
      labels = label_list[[i]],
      label_size = 8,
      hjust = -0.2,
      nrow = 1
    )
  } else {
    facet_spec_nltt_stripchart[[i]] <- cowplot::plot_grid(
      spec_nltt_oceanic_stripchart + ggplot2::theme(
        legend.position = "none",
        axis.text.x = ggplot2::element_blank()),
      spec_nltt_nonoceanic_stripchart + ggplot2::theme(
        axis.title.y = ggplot2::element_blank(),
        axis.text.x = ggplot2::element_blank()),
      align = 'vh',
      labels = label_list[[i]],
      label_size = 8,
      hjust = -0.2,
      nrow = 1
    )
  }
}

final_facet <- cowplot::plot_grid(
  facet_spec_nltt_stripchart[[1]],
  facet_spec_nltt_stripchart[[2]],
  facet_spec_nltt_stripchart[[3]],
  facet_spec_nltt_stripchart[[4]],
  facet_spec_nltt_stripchart[[5]],
  align = 'vh',
  hjust = -0.2,
  nrow = 5

)

ggplot2::ggsave(
  plot = final_facet,
  filename = paste0("facet_scenario", ".png"),
  device = "png",
  width = 168,
  height = 200,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_facet,
  filename = paste0("facet_scenario", ".pdf"),
  device = "pdf",
  width = 168,
  height = 200,
  units = "mm"
)

