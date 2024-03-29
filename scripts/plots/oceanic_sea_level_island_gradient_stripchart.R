# Strip charts for oceanic sea level gradient param spaces for Neves et al 2022
# Fig S6-S9
source("scripts/plots/functions/compile_ed95s.R")
source("scripts/plots/functions/plot_error_stripchart_grouped.R")
source("scripts/plots/functions/generate_paper_stripchart_plots.R")
source("scripts/plots/functions/save_faceted.R")
source("scripts/plots/functions/tidy_data.R")

oceanic_ontogeny_ed95 <- rbind(
  compile_ed95s(param_space_name = "oceanic_ontogeny_cs"),
  compile_ed95s(param_space_name = "oceanic_ontogeny_di"),
  compile_ed95s(param_space_name = "oceanic_ontogeny_iw")
)
oceanic_sea_level_ed95 <- rbind(
  compile_ed95s(param_space_name = "oceanic_sea_level_cs"),
  compile_ed95s(param_space_name = "oceanic_sea_level_di"),
  compile_ed95s(param_space_name = "oceanic_sea_level_iw")
)
oceanic_ontogeny_sea_level_ed95 <- rbind(
  compile_ed95s(param_space_name = "oceanic_ontogeny_sea_level_cs"),
  compile_ed95s(param_space_name = "oceanic_ontogeny_sea_level_di"),
  compile_ed95s(param_space_name = "oceanic_ontogeny_sea_level_iw")
)


gradient_metrics <- c("l", "h", "l", "h")

xlabel_vec <- c("80",
                "85",
                "80",
                "85")


oceanic_sea_level_plots <- generate_paper_stripchart_plots(
  scenario_res = oceanic_sea_level_ed95,
  x_axis_text = "Island gradient",
  partition_by = "gradient",
  scenario = "oceanic_sea_level",
  xlabels = xlabel_vec,
  save = FALSE,
  add_plot_title = FALSE
)

oceanic_ontongeny_sea_level_plots <- generate_paper_stripchart_plots(
  scenario_res = oceanic_ontogeny_sea_level_ed95,
  x_axis_text = "Island gradient",
  partition_by = "gradient",
  scenario = "oceanic_ontogeny_sea_level",
  xlabels = xlabel_vec,
  save = FALSE,
  add_plot_title = FALSE
)

saved_faceted(
  oceanic_ontongeny_sea_level_plots[1],
  oceanic_ontongeny_sea_level_plots[2],
  oceanic_ontongeny_sea_level_plots[3],
  sub_text = "Island gradient",
  save_name = "oceanic_ontogeny_sea_level_gradient_nltt"
)
ggplot2::ggsave(
  plot = oceanic_ontongeny_sea_level_plots[[4]],
  filename = paste0("Island_gradient_ontogeny_sea_level_num_spec.png"),
  device = "png",
  width = 168,
  height = 60,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = oceanic_ontongeny_sea_level_plots[[4]],
  filename = paste0("Island_gradient_ontogeny_sea_level_num_spec.pdf"),
  device = "pdf",
  width = 168,
  height = 60,
  units = "mm"
)

saved_faceted(
  oceanic_sea_level_plots[1],
  oceanic_sea_level_plots[2],
  oceanic_sea_level_plots[3],
  sub_text = "Island gradient",
  save_name = "oceanic_sea_level_gradient_nltt"
)

ggplot2::ggsave(
  plot = oceanic_sea_level_plots[[4]],
  filename = paste0("Island_gradient_sea_level_num_spec.png"),
  device = "png",
  width = 168,
  height = 60,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = oceanic_sea_level_plots[[4]],
  filename = paste0("Island_gradient_sea_level_num_spec.pdf"),
  device = "pdf",
  width = 168,
  height = 60,
  units = "mm"
)

