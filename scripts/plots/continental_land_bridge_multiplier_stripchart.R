# Strip charts for continental_land_bridge effect for Neves et al 2022
# Fig 7 and Fig S13-S14
library(DAISIErobustness)
source("scripts/plots/functions/compile_ed95s.R")
source("scripts/plots/functions/plot_error_stripchart_grouped.R")
source("scripts/plots/functions/generate_paper_stripchart_plots.R")
source("scripts/plots/functions/save_faceted.R")
source("scripts/plots/functions/tidy_data.R")
continental_land_bridge_ed95 <- rbind(
  compile_ed95s(param_space_name = "continental_land_bridge_cs"),
  compile_ed95s(param_space_name = "continental_land_bridge_di"),
  compile_ed95s(param_space_name = "continental_land_bridge_iw")
)

xlabel_vec <- c("2", "10")
# Store in variable to plot faceted
continental_land_bridge_plots <- generate_paper_stripchart_plots(
  scenario_res = continental_land_bridge_ed95,
  x_axis_text = "Land-bridge colonisation multiplier",
  scenario = "continental_land_bridge",
  partition_by = "land_bridge_multiplier",
  xlabels = xlabel_vec,
  save = FALSE,
  add_plot_title = FALSE,
  alt_colours = TRUE
)

# Save individual plots
generate_paper_stripchart_plots(
  scenario_res = continental_land_bridge_ed95,
  x_axis_text = "Land-bridge colonisation multiplier",
  scenario = "continental_land_bridge",
  partition_by = "land_bridge_multiplier",
  xlabels = xlabel_vec,
  save = TRUE,
  add_plot_title = FALSE,
  alt_colours = TRUE
)

saved_faceted(
  continental_land_bridge_plots[1],
  continental_land_bridge_plots[2],
  continental_land_bridge_plots[3],
  "Land-bridge colonisation multiplier"
)
