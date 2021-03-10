# Boxplots for oceanic_ontogeny vs oceanic_ontogeny_sea_level for
# Neves et al 2021
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

xlabel_vec <- c(expression(atop("Low"~x, "Low"~d)),
                expression(atop("Low"~x,"High"~d)),
                expression(atop("High"~x,"Low"~d)),
                expression(atop("High"~x,"High"~d)))
oceanic_sea_level_plots <- generate_paper_plots(
  list_to_plot = oceanic_sea_level$stat_diffs,
  error_metrics_names = oceanic_sea_level_metrics_names,
  x_axis_text = "Hyperparameters",
  scenario = "oceanic_sea_level",
  xlabels = xlabel_vec,
  save = FALSE
)
oceanic_ontogeny_plots <- generate_paper_plots(
  list_to_plot = oceanic_ontogeny$stat_diffs,
  error_metrics_names = oceanic_ontogeny_metrics_names,
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

legend <- cowplot::get_legend(
  # create some space to the left of the legend
  oceanic_ontogeny_plots[[1]] + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 12))
)

final_hyperpars <- cowplot::plot_grid(prow, legend, rel_widths = c(3, 0.6))

ggplot2::ggsave(
  plot = final_hyperpars,
  filename = "hyperpars_tall.png",
  device = "png",
  width = 5.2,
  height = 3.9,
  dpi = 300
  # compression = "lzw"
)
