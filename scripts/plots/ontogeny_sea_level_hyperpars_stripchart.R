# Strip charts for oceanic param spaces for Neves et al 2021
# Fig 5 and Fig S1-4
source("scripts/plots/compile_ed95s.R")
source("scripts/plots/plot_error_stripchart_grouped.R")
source("scripts/plots/generate_paper_stripchart_plots.R")
source("scripts/plots/save_faceted.R")

oceanic_ontogeny_ed95 <- compile_ed95s(
  scenario = "oceanic_ontogeny",
  chunk_size = 48,
  total_length = 384
)
oceanic_sea_level_ed95 <- compile_ed95s(
  scenario = "oceanic_sea_level",
  chunk_size = 48,
  total_length = 768
)
oceanic_ontogeny_sea_level_ed95 <- compile_ed95s(
  scenario = "oceanic_ontogeny_sea_level",
  chunk_size = 48,
  total_length = 768
)

oceanic_ontogeny_metrics_names <- c(
  "l_l",
  "h_l",
  "l_h",
  "h_h",
  "l_l",
  "h_l",
  "l_h",
  "h_h"
)
oceanic_sea_level_metrics_names <- c(
  "l_l",
  "h_l",
  "l_h",
  "h_h",
  "l_l",
  "h_l",
  "l_h",
  "h_h",
  "l_l",
  "h_l",
  "l_h",
  "h_h",
  "l_l",
  "h_l",
  "l_h",
  "h_h"
)

xlabel_vec <- c("Low x  \nLow d",
                "High x  \nLow d",
                "Low x  \nHigh d",
                "High x  \nHigh d")


oceanic_sea_level_plots <- generate_paper_stripchart_plots(
  list_to_plot = oceanic_sea_level_ed95$ed95s,
  error_metrics_names = oceanic_sea_level_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_sea_level",
  xlabels = xlabel_vec,
  save = FALSE
)

oceanic_ontogeny_plots <- generate_paper_stripchart_plots(
  list_to_plot = oceanic_ontogeny_ed95$ed95s,
  error_metrics_names = oceanic_ontogeny_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_ontogeny",
  xlabels = xlabel_vec,
  save = FALSE
)

oceanic_ontogeny_sea_level_plots <- generate_paper_stripchart_plots(
  list_to_plot = oceanic_ontogeny_sea_level_ed95$ed95s,
  error_metrics_names = oceanic_sea_level_metrics_names,
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

