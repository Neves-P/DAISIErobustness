library(ggplot2)
param_set = 1
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

  # length(lamc1) = length(lamc2)
  lamc1 <- as.data.frame(lamc1)
  lamc2 <- as.data.frame(lamc2)
  ggplot(lamc2, aes(x=lamc2)) +
    geom_density(data = lamc1, aes(x = lamc1),position = "stack", color = "blue",fill = "blue", alpha = 0.2) +
    # ggplot(lamc_est2,aes(x = lamc2))
    # geom_histogram(mapping = aes(y = ..density..),binwidth=0.05,colour = "grey",fill = "grey") +
    geom_density(position = "stack", color = "brown", fill = "brown", alpha = 0.2) +
    # geom_density(position = "stack", color = "blue")
    geom_vline(aes(xintercept=lamc_init),   # Ignore NA values for mean
               color="red", linetype="dashed", size=1) +
    geom_vline(aes(xintercept=lamc_init1),   # Ignore NA values for mean
               color="blue", linetype="dashed", size=1) +
    geom_vline(aes(xintercept=lamc_init2),   # Ignore NA values for mean
               color="blue", linetype="dashed", size=1) +
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

  # length(mu1) = length(mu2)
  mu1 <- as.data.frame(mu1)
  mu2 <- as.data.frame(mu2)
  ggplot(mu2, aes(x=mu2)) +
    geom_density(data = mu1, aes(x = mu1),position = "stack", color = "blue",fill = "blue", alpha = 0.2) +
    # ggplot(lamc_est2,aes(x = lamc2))
    # geom_histogram(mapping = aes(y = ..density..),binwidth=0.05,colour = "grey",fill = "grey") +
    geom_density(data = mu2, aes(x=mu2), position = "stack", color = "brown", fill = "brown", alpha = 0.2) +
    # geom_density(position = "stack", color = "blue")
    geom_vline(aes(xintercept=mu_init),   # Ignore NA values for mean
               color="red", linetype="dashed", size=1) +
    geom_vline(aes(xintercept=mu_init1),   # Ignore NA values for mean
               color="blue", linetype="dashed", size=1) +
    geom_vline(aes(xintercept=mu_init2),   # Ignore NA values for mean
               color="blue", linetype="dashed", size=1) +
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

  # length(K1) = length(K2)
  K1 <- as.data.frame(K1)
  K2 <- as.data.frame(K2)
  ggplot(K2, aes(x=K2)) +
    geom_density(data = K1, aes(x = K1),position = "stack", color = "blue",fill = "blue", alpha = 0.2) +
    # ggplot(lamc_est2,aes(x = lamc2))
    # geom_histogram(mapping = aes(y = ..density..),binwidth=0.05,colour = "grey",fill = "grey") +
    geom_density(position = "stack", color = "brown", fill = "brown", alpha = 0.2) +
    # geom_density(position = "stack", color = "blue")
    geom_vline(aes(xintercept=20),   # Ignore NA values for mean
               color="red", linetype="dashed", size=1) +
    xlim(0,50)+
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

  # length(gamma1) = length(gamma2)
  gamma1 <- as.data.frame(gamma1)
  gamma2 <- as.data.frame(gamma2)
  ggplot(gamma2, aes(x=gamma2)) +
    geom_density(data = gamma1, aes(x = gamma1),position = "stack", color = "blue",fill = "blue", alpha = 0.2) +
    # ggplot(lamc_est2,aes(x = lamc2))
    # geom_histogram(mapping = aes(y = ..density..),binwidth=0.05,colour = "grey",fill = "grey") +
    geom_density(position = "stack", color = "brown", fill = "brown", alpha = 0.2) +
    # geom_density(position = "stacgamma", color = "blue")
    geom_vline(aes(xintercept=gamma_init),   # Ignore NA values for mean
               color="red", linetype="dashed", size=1) +
    geom_vline(aes(xintercept=gamma_init1),   # Ignore NA values for mean
               color="blue", linetype="dashed", size=1) +
    geom_vline(aes(xintercept=gamma_init2),   # Ignore NA values for mean
               color="blue", linetype="dashed", size=1) +
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

  # length(lama1) = length(lama2)
  lama1 <- as.data.frame(lama1)
  lama2 <- as.data.frame(lama2)
  ggplot(lama2, aes(x=lama2)) +
    geom_density(data = lama1, aes(x = lama1),position = "stack", color = "blue",fill = "blue", alpha = 0.2) +
    # ggplot(lamc_est2,aes(x = lamc2))
    # geom_histogram(mapping = aes(y = ..density..),binwidth=0.05,colour = "grey",fill = "grey") +
    geom_density(position = "stack", color = "brown", fill = "brown", alpha = 0.2) +
    # geom_density(position = "staclama", color = "blue")
    geom_vline(aes(xintercept=lama_init),   # Ignore NA values for mean
               color="red", linetype="dashed", size=1) +
    geom_vline(aes(xintercept=lama_init1),   # Ignore NA values for mean
               color="blue", linetype="dashed", size=1) +
    geom_vline(aes(xintercept=lama_init2),   # Ignore NA values for mean
               color="blue", linetype="dashed", size=1) +
    xlim(0,5)+
    xlab("anagenesis rate")+
    ggtitle("anagenesis rate")

}
png(paste0("C:/Users/Lenovo/Desktop/analysis/rates_analysis/ana_",param_set,".png"))
plot_lama(rates = rates)
dev.off()

