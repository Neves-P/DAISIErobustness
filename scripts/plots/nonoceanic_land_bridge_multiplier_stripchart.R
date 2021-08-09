# Strip charts for nonoceanic_land_bridge effect for Neves et al 2021
# Fig 7 and Fig S13-S14
source("scripts/plots/functions/compile_ed95s.R")
source("scripts/plots/functions/plot_error_stripchart_grouped.R")
source("scripts/plots/functions/generate_paper_stripchart_plots.R")
source("scripts/plots/functions/save_faceted.R")
source("scripts/plots/functions/tidy_data.R")
nonoceanic_land_bridge_stat_diff <- compile_ed95s(
  scenario = "nonoceanic_land_bridge",
  chunk_size = 32,
  total_length = 256
)

nonoceanic_land_bridge_metrics_names <- c(
  "l",
  "h",
  "l",
  "h",
  "l",
  "h",
  "l",
  "h"
)

xlabel_vec <- c("2",
                "10",
                "2",
                "10")
nonoceanic_land_bridge_plots <- generate_paper_stripchart_plots(
  list_to_plot = nonoceanic_land_bridge_stat_diff$ed95s,
  error_metrics_names = nonoceanic_land_bridge_metrics_names,
  x_axis_text = "Land-bridge colonisation multiplier",
  scenario = "nonoceanic_land_bridge",
  xlabels = xlabel_vec,
  save = TRUE,
  add_plot_title = FALSE
)


saved_faceted(
  nonoceanic_land_bridge_plots[1],
  nonoceanic_land_bridge_plots[2],
  nonoceanic_land_bridge_plots[3],
  "Land-bridge colonisation multiplier"
)
