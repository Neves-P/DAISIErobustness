library(ggplot2)
library(grid)
library(plyr)
library(ggpubr)

param_set = 99
weighted_rates <- function(pars_list){
  pars1 <- pars_list$pars
  pars2_list <- pars_list$trait_pars
  pars2 <- c(pars2_list$clado_rate2,
             pars2_list$ext_rate2,
             pars1[3],
             pars2_list$immig_rate2,
             pars2_list$ana_rate2,
             pars2_list$trans_rate,
             pars2_list$trans_rate2)
  M1 <- pars_list$M
  M2 <- pars2_list$M2
  M <- M1 + M2
  lambda_c <- M1/M * pars1[1] + M2/M * pars2[1]
  mu <- M1/M * pars1[2] + M2/M * pars2[2]
  K <- pars1[3]
  gamma <- M1/M * pars1[4] + M2/M * pars2[4]
  lambda_a <- M1/M * pars1[5] + M2/M * pars2[5]
  trans12 <- pars2[6]
  trans21 <- pars2[7]
  weighted_pars <- c(lambda_c, mu, K, gamma, lambda_a, trans12, trans21, M1, M2)
  pars <- list(pure_pars1 = pars1,
               pure_pars2 = pars2,
               weighted_pars = weighted_pars)
  return(pars)
}
formate_rates <- function(output_file,
                          param_space_name = "trait",
                          param_set){
  param_space <- load_param_space(
    param_space_name = "trait")
  init_pars <- extract_param_set (param_space_name = "trait",
                                  param_space = param_space,
                                  param_set = param_set)

  weighted_pars <- weighted_rates(init_pars)

  pure_init_rates1 = weighted_pars$pure_pars1
  pure_init_rates2 = weighted_pars$pure_pars2
  weighted_init_rates = weighted_pars$weighted_pars


  est1 = output_file$geodynamic_ml
  est2 = output_file$oceanic_ml
  est_rates_TraiSIE = do.call(rbind,lapply(est1,function(x) unlist(x)))
  est_rates_DAISIE = do.call(rbind,lapply(est2,function(x) unlist(x)))

  lambda_c <-list(init = weighted_init_rates[1],
                  pure_rate1 = pure_init_rates1[1],
                  pure_rate2 = pure_init_rates2[1],
                  est1 = stats::na.omit(est_rates_TraiSIE[,1]),
                  est2 = stats::na.omit(est_rates_DAISIE[,1])
  )
  mu <-list(init = weighted_init_rates[2],
            pure_rate1 = pure_init_rates1[2],
            pure_rate2 = pure_init_rates2[2],
            est1 = stats::na.omit(est_rates_TraiSIE[,2]),
            est2 = stats::na.omit(est_rates_DAISIE[,2])
  )
  K <-list(init = weighted_init_rates[3],
           est1 = stats::na.omit(est_rates_TraiSIE[,3]),
           est2 = stats::na.omit(est_rates_DAISIE[,3])
  )
  gamma <-list(init = weighted_init_rates[4],
               pure_rate1 = pure_init_rates1[4],
               pure_rate2 = pure_init_rates2[4],
               est1 = stats::na.omit(est_rates_TraiSIE[,4]),
               est2 = stats::na.omit(est_rates_DAISIE[,4])
  )
  lambda_a <-list(init = weighted_init_rates[5],
                  pure_rate1 = pure_init_rates1[5],
                  pure_rate2 = pure_init_rates2[5],
                  est1 = stats::na.omit(est_rates_TraiSIE[,5]),
                  est2 = stats::na.omit(est_rates_DAISIE[,5])
  )
  rates <- list(lambda_c = lambda_c,
                mu = mu,
                K = K,
                gamma = gamma,
                lambda_a = lambda_a)
  return(rates)
}

## input different simulation results
rates <-formate_rates(output_file = output_file,
                      param_set = param_set)

#### plot clado rates####
plot_lambdac <- function(rates){
  lamc <- rates$lambda_c
  lamc_init <- lamc$init
  lamc1 <- lamc$est1
  lamc2 <- lamc$est2
  lamc_init1 <-lamc$pure_rate1
  lamc_init2 <-lamc$pure_rate2

  data <-data.frame(lamc1,lamc2)
  colnames(data) <- c("TraiSIE estimation", "DAISIE estimation")
  mean_est1 <- mean(unlist(data[1]))
  median_est1 <- median(unlist(data[1]))
  mean_est2 <- mean(unlist(data[2]))
  median_est2 <- median(unlist(data[2]))
  data <- tidyr::gather(data)


  cdat <- ddply(data, "key", summarise, rate.median = median(value))

  ggplot(data, aes(x=value,fill = key)) +
    geom_density(alpha = 0.3) +
    geom_vline(data = cdat,
               aes(xintercept = rate.median, color = key), linetype = "dashed",
               size = 1) +
    geom_segment(aes(x = lamc_init, y = 0.5, xend = lamc_init, yend = 0), size = 1.5, color = "black",
                 arrow = arrow(length = unit(0.5, "cm"))) +
    xlim(0,1)+
    xlab("cladogenesis")+
    ggtitle("cladogenetic speciation rate")

}
png(paste0("C:/Users/Lenovo/Desktop/analysis/rates_analysis/clado_",param_set,".png"))
plot_lambdac(rates = rates)
dev.off()

#### plot extinction rates####
plot_mu <- function(rates){
  mu <- rates$mu
  mu_init <- mu$init
  mu1 <- mu$est1
  mu2 <- mu$est2
  mu_init1 <-mu$pure_rate1
  mu_init2 <-mu$pure_rate2

  data <-data.frame(mu1,mu2)
  colnames(data) <- c("TraiSIE estimation", "DAISIE estimation")
  mean_est1 <- mean(unlist(data[1]))
  median_est1 <- median(unlist(data[1]))
  mean_est2 <- mean(unlist(data[2]))
  median_est2 <- median(unlist(data[2]))
  data <- tidyr::gather(data)
  cdat <- ddply(data, "key", summarise, rate.median = median(value))

  ggplot(data, aes(x=value,fill = key)) +
    geom_density(alpha = 0.3) +
    geom_vline(data = cdat,
               aes(xintercept = rate.median, color = key), linetype = "dashed",
               size = 1) +
    geom_segment(aes(x = mu_init, y = 0.3, xend = mu_init, yend = 0), size = 1.5, color = "black",
                 arrow = arrow(length = unit(0.4, "cm"))) +
    xlim(0,2)+
    xlab("extinction")+
    ggtitle("extinction rate")

}

png(paste0("C:/Users/Lenovo/Desktop/analysis/rates_analysis/ext_",param_set,".png"))
plot_mu(rates = rates)
dev.off()

#### plot carrying capacity####
plot_K <- function(rates){
  K <- rates$K
  K_init <- K$init
  K1 <- K$est1
  K2 <- K$est2

  data <-data.frame(K1,K2)
  colnames(data) <- c("TraiSIE estimation", "DAISIE estimation")
  mean_est1 <- mean(unlist(data[1]))
  median_est1 <- median(unlist(data[1]))
  mean_est2 <- mean(unlist(data[2]))
  median_est2 <- median(unlist(data[2]))
  data <- tidyr::gather(data)
  cdat <- ddply(data, "key", summarise, rate.median = median(value))

  ggplot(data, aes(x=value,fill = key)) +
    geom_density(alpha = 0.3) +
    geom_vline(data = cdat,
               aes(xintercept = rate.median, color = key), linetype = "dashed",
               size = 1) +
    geom_segment(aes(x = K_init, y = 0.05, xend = K_init, yend = 0), size = 1.5, color = "black",
                 arrow = arrow(length = unit(0.4, "cm"))) +
    xlim(0,20)+
    xlab("carrying capacity")+
    ggtitle("carrying capacity")

}
png(paste0("C:/Users/Lenovo/Desktop/analysis/rates_analysis/K_",param_set,".png"))
plot_K(rates = rates)
dev.off()


#### plot immigration rates####
plot_gamma <- function(rates){
  gamma <- rates$gamma
  gamma_init <- gamma$init
  gamma1 <- gamma$est1
  gamma2 <- gamma$est2
  gamma_init1 <-gamma$pure_rate1
  gamma_init2 <-gamma$pure_rate2

  data <-data.frame(gamma1,gamma2)
  colnames(data) <- c("TraiSIE estimation", "DAISIE estimation")
  mean_est1 <- mean(unlist(data[1]))
  median_est1 <- median(unlist(data[1]))
  mean_est2 <- mean(unlist(data[2]))
  median_est2 <- median(unlist(data[2]))
  data <- tidyr::gather(data)
  cdat <- ddply(data, "key", summarise, rate.median = median(value))

  ggplot(data, aes(x=value,fill = key)) +
    geom_density(alpha = 0.3) +
    geom_vline(data = cdat,
               aes(xintercept = rate.median, color = key), linetype = "dashed",
               size = 1) +
    geom_segment(aes(x = gamma_init, y = 10, xend = gamma_init, yend = 0), size = 1.5, color = "black",
                 arrow = arrow(length = unit(0.4, "cm"))) +
    xlim(0,0.1)+
    xlab("immigration rate")+
    ggtitle("immigration rate")

}
png(paste0("C:/Users/Lenovo/Desktop/analysis/rates_analysis/immig_",param_set,".png"))
plot_gamma(rates = rates)
dev.off()

plot_lama <- function(rates){
  lama <- rates$lambda_a
  lama_init <- lama$init
  lama1 <- lama$est1
  lama2 <- lama$est2
  lama_init1 <-lama$pure_rate1
  lama_init2 <-lama$pure_rate2

  data <-data.frame(lama1,lama2)
  colnames(data) <- c("TraiSIE estimation", "DAISIE estimation")
  mean_est1 <- mean(unlist(data[1]))
  median_est1 <- median(unlist(data[1]))
  mean_est2 <- mean(unlist(data[2]))
  median_est2 <- median(unlist(data[2]))
  data <- tidyr::gather(data)
  cdat <- ddply(data, "key", summarise, rate.median = median(value))

  ggplot(data, aes(x=value,fill = key)) +
    geom_density(alpha = 0.3) +
    geom_vline(data = cdat,
               aes(xintercept = rate.median, color = key), linetype = "dashed",
               size = 1) +
    geom_segment(aes(x = lama_init, y = 0.1, xend = lama_init, yend = 0), size = 1.5, color = "black",
                 arrow = arrow(length = unit(0.4, "cm"))) +
    xlim(0,8)+
    xlab("anagenesis rate")+
    ggtitle("anagenesis rate")

}
png(paste0("C:/Users/Lenovo/Desktop/analysis/rates_analysis/ana_",param_set,".png"))
plot_lama(rates = rates)
dev.off()

#### plot error distributions####
png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/spec_nltt_",param_set,".png"))
plot_error_dists (output_file, error = "spec_nltt")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/endemic_nltt_",param_set,".png"))
plot_error_dists (output_file, error = "endemic_nltt")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/nonendemic_nltt_",param_set,".png"))
plot_error_dists (output_file, error = "nonendemic_nltt")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/num_spec_",param_set,".png"))
plot_error_dists (output_file, error = "num_spec")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/num_col_",param_set,".png"))
plot_error_dists (output_file, error = "num_col")
dev.off()

#### boxplot errors####
png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline_boxplot_error/spec_nltt_",param_set,".png"))
boxplot_error_dists (output_file, error = "spec_nltt")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline_boxplot_error/endemic_nltt_",param_set,".png"))
boxplot_error_dists (output_file, error = "endemic_nltt")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline_boxplot_error/nonendemic_nltt_",param_set,".png"))
boxplot_error_dists (output_file, error = "nonendemic_nltt")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline_boxplot_error/num_spec_",param_set,".png"))
boxplot_error_dists (output_file, error = "num_spec")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline_boxplot_error/num_col_",param_set,".png"))
boxplot_error_dists (output_file, error = "num_col")
dev.off()


