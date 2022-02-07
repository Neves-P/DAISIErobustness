# Strip charts for oceanic param spaces for Neves et al 2022
# Fig 5 and Fig S2 S3, S6, S7
source("scripts/plots/functions/compile_ed95s.R")
source("scripts/plots/functions/plot_error_stripchart_grouped.R")
source("scripts/plots/functions/generate_paper_stripchart_plots.R")
source("scripts/plots/functions/save_faceted.R")
source("scripts/plots/functions/tidy_data.R")

oceanic_ontogeny_ed95 <- rbind(
  compile_ed95s(scenario = "oceanic_ontogeny_cs"),
  compile_ed95s(scenario = "oceanic_ontogeny_di"),
  compile_ed95s(scenario = "oceanic_ontogeny_iw")
)
oceanic_sea_level_ed95 <- rbind(
  compile_ed95s(scenario = "oceanic_sea_level_cs"),
  compile_ed95s(scenario = "oceanic_sea_level_di"),
  compile_ed95s(scenario = "oceanic_sea_level_iw")
)
oceanic_ontogeny_sea_level_ed95 <- rbind(
  compile_ed95s(scenario = "oceanic_ontogeny_sea_level_cs"),
  compile_ed95s(scenario = "oceanic_ontogeny_sea_level_di"),
  compile_ed95s(scenario = "oceanic_ontogeny_sea_level_iw")
)



xlabel_vec <- c("Low x  \nLow d",
                "High x  \nLow d",
                "Low x  \nHigh d",
                "High x  \nHigh d")


oceanic_sea_level_plots <- generate_paper_stripchart_plots(
  scenario_res = oceanic_sea_level_ed95,
  partition_by = "hyperparameters",
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_sea_level",
  xlabels = xlabel_vec,
  save = FALSE
)

oceanic_ontogeny_plots <- generate_paper_stripchart_plots(
  scenario_res = oceanic_ontogeny_ed95,
  partition_by = "hyperparameters",
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_ontogeny",
  xlabels = xlabel_vec,
  save = FALSE
)

oceanic_ontogeny_sea_level_plots <- generate_paper_stripchart_plots(
  scenario_res = oceanic_ontogeny_sea_level_ed95,
  partition_by = "hyperparameters",
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_ontogeny_sea_level",
  xlabels = xlabel_vec,
  save = FALSE
)

saved_faceted(
  plot_list_1 = oceanic_ontogeny_plots,
  plot_list_2 = oceanic_sea_level_plots,
  plot_list_3 = oceanic_ontogeny_sea_level_plots,
  sub_text = "Hyperparameters"
)

