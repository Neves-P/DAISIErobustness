# Boxplots for nonoceanic vs nonoceanic_land_bridge for
# Neves et al 2021
source("scripts/plots/plot_error_jitters_grouped.R")
# source("scripts/plots/plot_stat_diffs_boxplots.R")

nonoceanic_stat_diff <- compile_stat_diffs(
  scenario = "nonoceanic",
  chunk_size = 48,
  total_length = 384
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

xlabel_vec_nonoceanic <- c(expression(atop(Low~x[s], Low~x[nonend])),
                           expression(atop(Low~x[s], High~x[nonend])),
                           expression(atop(High~x[s], Low~x[nonend])),
                           expression(atop(High~x[s], High~x[nonend])))

nonoceanic_plots <- generate_paper_jitter_plots(
  list_to_plot = nonoceanic_stat_diff$stat_diffs,
  error_metrics_names = oceanic_ontogeny_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "nonoceanic",
  xlabels = xlabel_vec_nonoceanic,
  save = TRUE
)



legend <- cowplot::get_legend(
  # create some space to the left of the legend
  nonoceanic_land_bridge_plots[[1]] + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 12))
)

