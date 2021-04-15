# Strip charts for oceanic param spaces for Neves et al 2021
source("scripts/plots/compile_stat_diffs.R")
source("scripts/plots/plot_error_jitters_grouped.R")
source("scripts/plots/generate_paper_jitter_plots.R")
oceanic_ontogeny_stat_diff <- compile_stat_diffs(
  scenario = "oceanic_ontogeny",
  chunk_size = 48,
  total_length = 384
)
oceanic_sea_level_stat_diff <- compile_stat_diffs(
  scenario = "oceanic_sea_level",
  chunk_size = 48,
  total_length = 768
)
oceanic_ontogeny_sea_level_stat_diff <- compile_stat_diffs(
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

xlabel_vec <- c("\nLow x\nLow d",
                "\nHigh x\nLow d",
                "\nLow x\nHigh d",
                "\nHigh x\nHigh d")


oceanic_sea_level_plots <- generate_paper_jitter_plots(
  list_to_plot = oceanic_sea_level_stat_diff$stat_diffs,
  error_metrics_names = oceanic_sea_level_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_sea_level",
  xlabels = xlabel_vec,
  save = TRUE
)
oceanic_ontogeny_plots <- generate_paper_jitter_plots(
  list_to_plot = oceanic_ontogeny_stat_diff$stat_diffs,
  error_metrics_names = oceanic_ontogeny_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_ontogeny",
  xlabels = xlabel_vec,
  save = FALSE
)

oceanic_ontogeny_sea_level_plots <- generate_paper_jitter_plots(
  list_to_plot = oceanic_ontogeny_sea_level_stat_diff$stat_diffs,
  error_metrics_names = oceanic_sea_level_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_ontogeny_sea_level",
  xlabels = xlabel_vec,
  save = FALSE
)

prow <- cowplot::plot_grid(
  oceanic_ontogeny_plots[[1]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, 0.3),
  oceanic_sea_level_plots[[1]] + ggplot2::theme(
    legend.position = "none",
    axis.title.y = ggplot2::element_blank(),
    axis.title.x = ggplot2::element_blank()) +
    ggplot2::ylim(0, 0.3),
  oceanic_ontogeny_sea_level_plots[[1]] + ggplot2::theme(
    legend.position = "none",
    axis.title.y = ggplot2::element_blank(),
    axis.title.x = ggplot2::element_blank()
  ) + ggplot2::ylim(0, 0.3),
  align = 'vh',
  labels = c("a", "b", "c"),
  hjust = -0.2,
  nrow = 1
)

legend <- cowplot::get_legend(
  # create some space to the left of the legend
  oceanic_ontogeny_plots[[1]] + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 4))
)

final_hyperpars <- cowplot::plot_grid(
  prow,
  legend,
  rel_widths = c(3, 0.4)
)

ggplot2::ggsave(
  plot = final_hyperpars,
  filename = "hyperpars_facet.png",
  device = "png",
  width = 168,
  height = 100,
  units = "mm",
  dpi = 600
)
ggplot2::ggsave(
  plot = final_hyperpars,
  filename = "hyperpars_facet.eps",
  device = "eps",
  width = 168,
  height = 100,
  units = "mm"
)
