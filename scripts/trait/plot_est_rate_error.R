# calculate the estimation error and baseline error per rate per parameter set
get_rates_error <- function(output, param_set) {

  est1 <- output$passed_novel_mls
  est2 <- output$passed_oceanic_mls
  est_rates_TraiSIE <- do.call(rbind,lapply(est1,function(x) unlist(x)))
  est_rates_DAISIE <- do.call(rbind,lapply(est2,function(x) unlist(x)))

  lac_baseline <- est_rates_DAISIE[,1] - est_rates_TraiSIE[,1]
  mu_baseline <- est_rates_DAISIE[,2] - est_rates_TraiSIE[,2]
  K_baseline <- est_rates_DAISIE[,3] - est_rates_TraiSIE[,3]
  gam_baseline <- est_rates_DAISIE[,4] - est_rates_TraiSIE[,4]
  laa_baseline <- est_rates_DAISIE[,5] - est_rates_TraiSIE[,5]

  load("G:/R/DAISIErobustness/inst/extdata/trait_CES.rda")
  real_rates <- trait_CES[param_set,]

  real_rates$mean_lac <- (real_rates$lac + real_rates$lac2)/2
  real_rates$mean_mu <- (real_rates$mu + real_rates$mu2)/2
  real_rates$mean_gam <- (real_rates$gam + real_rates$gam2)/2
  real_rates$mean_laa <- (real_rates$laa + real_rates$laa2)/2

  lac_error <- est_rates_TraiSIE[,1] - real_rates[,15]
  mu_error <- est_rates_TraiSIE[,2] - real_rates[,16]
  K_error <- est_rates_TraiSIE[,3] - real_rates[,10]
  gam_error <- est_rates_TraiSIE[,4] - real_rates[,17]
  laa_error <- est_rates_TraiSIE[,5] - real_rates[,18]

  return(list(
    lac_baseline = lac_baseline,
    mu_baseline = mu_baseline,
    K_baseline = K_baseline,
    gam_baseline = gam_baseline,
    laa_baseline = laa_baseline,
    lac_error = lac_error,
    mu_error = mu_error,
    K_error = K_error,
    gam_error = gam_error,
    laa_error = laa_error
  ))
}

# plot the estimation error distributions for each parameter set

library(ggplot2)
plot_error <- function(error_df, param_set) {
  color_values <-c("Baseline error" = "#EF7A6D", "Error" = "#5F97D2")
  p_lac <-ggplot2::ggplot(data = error_df) +
    ggplot2::theme_bw() +
    xlim(-1,1)+
    ggplot2::geom_histogram(ggplot2::aes(x = lac_baseline, fill = "Baseline error"),
                          alpha = 0.9) +
    ggplot2::geom_histogram(ggplot2::aes(x = lac_error, fill = "Error"),
                            alpha = 0.7) +
    ggplot2::geom_vline(aes(xintercept = median(lac_baseline),color = "Baseline error"),
                        linetype = "dashed", size = 0.8) +
    ggplot2::geom_vline(aes(xintercept = median(lac_error),color = "Error"),
                        linetype = "dashed", size = 0.8) +
    ggplot2::theme_classic() +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 12)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
    ggplot2::ylab("Frequency") +
    ggplot2::xlab(expression(lambda^c ~ Error))+
    ggplot2::scale_color_manual(name = "Estimation error",
                               values = color_values,
                               labels = c("Baseline error", "Error"))+
    ggplot2::scale_fill_manual(name = "Estimation error",
                               values = color_values,
                               labels = c("Baseline error", "Error"))

  p_mu <-ggplot2::ggplot(data = error_df) +
    ggplot2::theme_bw() +
    xlim(-1,1)+
    ggplot2::geom_histogram(ggplot2::aes(x = mu_baseline, fill = "Baseline error"),
                            alpha = 0.9) +
    ggplot2::geom_histogram(ggplot2::aes(x = mu_error, fill = "Error"),
                            alpha = 0.7) +
    ggplot2::geom_vline(aes(xintercept = median(mu_baseline),color = "Baseline error"),
                        linetype = "dashed", size = 0.8) +
    ggplot2::geom_vline(aes(xintercept = median(mu_error),color = "Error"),
                        linetype = "dashed", size = 0.8) +
    ggplot2::theme_classic() +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 12)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
    ggplot2::ylab("Frequency") +
    ggplot2::xlab(expression(mu ~ Error))+
    ggplot2::scale_color_manual(name = "Estimation error",
                                values = color_values,
                                labels = c("Baseline error", "Error"))+
    ggplot2::scale_fill_manual(name = "Estimation error",
                               values = color_values,
                               labels = c("Baseline error", "Error"))

  p_gam <-ggplot2::ggplot(data = error_df) +
    ggplot2::theme_bw() +
    xlim(-0.03,0.03)+
    ggplot2::geom_histogram(ggplot2::aes(x = gam_baseline, fill = "Baseline error"),
                            alpha = 0.9) +
    ggplot2::geom_histogram(ggplot2::aes(x = gam_error, fill = "Error"),
                            alpha = 0.7) +
    ggplot2::geom_vline(aes(xintercept = median(gam_baseline),color = "Baseline error"),
                        linetype = "dashed", size = 0.8) +
    ggplot2::geom_vline(aes(xintercept = median(gam_error),color = "Error"),
                        linetype = "dashed", size = 0.8) +
    ggplot2::theme_classic() +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 12)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
    ggplot2::ylab("Frequency") +
    ggplot2::xlab(expression(gamma ~ Error))+
    ggplot2::scale_color_manual(name = "Estimation error",
                                values = color_values,
                                labels = c("Baseline error", "Error"))+
    ggplot2::scale_fill_manual(name = "Estimation error",
                               values = color_values,
                               labels = c("Baseline error", "Error"))

  p_laa <-ggplot2::ggplot(data = error_df) +
    ggplot2::theme_bw() +
    xlim(-1,1)+
    ggplot2::geom_histogram(ggplot2::aes(x = laa_baseline, fill = "Baseline error"),
                            alpha = 0.9) +
    ggplot2::geom_histogram(ggplot2::aes(x = laa_error, fill = "Error"),
                            alpha = 0.7) +
    ggplot2::geom_vline(aes(xintercept = median(laa_baseline),color = "Baseline error"),
                        linetype = "dashed", size = 0.8) +
    ggplot2::geom_vline(aes(xintercept = median(laa_error),color = "Error"),
                        linetype = "dashed", size = 0.8) +
    ggplot2::theme_classic() +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 12)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 12)) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
    ggplot2::ylab("Frequency") +
    ggplot2::xlab(expression(lambda^a ~ Error))+
    ggplot2::scale_color_manual(name = "Estimation error",
                                values = color_values,
                                labels = c("Baseline error", "Error"))+
    ggplot2::scale_fill_manual(name = "Estimation error",
                               values = color_values,
                               labels = c("Baseline error", "Error"))


  tiff(paste0("G:/results/project 1/plot_rate_error/",param_set,".tiff"),
       units="px", width=3000, height=2000,res = 300,compression="lzw")
  param_estimates <- cowplot::plot_grid(
    p_lac,p_mu,p_gam,p_laa,
    align = "hv", nrow = 2, ncol = 2
  )
  # param_est_final <- cowplot::plot_grid(param_estimates,legend_all,rel_widths = c(3, .4))
  print(param_estimates)
  while (!is.null(dev.list()))  dev.off()
}

save_error_plots <- function(param_space_name) {
  path <- file.path("results/new_final_all", param_space_name)
  list_names <- list.files(path = path)
  est_error_median <- c()
  for (i in seq_along(list_names)) {
    param_set_name <- tools::file_path_sans_ext(list_names[i])
    param_set <- as.numeric(stringr::str_extract(list_names[i], "\\d+"))
    load(file.path(path, list_names[i]))
    # output <- readRDS(file.path(path, list_names[i]))
    output <- output
    est_error <- get_rates_error(output, param_set)
    error_df <- as.data.frame(do.call(cbind,lapply(est_error,function(x) unlist(x))))
    est_error_median<- rbind(est_error_median,sapply(error_df,FUN=median))
    plot_error(error_df = error_df, param_set = param_set)
  }
  est_error_median <- as.data.frame(est_error_median)
  return(est_error_median)
}
# est_error_df <- save_error_plots("trait_CES")

calc_est_error <- function(folder_path, param_set_range = NULL) {

  testit::assert("Chosen directory exists", dir.exists(folder_path))

  start_time <- Sys.time()
  message("Start time: ", start_time)
  files <- list.files(folder_path)
  data_file_indices <- grep(x = files, pattern = ".RData")
  n_files <- length(data_file_indices)
  testit::assert(
    ".RData files exist",
    n_files > 0
  )
  message(n_files, " data files found.")
  message("Looking for parameter set ",
          min(param_set_range),
          " to ",
          max(param_set_range),
          ".")

  pb <- utils::txtProgressBar(
    min = min(param_set_range),
    max = max(param_set_range),
    style = 3
  )


  est_error_median <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    if (!identical(file_to_load, character())) {
      load(file.path(folder_path, file_to_load))
      output <- output
      est_error <- get_rates_error(output, i)
      error_df <- as.data.frame(do.call(cbind,lapply(est_error,function(x) unlist(x))))
      est_error_median<- rbind(est_error_median,sapply(error_df,FUN=median))
    }
    utils::setTxtProgressBar(pb, i)
  }
  est_error_median <- as.data.frame(est_error_median)
  message("\nTime elapsed: ", Sys.time() - start_time)
  return(est_error_median)
}

calc_est_ed95_abs <- function(folder_path, param_set_range = NULL) {

  testit::assert("Chosen directory exists", dir.exists(folder_path))

  start_time <- Sys.time()
  message("Start time: ", start_time)
  files <- list.files(folder_path)
  data_file_indices <- grep(x = files, pattern = ".RData")
  n_files <- length(data_file_indices)
  testit::assert(
    ".RData files exist",
    n_files > 0
  )
  message(n_files, " data files found.")
  message("Looking for parameter set ",
          min(param_set_range),
          " to ",
          max(param_set_range),
          ".")

  pb <- utils::txtProgressBar(
    min = min(param_set_range),
    max = max(param_set_range),
    style = 3
  )


  ed95_rates <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    if (!identical(file_to_load, character())) {
      load(file.path(folder_path, file_to_load))
      output <- output
      est_error <- get_rates_error(output, i)

      boundary_lac_baseline <- stats::quantile(abs(est_error$lac_baseline),0.95)
      boundary_mu_baseline <- stats::quantile(abs(est_error$mu_baseline),0.95)
      boundary_gam_baseline <- stats::quantile(abs(est_error$gam_baseline),0.95)
      boundary_laa_baseline <- stats::quantile(abs(est_error$laa_baseline),0.95)

      ed95_lac <- (sum(abs(est_error$lac_error) > boundary_lac_baseline) + 1) /
        (length(abs(est_error$lac_baseline)) + 1)
      ed95_mu <- (sum(abs(est_error$mu_error) > boundary_mu_baseline) + 1) /
        (length(abs(est_error$mu_baseline)) + 1)
      ed95_gam <- (sum(abs(est_error$gam_error) > boundary_gam_baseline) + 1) /
        (length(abs(est_error$gam_baseline)) + 1)
      ed95_laa <- (sum(abs(est_error$laa_error) > boundary_laa_baseline) + 1) /
        (length(abs(est_error$laa_baseline)) + 1)

      ed95_rates <- rbind(ed95_rates,c(ed95_lac,ed95_mu,ed95_gam,ed95_laa))
    }
    utils::setTxtProgressBar(pb, i)
  }
  ed95_rates <- as.data.frame(ed95_rates)
  message("\nTime elapsed: ", Sys.time() - start_time)
  return(ed95_rates)
}


