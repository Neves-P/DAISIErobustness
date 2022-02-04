# Scenario strip charts for Neves et al 2021
# Figure 4
source("scripts/plots/functions/plot_error_stripchart.R")
# Load and calculate ED95 stat from all results
oceanic_ontogeny_ed95_cs <- compile_ed95s("oceanic_ontogeny_cs")
oceanic_ontogeny_ed95_di <- compile_ed95s("oceanic_ontogeny_di")
oceanic_ontogeny_ed95_iw <- compile_ed95s("oceanic_ontogeny_iw")
oceanic_ontogeny_ed95 <- rbind(
  oceanic_ontogeny_ed95_cs,
  oceanic_ontogeny_ed95_di,
  oceanic_ontogeny_ed95_iw
)

oceanic_sea_level_ed95_cs <- compile_ed95s("oceanic_sea_level_cs")
oceanic_sea_level_ed95_di <- compile_ed95s("oceanic_sea_level_di")
oceanic_sea_level_ed95_iw <- compile_ed95s("oceanic_sea_level_iw")
oceanic_sea_level_ed95 <- rbind(
  oceanic_sea_level_ed95_cs,
  oceanic_sea_level_ed95_di,
  oceanic_sea_level_ed95_iw
)

oceanic_ontogeny_sea_level_ed95_cs <- compile_ed95s(
  "oceanic_ontogeny_sea_level_cs"
)
oceanic_ontogeny_sea_level_ed95_di <- compile_ed95s(
  "oceanic_ontogeny_sea_level_di"
)
oceanic_ontogeny_sea_level_ed95_iw <- compile_ed95s(
  "oceanic_ontogeny_sea_level_iw"
)
oceanic_ontogeny_sea_level_ed95 <- rbind(
  oceanic_ontogeny_sea_level_ed95_cs,
  oceanic_ontogeny_sea_level_ed95_di,
  oceanic_ontogeny_sea_level_ed95_iw
)


continental_ed95_cs <- compile_ed95s("continental_cs")
continental_ed95_di <- compile_ed95s("continental_di")
continental_ed95_iw <- compile_ed95s("continental_iw")
continental_ed95 <- rbind(
  continental_ed95_cs,
  continental_ed95_di,
  continental_ed95_iw
)

continental_land_bridge_ed95_cs <- compile_ed95s("continental_land_bridge_cs")
continental_land_bridge_ed95_di <- compile_ed95s("continental_land_bridge_di")
continental_land_bridge_ed95_iw <- compile_ed95s("continental_land_bridge_iw")
continental_land_bridge_ed95 <- rbind(
  continental_land_bridge_ed95_cs,
  continental_land_bridge_ed95_di,
  continental_land_bridge_ed95_iw
)



# Make labels
scenario_name <- c("Oceanic\nontogeny",
                   "Oceanic\nsea-level",
                   "Oceanic\n  ontogeny +\nsea-level",
                   "Continental",
                   "Continental\nland-bridge")
error_names_vec <- c(
  "ed95_spec_nltt" ,
  "ed95_endemic_nltt",
  "ed95_nonendemic_nltt",
  "ed95_num_spec",
  "ed95_num_col"
)

oceanic_list <- list()
continental_list <- list()
oceanic_list[[1]] <- oceanic_ontogeny_ed95
oceanic_list[[2]] <- oceanic_sea_level_ed95
oceanic_list[[3]] <- oceanic_ontogeny_sea_level_ed95
continental_list[[1]] <- continental_ed95
continental_list[[2]] <- continental_land_bridge_ed95


facet_spec_nltt_stripchart <- list()
label_list <- list(c("(a)", "(b)"),
                   c("(c)", "(d)"),
                   c("(e)", "(f)"),
                   c("(g)", "(h)"),
                   c("(i)", "(j)"))
for (i in seq_along(error_names_vec)) {
  # Create spec nltt strip charts
  list_plot_oceanic <- list(
    oceanic_list[[1]][[error_names_vec[i]]],
    oceanic_list[[2]][[error_names_vec[i]]],
    oceanic_list[[3]][[error_names_vec[i]]]
  )
  list_plot_continental <- list(
    continental_list[[1]][[error_names_vec[i]]],
    continental_list[[2]][[error_names_vec[i]]]
  )
  spec_nltt_oceanic_stripchart <- plot_error_stripchart(
    error_metrics_list = list_plot_oceanic,
    error = error_names_vec[i],
    error_metrics_names = scenario_name[1:3],
    x_axis_text = "Geodynamic scenario"
  )
  spec_nltt_oceanic_stripchart$mapping$colour <- NULL

  spec_nltt_continental_stripchart <- plot_error_stripchart(
    error_metrics_list = list_plot_continental,
    error = error_names_vec[i],
    error_metrics_names = scenario_name[4:5],
    x_axis_text = "Geodynamic scenario"
  )
  spec_nltt_continental_stripchart$mapping$colour <- NULL

  if (i == 5) {
    facet_spec_nltt_stripchart[[i]] <- cowplot::plot_grid(
      spec_nltt_oceanic_stripchart + ggplot2::theme(legend.position = "none"),
      spec_nltt_continental_stripchart + ggplot2::theme(
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
      spec_nltt_continental_stripchart + ggplot2::theme(
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

