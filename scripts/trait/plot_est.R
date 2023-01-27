# plot the estimation distributions for each parameter set
library(ggplot2)
plot_est <- function(est_df, param_set) {
  load("DAISIErobustness/inst/extdata/trait_CES.rda")
  real_rates <- trait_CES[param_set,]
  color_values <-c("SII 1" = "#EF7A6D", "SII 2" = "#5F97D2")
  p_lac <-ggplot2::ggplot(data = est_df) +
    ggplot2::theme_bw() +
    xlim(0,1)+
    ggplot2::geom_histogram(ggplot2::aes(x = lac_est1, fill = "SII 1"),
                            alpha = 0.9) +
    ggplot2::geom_histogram(ggplot2::aes(x = lac_est2, fill = "SII 2"),
                            alpha = 0.7) +
    ggplot2::theme_classic() +
    geom_segment(aes(x = real_rates$lac, y = -20, xend = real_rates$lac, yend = -2), size = 0.5, color = "black",
                 arrow = arrow(length = unit(0.2, "cm"))) +
    geom_segment(aes(x = real_rates$lac2, y = -20, xend = real_rates$lac2, yend = -2), size = 0.5, color = "black",
                 arrow = arrow(length = unit(0.2, "cm"))) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 12)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
    ggplot2::ylab("Frequency") +
    ggplot2::xlab(expression(lambda^c))+
    ggplot2::scale_color_manual(name = "Estimation",
                                values = color_values,
                                labels = c("SII 1", "SII 2"))+
    ggplot2::scale_fill_manual(name = "Estimation",
                               values = color_values,
                               labels = c("SII 1", "SII 2"))

  p_mu <-ggplot2::ggplot(data = est_df) +
    ggplot2::theme_bw() +
    xlim(0,1)+
    ggplot2::geom_histogram(ggplot2::aes(x = mu_est1, fill = "SII 1"),
                            alpha = 0.9) +
    ggplot2::geom_histogram(ggplot2::aes(x = mu_est2, fill = "SII 2"),
                            alpha = 0.7) +
    ggplot2::theme_classic() +
    geom_segment(aes(x = real_rates$mu, y = -20, xend = real_rates$mu, yend = -2), size = 0.5, color = "black",
                 arrow = arrow(length = unit(0.2, "cm"))) +
    geom_segment(aes(x = real_rates$mu2, y = -20, xend = real_rates$mu2, yend = -2), size = 0.5, color = "black",
                 arrow = arrow(length = unit(0.2, "cm"))) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 12)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
    ggplot2::ylab("Frequency") +
    ggplot2::xlab(expression(mu))+
    ggplot2::scale_color_manual(name = "Estimation ",
                                values = color_values,
                                labels = c("SII 1", "SII 2"))+
    ggplot2::scale_fill_manual(name = "Estimation ",
                               values = color_values,
                               labels = c("SII 1", "SII 2"))

  p_gam <-ggplot2::ggplot(data = est_df) +
    ggplot2::theme_bw() +
    xlim(0,0.03)+
    ggplot2::geom_histogram(ggplot2::aes(x = gam_est1, fill = "SII 1"),
                            alpha = 0.9) +
    ggplot2::geom_histogram(ggplot2::aes(x = gam_est2, fill = "SII 2"),
                            alpha = 0.7) +
    ggplot2::theme_classic() +
    geom_segment(aes(x = real_rates$gam, y = -20, xend = real_rates$gam, yend = -2), size = 0.5, color = "black",
                 arrow = arrow(length = unit(0.2, "cm"))) +
    geom_segment(aes(x = real_rates$gam2, y = -20, xend = real_rates$gam2, yend = -2), size = 0.5, color = "black",
                 arrow = arrow(length = unit(0.2, "cm"))) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 12)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
    ggplot2::ylab("Frequency") +
    ggplot2::xlab(expression(gamma))+
    ggplot2::scale_color_manual(name = "Estimation ",
                                values = color_values,
                                labels = c("SII 1", "SII 2"))+
    ggplot2::scale_fill_manual(name = "Estimation ",
                               values = color_values,
                               labels = c("SII 1", "SII 2"))

  p_laa <-ggplot2::ggplot(data = est_df) +
    ggplot2::theme_bw() +
    xlim(0,2)+
    ggplot2::geom_histogram(ggplot2::aes(x = laa_est1, fill = "SII 1"),
                            alpha = 0.9) +
    ggplot2::geom_histogram(ggplot2::aes(x = laa_est2, fill = "SII 2"),
                            alpha = 0.7) +
    ggplot2::theme_classic() +
    geom_segment(aes(x = real_rates$laa, y = -20, xend = real_rates$laa, yend = -2), size = 0.5, color = "black",
                 arrow = arrow(length = unit(0.2, "cm"))) +
    geom_segment(aes(x = real_rates$laa2, y = -20, xend = real_rates$laa2, yend = -2), size = 0.5, color = "black",
                 arrow = arrow(length = unit(0.2, "cm"))) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 12)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
    ggplot2::ylab("Frequency") +
    ggplot2::xlab(expression(lambda^a))+
    ggplot2::scale_color_manual(name = "Estimation ",
                                values = color_values,
                                labels = c("SII 1", "SII 2"))+
    ggplot2::scale_fill_manual(name = "Estimation ",
                               values = color_values,
                               labels = c("SII 1", "SII 2"))


  tiff(paste0("Figures_estimation/",param_set,".tiff"),
       units="px", width=3000, height=2000,res = 300,compression="lzw")
  param_estimates <- cowplot::plot_grid(
    p_lac,p_mu,p_gam,p_laa,
    align = "hv", nrow = 2, ncol = 2
  )
  # param_est_final <- cowplot::plot_grid(param_estimates,legend_all,rel_widths = c(3, .4))
  print(param_estimates)
  while (!is.null(dev.list()))  dev.off()
}

save_est_plots <- function(param_space_name) {
  path <- file.path("results/final_all", param_space_name)
  list_names <- list.files(path = path)
  for (i in seq_along(list_names)) {
    param_set_name <- tools::file_path_sans_ext(list_names[i])
    param_set <- as.numeric(stringr::str_extract(list_names[i], "\\d+"))
    load(file.path(path, list_names[i]))
    # output <- readRDS(file.path(path, list_names[i]))
    output <- output
    est1 <- output$passed_novel_mls
    est2 <- output$passed_oceanic_mls
    est_rates_TraiSIE <- do.call(rbind,lapply(est1,function(x) unlist(x)))
    est_rates_DAISIE <- do.call(rbind,lapply(est2,function(x) unlist(x)))

    est_df <- data.frame(est_rates_TraiSIE[,1:5],est_rates_DAISIE[,1:5])
    colnames(est_df)<-c("lac_est1","mu_est1","K_est1","gam_est1","laa_est1",
                        "lac_est2","mu_est2","K_est2","gam_est2","laa_est2")
    plot_est(est_df = est_df, param_set = param_set)
  }
  return(i)
}
est_est_df <- save_est_plots("trait_CES")


