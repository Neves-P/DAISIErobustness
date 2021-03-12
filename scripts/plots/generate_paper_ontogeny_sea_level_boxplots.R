# Boxplots for oceanic_ontogeny vs oceanic_ontogeny_sea_level for
# Neves et al 2021

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

xlabel_vec <- c("🠗 x\n🠗 d",
                "🠗 x\n🠕 d",
                "🠕 x\n🠗 d",
                "🠕 x\n🠕 d")
oceanic_sea_level_plots <- generate_paper_plots(
  list_to_plot = oceanic_sea_level_stat_diff$stat_diffs,
  error_metrics_names = oceanic_sea_level_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_sea_level",
  xlabels = xlabel_vec,
  save = FALSE
)
oceanic_ontogeny_plots <- generate_paper_plots(
  list_to_plot = oceanic_ontogeny_stat_diff$stat_diffs,
  error_metrics_names = oceanic_ontogeny_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_sea_level",
  xlabels = xlabel_vec,
  save = FALSE
)

oceanic_ontogeny_sea_level_plots <- generate_paper_plots(
  list_to_plot = oceanic_ontogeny_sea_level_stat_diff$stat_diffs,
  error_metrics_names = oceanic_sea_level_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_sea_level",
  xlabels = xlabel_vec,
  save = FALSE
)

prow <- cowplot::plot_grid(
  oceanic_ontogeny_plots[[1]] + ggplot2::theme(legend.position = "none"),
  oceanic_sea_level_plots[[1]] + ggplot2::theme(legend.position = "none", axis.title.y = ggplot2::element_blank()),
  align = 'vh',
  labels = c("A", "B"),
  hjust = -0.2,
  nrow = 1
)
prow_2 <- cowplot::plot_grid(
  oceanic_ontogeny_plots[[1]] + ggplot2::theme(
    legend.position = "none",
    axis.title.x = ggplot2::element_blank()
  ), oceanic_sea_level_plots[[1]] + ggplot2::theme(
    legend.position = "none",
    axis.title.y = ggplot2::element_blank(),
    axis.title.x = ggplot2::element_blank()
    ), oceanic_ontogeny_sea_level_plots[[1]] + ggplot2::theme(
      legend.position = "none",
      axis.title.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank()
    ), align = 'vh',
  labels = c("A", "B", "C"),
  hjust = -0.2,
  nrow = 1
)

legend <- cowplot::get_legend(
  # create some space to the left of the legend
  oceanic_ontogeny_plots[[1]] + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 12))
)

final_hyperpars <- cowplot::plot_grid(prow, legend, rel_widths = c(3, 0.6))
final_hyperpars_2 <- cowplot::plot_grid(
  prow_2,
  legend,
  rel_widths = c(3, 0.5)
)

final_hyperpars_2 <- cowplot::add_sub(final_hyperpars_2, "Hyperparameters", vpadding=grid::unit(0, "lines"),y = 5, x = 0.5, vjust = 4.5, size = 10)

ggplot2::ggsave(
  plot = final_hyperpars_2,
  filename = "hyperpars_short.tif",
  device = "tiff",
  width = 5.2,
  height = 2.9,
  dpi = 300,
  compression = "lzw"
)
ggplot2::ggsave(
  plot = final_hyperpars_2,
  filename = "hyperpars_tall.tif",
  device = "tiff",
  width = 5.2,
  height = 3.9,
  dpi = 300,
  compression = "lzw"
)
