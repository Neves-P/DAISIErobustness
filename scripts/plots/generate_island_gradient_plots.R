# Strip charts for oceanic sea level gradient param spaces for Neves et al 2021
source("scripts/plots/compile_stat_diffs.R")
source("scripts/plots/plot_error_jitters_grouped.R")
source("scripts/plots/generate_paper_jitter_plots.R")
source("scripts/plots/save_faceted.R")

oceanic_sea_level_stat_diff <- compile_stat_diffs(
  scenario = "oceanic_sea_level",
  chunk_size = 192,
  total_length = 768
)
oceanic_ontogeny_sea_level_stat_diff <- compile_stat_diffs(
  scenario = "oceanic_ontogeny_sea_level",
  chunk_size = 192,
  total_length = 768
)


gradient_metrics <- c("l", "h", "l", "h")

xlabel_vec <- c("80",
                "85",
                "80",
                "85")


oceanic_sea_level_plots <- generate_paper_jitter_plots(
  list_to_plot = oceanic_sea_level_stat_diff$stat_diffs,
  error_metrics_names = gradient_metrics,
  x_axis_text = "Island gradient",
  scenario = "oceanic_sea_level",
  xlabels = xlabel_vec,
  save = FALSE,
  add_plot_title = FALSE
)

oceanic_ontongeny_sea_level_plots <- generate_paper_jitter_plots(
  list_to_plot = oceanic_ontogeny_sea_level_stat_diff$stat_diffs,
  error_metrics_names = gradient_metrics,
  x_axis_text = "Island gradient",
  scenario = "oceanic_ontogeny_sea_level",
  xlabels = xlabel_vec,
  save = FALSE,
   add_plot_title = FALSE
)

saved_faceted(oceanic_ontongeny_sea_level_plots[1], oceanic_ontongeny_sea_level_plots[2], oceanic_ontongeny_sea_level_plots[3], sub_text = "Island gradient")
saved_faceted(oceanic_sea_level_plots[1], oceanic_sea_level_plots[2], oceanic_sea_level_plots[3], sub_text = "Island gradient")
