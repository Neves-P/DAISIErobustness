# Area and sea-level plots for Neves et al 2022
# Fig 1
source("scripts/plots/functions/plot_areas.R")
param_space <- load_param_space("oceanic_ontogeny_sea_level_cs")

area_pars_1 <- DAISIE::create_area_pars(
  max_area = param_space$max_area[nrow(param_space) / 2 + 1],
  current_area = param_space$current_area[nrow(param_space) / 2 + 1],
  proportional_peak_t = param_space$peak_time[nrow(param_space) / 2 + 1],
  total_island_age = param_space$total_island_age[nrow(param_space) / 2 + 1],
  sea_level_amplitude = param_space$sea_level_amplitude[nrow(param_space) / 2 + 1],
  sea_level_frequency = param_space$sea_level_frequency[nrow(param_space) / 2 + 1],
  island_gradient_angle = param_space$island_gradient_angle[nrow(param_space) / 2 + 1]
)

area_pars_2 <- DAISIE::create_area_pars(
  max_area = param_space$max_area[1],
  current_area = param_space$current_area[1],
  proportional_peak_t = param_space$peak_time[1],
  total_island_age = param_space$total_island_age[1],
  sea_level_amplitude = param_space$sea_level_amplitude[1],
  sea_level_frequency = param_space$sea_level_frequency[1],
  island_gradient_angle = param_space$island_gradient_angle[1]
)
area_pars_1_steep <- DAISIE::create_area_pars(
  max_area = param_space$max_area[nrow(param_space) / 2 + 1],
  current_area = param_space$current_area[nrow(param_space) / 2 + 1],
  proportional_peak_t = param_space$peak_time[nrow(param_space) / 2 + 1],
  total_island_age = param_space$total_island_age[nrow(param_space) / 2 + 1],
  sea_level_amplitude = param_space$sea_level_amplitude[nrow(param_space) / 2 + 1],
  sea_level_frequency = param_space$sea_level_frequency[nrow(param_space) / 2 + 1],
  island_gradient_angle = param_space$island_gradient_angle[nrow(param_space) / 2 ]
)

area_pars_2_steep <- DAISIE::create_area_pars(
  max_area = param_space$max_area[1],
  current_area = param_space$current_area[1],
  proportional_peak_t = param_space$peak_time[1],
  total_island_age = param_space$total_island_age[1],
  sea_level_amplitude = param_space$sea_level_amplitude[1],
  sea_level_frequency = param_space$sea_level_frequency[1],
  island_gradient_angle = param_space$island_gradient_angle[nrow(param_space) / 2 ]
)

island_ontogeny_1 <- "beta"
island_ontogeny_2 <- "beta"
sea_level_1 <- "sine"
sea_level_2 <- "sine"
resolution <- 0.001
overlay_sea_level_ontogeny <- TRUE
overlay_sea_level <- TRUE
totaltime_1 <- param_space$time[nrow(param_space)]
totaltime_2 <- param_space$time[1]

shallow <- plot_areas(
  totaltime_1 = totaltime_1,
  totaltime_2 = totaltime_2,
  area_pars_1 = area_pars_1,
  area_pars_2 = area_pars_2,
  island_ontogeny_1 = island_ontogeny_1,
  island_ontogeny_2 = island_ontogeny_2,
  sea_level_1 = sea_level_1,
  sea_level_2 = sea_level_2,
  resolution = resolution,
  overlay_sea_level_ontogeny = overlay_sea_level_ontogeny,
  overlay_sea_level = overlay_sea_level
)
steep <- plot_areas(
  totaltime_1 = totaltime_1,
  totaltime_2 = totaltime_2,
  area_pars_1 = area_pars_1_steep,
  area_pars_2 = area_pars_2_steep,
  island_ontogeny_1 = island_ontogeny_1,
  island_ontogeny_2 = island_ontogeny_2,
  sea_level_1 = sea_level_1,
  sea_level_2 = sea_level_2,
  resolution = resolution,
  overlay_sea_level_ontogeny = overlay_sea_level_ontogeny,
  overlay_sea_level = overlay_sea_level
)

stacked_plot <- cowplot::plot_grid(
  steep,
  shallow,
  ncol = 1,
  labels = c("(a)", "(b)"),
  label_size = 8
)


ggplot2::ggsave(
  plot = stacked_plot,
  filename = "JBI-21-0508_Fig1.pdf",
  device = "pdf",
  width = 7.9,
  height = 9,
  units = "cm"
)
ggplot2::ggsave(
  plot = stacked_plot,
  filename = "JBI-21-0508_Fig1.png",
  device = "png",
  width = 7.9,
  height = 9,
  dpi = 600,
  units = "cm"
)

