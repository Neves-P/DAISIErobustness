## plot est ed95 for each scenario
load("whole_df.RData")
library(ggplot2)
library(cowplot)
lac <- subset(whole_df, RRD_mu == 0 & RRD_gam == 0 & RRD_laa == 0)
mu <- subset(whole_df, RRD_lac == 0 & RRD_gam == 0 & RRD_laa == 0)
gam <- subset(whole_df, RRD_mu == 0 & RRD_lac == 0 & RRD_laa == 0)
laa <- subset(whole_df, RRD_mu == 0 & RRD_gam == 0 & RRD_lac == 0)

trans_type <-  c(expression(atop("high"~italic(q)[12],"high"~italic(q)[21])),
                 expression(atop("high"~italic(q)[12],"low"~italic(q)[21])),
                 expression(atop("low"~italic(q)[12],"high"~italic(q)[21])),
                 expression(atop("low"~italic(q)[12],"low"~italic(q)[21])))

p_lac <- ggplot2::ggplot(gam, ggplot2::aes(x=transition, y=lac_ed95, color = RRD)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_manual("RRD",values=c("gold","red","red4","black"))+
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(expression(ED[95] ~ lambda^c)) +
  ggplot2::ylim(0, 1) +
  ggplot2::scale_x_discrete(labels= trans_type)+
  # ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))

p_mu <- ggplot2::ggplot(gam, ggplot2::aes(x=transition, y=mu_ed95, color = RRD)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_manual("RRD",values=c("gold","red","red4","black"))+
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(expression(ED[95] ~ mu)) +
  ggplot2::ylim(0, 1) +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
# print(p_mu)

p_gam <- ggplot2::ggplot(gam, ggplot2::aes(x=transition, y=gam_ed95, color = RRD)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_manual("RRD",values=c("gold","red","red4","black"))+
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(expression(ED[95] ~ gamma)) +
  ggplot2::ylim(0, 1) +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))


p_laa <- ggplot2::ggplot(gam, ggplot2::aes(x=transition, y=laa_ed95, color = RRD)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_manual("RRD",values=c("gold","red","red4","black"))+
  ggplot2::xlab("Transition") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(expression(ED[95] ~ lambda^a)) +
  ggplot2::ylim(0, 1) +
  ggplot2::scale_x_discrete(labels= trans_type)+
  ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))


tiff(paste0("laa_scenario_est_rate_ed95.tiff"),
     units="px", width=3000, height=1800,res = 300,compression="lzw")
legend <- get_legend(p_lac)
## Cladogenesis/Extinction/Colonization/Anagenesis
title <- ggdraw() + draw_label("Asymmetry in Colonization", fontface='bold')
param_estimates <- cowplot::plot_grid(
  p_lac+ggplot2::theme(legend.position = "none"),
  p_mu,p_gam,p_laa,
  align = "hv", nrow = 2, ncol = 2
)
param_est_final <- cowplot::plot_grid(plot_grid(title,param_estimates,ncol=1, rel_heights=c(0.1, 1)),
                                      legend,rel_widths = c(3, .4))
print(param_est_final)
while (!is.null(dev.list()))  dev.off()


## Cladogenesis/Extinction/Colonization/Anagenesis
title <- ggdraw() + draw_label("Asymmetry in Anagenesis", fontface='bold')
param_est_final_lac <- plot_grid(title,param_est_final_lac,ncol=1, rel_heights=c(0.1, 1))
param_est_final_mu <- plot_grid(title,param_est_final_mu,ncol=1, rel_heights=c(0.1, 1))
param_est_final_gam <- plot_grid(title,param_est_final_gam,ncol=1, rel_heights=c(0.1, 1))
param_est_final_laa <- plot_grid(title,param_est_final_laa,ncol=1, rel_heights=c(0.1, 1))

tiff(paste0("all_est_rate_ed95.tiff"),
     units="px", width=5000, height=3000,res = 300,compression="lzw")
param_ed95_all <- cowplot::plot_grid(
  param_est_final_lac +ggplot2::theme(legend.position = "none"),
  param_est_final_mu+ggplot2::theme(legend.position = "none"),
  param_est_final_gam+ggplot2::theme(legend.position = "none"),
  param_est_final_laa+ggplot2::theme(legend.position = "none"),
  align = "hv", nrow = 2, ncol = 2,labels = c("A", "B", "C", "D")
)
param_ed95_all <- cowplot::plot_grid(param_ed95_all,
                                      legend,rel_widths = c(3, .2))
print(param_ed95_all)
while (!is.null(dev.list()))  dev.off()
