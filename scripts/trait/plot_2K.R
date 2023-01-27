## plot 2K scenarios
source("scripts/trait/calc_stat_diff_trait.R")
source("scripts/trait/calc_cssd_ctsd.R")

folder_path <- "data_shu_et_al/Two Ks"
CES <- calc_stat_diff_trait(folder_path, 1:192)
save(CES,file = "CES_2K.RData")

#### START
#### step1: create whole dataframe to do anova test and to make plots
load("CES_2K.RData")
load("DAISIErobustness/inst/extdata/trait_CES_2K.rda")
CES_data <- trait_CES_2K

ss1 <- c(CES$stat_diff_spec_nltt)
ss2 <- c(CES$stat_diff_endemic_nltt)
ss3 <- c(CES$stat_diff_nonendemic_nltt)
ss4 <- c(CES$stat_diff_num_spec)
ss5 <- c(CES$stat_diff_num_col)
ss6 <- c(CES$stat_diff_clade_size)
ss7 <- c(CES$stat_diff_colon_time)

whole_df <- data.frame(CES_data,ss1,ss2,ss3,ss4,ss5,ss6,ss7,
                       stringsAsFactors = TRUE)
##K
whole_df$K_diff[whole_df$K == "2"] <- "Large"
whole_df$K_diff[whole_df$K == "5"] <- "Small"
whole_df$K_diff[whole_df$K == "10"] <- "Same"
whole_df$Asymmetry <- rep("2K-sym",192)
whole_df$RRD <-factor(rep(0,192))
whole_df$transition <- whole_df$trans
whole_df$transition[whole_df$trans == "0.02" & whole_df$trans2 == "0.02"] <- "ll"
whole_df$transition[whole_df$trans == "0.2" & whole_df$trans2 == "0.02"] <- "hl"
whole_df$transition[whole_df$trans == "0.02" & whole_df$trans2 == "0.2"] <- "lh"
whole_df$transition[whole_df$trans == "0.2" & whole_df$trans2 == "0.2"] <- "hh"
save(whole_df,file = "2K/whole_df.RData")

#### plots:
load("2K/whole_df.RData")
whole_df_2K <- whole_df
whole_df_2K <- whole_df_2K[, -c(11,16)]
load("whole_df.RData")
sym <- subset(whole_df, Asymmetry == "Symmetric")

whole_with_2K <-rbind(whole_df_2K[,1:21],
                      sym[,1:21])
whole_with_2K$transition[whole_with_2K$trans == "0.02" & whole_with_2K$trans2 == "0.02"] <- "ll"
whole_with_2K$transition[whole_with_2K$trans == "0.2" & whole_with_2K$trans2 == "0.02"] <- "hl"
whole_with_2K$transition[whole_with_2K$trans == "0.02" & whole_with_2K$trans2 == "0.2"] <- "lh"
whole_with_2K$transition[whole_with_2K$trans == "0.2" & whole_with_2K$trans2 == "0.2"] <- "hh"

whole_with_2K$K_diff[whole_with_2K$K == "DD"] <- "DD"
whole_with_2K$K_diff[whole_with_2K$K == "DI"] <- "DI"
whole_with_2K$K_diff[whole_with_2K$K == "2"] <- "Large"
whole_with_2K$K_diff[whole_with_2K$K == "5"] <- "Small"
whole_with_2K$K_diff[whole_with_2K$K == "10"] <- "Same"

save(whole_with_2K,file = "whole_with_2K.RData")

#### make plots
load("whole_with_2K.RData")

trans_type <-  c(expression(atop("high"~italic(q)[12],"high"~italic(q)[21])),
                 expression(atop("high"~italic(q)[12],"low"~italic(q)[21])),
                 expression(atop("low"~italic(q)[12],"high"~italic(q)[21])),
                 expression(atop("low"~italic(q)[12],"low"~italic(q)[21])))

cbp1 <- c("#CC79A7", "#FC4E07","#0072B2", "#009E73","#E69F00",
          "#F0E442", "#56B4E9", "#D55E00")
ss = 1
if (ss == 1) {
  error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  error_label <- expression(ED[95] ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  error_label <- expression(ED[95] ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  error_label <- expression(ED[95] ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  error_label <- expression(ED[95] ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
# custom.col <- c("#FFDB6D", "#C4961A", "#F4EDCA",
#                 "#D16103", "#C3D7A4", "#52854C", "#4E84C4", "#293352")


p1 <- ggplot2::ggplot(whole_with_2K, ggplot2::aes(x=transition, y=ss1, color = K_diff)) +  ##change y and factor  (shape = K)
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  # ggplot2::scale_color_brewer(palette = "Set2") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::scale_color_manual(name = "Carrying capacity",
                              breaks = c("DD", "DI", "Large","Small","Same"),
                              values = cbp1,
                              labels = expression(single~K ~ DD, single~K~DI,
                                                  K[1]~2~K[2]~18,K[1]~5~K[2]~15,K[1]~10~K[2]~10))+
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 15, hjust = 0.5))
print(p1)
ss = 2
if (ss == 1) {
  error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  error_label <- expression(ED[95] ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  error_label <- expression(ED[95] ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  error_label <- expression(ED[95] ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  error_label <- expression(ED[95] ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
# error_label <- "Error"
p2 <- ggplot2::ggplot(whole_with_2K, ggplot2::aes(x=transition, y=ss2, color = K_diff)) +  ##change y and factor  (shape = K)
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  # ggplot2::scale_color_brewer(palette = "Set2") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::scale_color_manual(name = "Carrying capacity",
                              breaks = c("DD", "DI", "Large","Small","Same"),
                              values = cbp1,
                              labels = expression(single~K ~ 20, single~K~infinite,
                                                  K[1]~2~K[2]~18,K[1]~5~K[2]~15,K[1]~10~K[2]~10))+
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 15, hjust = 0.5))

ss = 3
if (ss == 1) {
  error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  error_label <- expression(ED[95] ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  error_label <- expression(ED[95] ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  error_label <- expression(ED[95] ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  error_label <- expression(ED[95] ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
# error_label <- "Error"
p3 <- ggplot2::ggplot(whole_with_2K, ggplot2::aes(x=transition, y=ss3, color = K_diff)) +  ##change y and factor  (shape = K)
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  # ggplot2::scale_color_brewer(palette = "Set2") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::scale_color_manual(name = "Carrying capacity",
                              breaks = c("DD", "DI", "Large","Small","Same"),
                              values = cbp1,
                              labels = expression(single~K ~ 20, single~K~infinite,
                                                  K[1]~2~K[2]~18,K[1]~5~K[2]~15,K[1]~10~K[2]~10))+
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 15, hjust = 0.5))

ss = 4
if (ss == 1) {
  error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  error_label <- expression(ED[95] ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  error_label <- expression(ED[95] ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  error_label <- expression(ED[95] ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  error_label <- expression(ED[95] ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
# error_label <- "Error"
p4 <- ggplot2::ggplot(whole_with_2K, ggplot2::aes(x=transition, y=ss4, color = K_diff)) +  ##change y and factor  (shape = K)
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  # ggplot2::scale_color_brewer(palette = "Set2") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::scale_color_manual(name = "Carrying capacity",
                              breaks = c("DD", "DI", "Large","Small","Same"),
                              values = cbp1,
                              labels = expression(single~K ~ 20, single~K~infinite,
                                      K[1]~2~K[2]~18,K[1]~5~K[2]~15,K[1]~10~K[2]~10))+
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 15, hjust = 0.5))
p4

ss = 5
if (ss == 1) {
  error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  error_label <- expression(ED[95] ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  error_label <- expression(ED[95] ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  error_label <- expression(ED[95] ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  error_label <- expression(ED[95] ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
# error_label <- "Error"
p5 <- ggplot2::ggplot(whole_with_2K, ggplot2::aes(x=transition, y=ss5, color = K_diff)) +  ##change y and factor  (shape = K)
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  # ggplot2::scale_color_brewer(palette = "Set2") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::scale_color_manual(name = "Carrying capacity",
                              breaks = c("DD", "DI", "Large","Small","Same"),
                              values = cbp1,
                              labels = expression(single~K ~ 20, single~K~infinite,
                                                  K[1]~2~K[2]~18,K[1]~5~K[2]~15,K[1]~10~K[2]~10))+
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 15, hjust = 0.5))
ss = 6
if (ss == 1) {
  error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  error_label <- expression(ED[95] ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  error_label <- expression(ED[95] ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  error_label <- expression(ED[95] ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  error_label <- expression(ED[95] ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
# error_label <- "Error"
p6 <- ggplot2::ggplot(whole_with_2K, ggplot2::aes(x=transition, y=ss6, color = K_diff)) +  ##change y and factor  (shape = K)
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  # ggplot2::scale_color_brewer(palette = "Set2") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::scale_color_manual(name = "Carrying capacity",
                              breaks = c("DD", "DI", "Large","Small","Same"),
                              values = cbp1,
                              labels = expression(single~K ~ 20, single~K~infinite,
                                                  K[1]~2~K[2]~18,K[1]~5~K[2]~15,K[1]~10~K[2]~10))+
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 15, hjust = 0.5))


ss = 7
if (ss == 1) {
  error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  error_label <- expression(ED[95] ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  error_label <- expression(ED[95] ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  error_label <- expression(ED[95] ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  error_label <- expression(ED[95] ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
# error_label <- "Error"
p7 <- ggplot2::ggplot(whole_with_2K, ggplot2::aes(x=transition, y=ss7, color = K_diff)) +  ##change y and factor  (shape = K)
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  # ggplot2::scale_color_brewer(palette = "Set2") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::scale_color_manual(name = "Carrying capacity",
                              breaks = c("DD", "DI", "Large","Small","Same"),
                              values = cbp1,
                              labels = expression(single~K ~ DD, single~K~DI,
                                                  K[1]~2~K[2]~18,K[1]~5~K[2]~15,K[1]~10~K[2]~10))+
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15)) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 18)) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 18)) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 15, hjust = 0.5))

library(ggplot2)
library(cowplot)
legend <- get_legend(p7)
tiff(paste0("ED95_2K.tiff"),
     units="px", width=5000, height=2500,res = 300,compression="lzw")
p_grid <- ggdraw(plot_grid(plot_grid(p1, p2,p3,p4,p5,p6,
                           p7 + ggplot2::theme(legend.position="none"),legend, nrow = 2,align = "h"),
                 rel_heights=c(1, 1)))
print(p_grid)
while (!is.null(dev.list()))  dev.off()
