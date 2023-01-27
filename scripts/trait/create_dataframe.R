### The expected number of endemics and non-endemics under the DAISIE model
source("scripts/trait/calc_stat_diff_trait.R")
source("scripts/trait/calc_cssd_ctsd.R")
source("scripts/trait/calc_tip_rates.R")
source("scripts/trait/calc_clade_size_sd.R")
source("scripts/trait/plot_est_error.R")
source("scripts/trait/calc_hellinger_dist.R")

folder_path <- "data_shu_et_al/Trait dependent"
CES <- calc_stat_diff_trait(folder_path, 1:1664)
# save(CES,file = "paper.RData")
CES_est_error <- calc_est_error(folder_path,1:1664)
# save(CES_est_error,file = "CES_est_error.RData")
rates_ed95_abs <- calc_est_ed95_abs(folder_path,1:1664)
# save(rates_ed95_abs,file = "rates_ed95_abs.RData")
hellinger <- calc_hellinger_dist_trait(folder_path, 1:1664)
# save(hellinger,file = "hellinger_dist.RData")
tip_ratio <- calc_tip_ratios(folder_path, 1:1664)
# save(tip_ratio,file = "paper_tip_ratio.RData")
clade_size_sd <- calc_novel_cs_sd(folder_path, 1:1664)
# save(clade_size_sd,file = "paper_clade_size_sd.RData")

#### START
#### step1: create whole dataframe for all the statitsics and inference
load("paper.RData")
load("DAISIErobustness/inst/extdata/trait_CES.rda")
CES_data <- trait_CES
load("paper_tip_ratio.RData")
load("paper_clade_size_sd.RData")
load("CES_est_error.RData")
load("rates_ed95_abs.RData")
tip_ratio[tip_ratio<1 & !is.na(tip_ratio)]<- 1/tip_ratio[tip_ratio<1 & !is.na(tip_ratio)]

ss1 <- c(CES$stat_diff_spec_nltt)
ss2 <- c(CES$stat_diff_endemic_nltt)
ss3 <- c(CES$stat_diff_nonendemic_nltt)
ss4 <- c(CES$stat_diff_num_spec)
ss5 <- c(CES$stat_diff_num_col)
ss6 <- c(CES$stat_diff_clade_size)
ss7 <- c(CES$stat_diff_colon_time)

scenario <- rep(c("G1","G2","G3","G4","G5","G6","G7","G8","G9","G10","G11","G12","G13","G14","G15","G16"),each = 104)
whole_df <- data.frame(CES_data,ss1,ss2,ss3,ss4,ss5,ss6,ss7,
                       scenario,stringsAsFactors = TRUE)
whole_df <- cbind(whole_df,CES_est_error)
## K
whole_df$K[whole_df$K == "20"] <- "DD"
whole_df$K[whole_df$K == "Inf"] <- "DI"
whole_df$transition <- whole_df$trans
whole_df$transition[whole_df$trans == "0.02" & whole_df$trans2 == "0.02"] <- "ll"
whole_df$transition[whole_df$trans == "0.2" & whole_df$trans2 == "0.02"] <- "hl"
whole_df$transition[whole_df$trans == "0.02" & whole_df$trans2 == "0.2"] <- "lh"
whole_df$transition[whole_df$trans == "0.2" & whole_df$trans2 == "0.2"] <- "hh"

#### step2: claculate the mean rates and RRDs
options(na.action = "na.fail")
library(tidyr)
## add mean rate and diff ratio into dataframe
whole_df$mean_lac <- (whole_df$lac + whole_df$lac2)/2
whole_df$mean_mu <- (whole_df$mu + whole_df$mu2)/2
whole_df$mean_gam <- (whole_df$gam + whole_df$gam2)/2
whole_df$mean_laa <- (whole_df$laa + whole_df$laa2)/2

whole_df$RRD_lac <- (whole_df$lac2 - whole_df$lac)/whole_df$mean_lac
whole_df$RRD_mu <- (whole_df$mu2 - whole_df$mu)/whole_df$mean_mu
whole_df$RRD_gam <- (whole_df$gam2 - whole_df$gam)/whole_df$mean_gam
whole_df$RRD_laa <- (whole_df$laa2 - whole_df$laa)/whole_df$mean_laa

whole_df$mean_lac <- factor(whole_df$mean_lac)
whole_df$mean_mu <- factor(whole_df$mean_mu)
whole_df$mean_gam <- factor(whole_df$mean_gam)
whole_df$mean_laa <- factor(whole_df$mean_laa)
whole_df$RRD_lac <- factor(whole_df$RRD_lac)
whole_df$RRD_mu <- factor(whole_df$RRD_mu)
whole_df$RRD_gam <- factor(whole_df$RRD_gam)
whole_df$RRD_laa <- factor(whole_df$RRD_laa)
whole_df$K <- factor(whole_df$K)
str(whole_df)
whole_df$Asymmetry <- rep(c(rep("Symmetric",8),rep(c("Cladogenesis","Extinction","Colonization","Anagenesis"),each = 24)),16)
whole_df$RRD <-factor(rep(c(rep(0,8),rep(c(1.5,1,0.5),32)),16))

colnames(rates_ed95_abs) <- c("lac_ed95","mu_ed95","gam_ed95","laa_ed95")
whole_df <- cbind(whole_df,rates_ed95_abs)
save(whole_df,file = "whole_df.RData")

load("hellinger_dist.RData")
hd_ss1 <- hellinger$hellinger_dist_spec_nltt
hd_ss2 <- hellinger$hellinger_dist_endemic_nltt
hd_ss3 <- hellinger$hellinger_dist_nonendemic_nltt
hd_ss4 <- hellinger$hellinger_dist_num_spec
hd_ss5 <- hellinger$hellinger_dist_num_col
hd_ss6 <- hellinger$hellinger_dist_clade_size
hd_ss7 <- hellinger$hellinger_dist_colon_time
whole_df <- cbind(whole_df,hd_ss1,hd_ss2,hd_ss3,hd_ss4,
                                 hd_ss5,hd_ss6,hd_ss7)
save(whole_df,file = "whole_df_hellinger_dist.RData")
