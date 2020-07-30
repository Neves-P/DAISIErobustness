

load(file.choose())
param_set <- 78
plot_error_dists(output_file = output, error = "spec_nltt", param_set = param_set)
ggplot2::ggsave(paste0("oceanic_ontogeny_param_set", "_spec_nltt", param_set, ".png"), device = "png", width = 8, height = 8)
plot_error_dists(output_file = output, error = "endemic_nltt", param_set = param_set)
ggplot2::ggsave(paste0("oceanic_ontogeny_param_set", "_endemic_nltt", param_set, ".png"), device = "png", width = 8, height = 8)
plot_error_dists(output_file = output, error = "nonendemic_nltt", param_set = param_set)
ggplot2::ggsave(paste0("oceanic_ontogeny_param_set", "_nonendemic_nltt", param_set, ".png"), device = "png", width = 8, height = 8)
# plot_error_dists(output_file = output, error = "num_spec", param_set = 1)
# plot_error_dists(output_file = output, error = "num_col", param_set = 1)

output$error_metrics[5:7]

