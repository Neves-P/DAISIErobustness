### plot real_rate vs est_rates
lac <- subset(whole_df, RRD_mu == 0 & RRD_gam == 0 & RRD_laa == 0)
mu <- subset(whole_df, RRD_lac == 0 & RRD_gam == 0 & RRD_laa == 0)
gam <- subset(whole_df, RRD_mu == 0 & RRD_lac == 0 & RRD_laa == 0)
laa <- subset(whole_df, RRD_mu == 0 & RRD_gam == 0 & RRD_lac == 0)


sym1 <- subset(whole_df, Asymmetry == "Symmetric")
lac_names <- c(
  `0.2` = "cladogenesis = 0.2",
  `0.4` = "cladogenesis = 0.4"
)

mu_names <- c(
  `0.1` = "extinction = 0.1",
  `0.2` = "extinction = 0.2"
)
gam_names <- c(
  `0.008` = "colonization = 0.008",
  `0.012` = "colonization = 0.012"
)

laa_names <- c(
  `0.2` = "anagenesis = 0.2",
  `0.4` = "anagenesis = 0.4"
)

library(ggplot2)
library(cowplot)
colors <- c("estimation1"="red","estimation2"="black")

p_lac <- ggplot2::ggplot(sym1, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_lac, color = "estimation1")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(ggplot2::aes(x=as.numeric(RRD) + 0.05,y=est2_lac, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_lac))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of cladogenesis") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated cladogenesis") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~mean_lac,
                      labeller = ggplot2::labeller(mean_lac  = ggplot2::as_labeller(lac_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_lac)


p_lac_mu <- ggplot2::ggplot(lac, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_mu, color = "estimation1")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_mu, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_mu))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of cladogenesis") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated extinction") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_mu,
                      labeller = ggplot2::labeller(mean_mu  = ggplot2::as_labeller(mu_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_lac_mu)


p_lac_gam <- ggplot2::ggplot(lac, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_gam, color = "estimation1")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_gam, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_gam))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of cladogenesis") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated colonization") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0.005, 0.02)+
  ggplot2::facet_grid(~ mean_gam,
                      labeller = ggplot2::labeller(mean_gam  = ggplot2::as_labeller(gam_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_lac_gam)

p_lac_laa <- ggplot2::ggplot(lac, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_laa, color = "estimation1")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_laa, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_laa))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of cladogenesis") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated anagenesis") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_laa,
                      labeller = ggplot2::labeller(mean_laa  = ggplot2::as_labeller(laa_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_lac_laa)

legend <- get_legend(p_lac_laa)
P_lac_all <-plot_grid(p_lac + ggplot2::theme(legend.position="none"),
                      p_lac_mu + ggplot2::theme(legend.position="none"),
                      p_lac_gam + ggplot2::theme(legend.position="none"),
                      p_lac_laa + ggplot2::theme(legend.position="none"),
                      nrow = 1,align = "h",labels = c("A", "B", "C", "D"))
plot_grid(P_lac_all,legend,rel_widths = c(3, 0.4))


## mu group
p_mu <- ggplot2::ggplot(mu, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_mu, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_mu, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_mu))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of extinction") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated extinction") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_mu,
                      labeller = ggplot2::labeller(mean_mu  = ggplot2::as_labeller(mu_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_mu)


p_mu_lac <- ggplot2::ggplot(mu, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_lac, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_lac, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_lac))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of extinction") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated cladogenesis") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_lac,
                      labeller = ggplot2::labeller(mean_lac  = ggplot2::as_labeller(lac_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_mu_lac)


p_mu_gam <- ggplot2::ggplot(mu, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_gam, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_gam, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_gam))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of extinction") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated colonization") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0.005, 0.02)+
  ggplot2::facet_grid(~ mean_gam,
                      labeller = ggplot2::labeller(mean_gam  = ggplot2::as_labeller(gam_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_mu_gam)

p_mu_laa <- ggplot2::ggplot(mu, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_laa, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_laa, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_laa))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of extinction") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated anagenesis") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_laa,
                      labeller = ggplot2::labeller(mean_laa  = ggplot2::as_labeller(laa_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_mu_laa)

legend <- get_legend(p_mu_laa)
P_mu_all <-plot_grid(p_mu_lac + ggplot2::theme(legend.position="none"),
                      p_mu + ggplot2::theme(legend.position="none"),
                      p_mu_gam + ggplot2::theme(legend.position="none"),
                      p_mu_laa + ggplot2::theme(legend.position="none"),
                      nrow = 1,align = "h",labels = c("A", "B", "C", "D"))
plot_grid(P_mu_all,legend,rel_widths = c(3, 0.4))

### gam group
p_gam_mu <- ggplot2::ggplot(gam, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_mu, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_mu, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_mu))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of colonization") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated extinction") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_mu,
                      labeller = ggplot2::labeller(mean_mu  = ggplot2::as_labeller(mu_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_gam_mu)


p_gam_lac <- ggplot2::ggplot(gam, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_lac, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_lac, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_lac))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of colonization") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated cladogenesis") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_lac,
                      labeller = ggplot2::labeller(mean_lac  = ggplot2::as_labeller(lac_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_gam_lac)


p_gam <- ggplot2::ggplot(gam, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_gam, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_gam, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_gam))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of colonization") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated colonization") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0.005, 0.02)+
  ggplot2::facet_grid(~ mean_gam,
                      labeller = ggplot2::labeller(mean_gam  = ggplot2::as_labeller(gam_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_gam)

p_gam_laa <- ggplot2::ggplot(gam, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_laa, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_laa, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_laa))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of colonization") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated anagenesis") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_laa,
                      labeller = ggplot2::labeller(mean_laa  = ggplot2::as_labeller(laa_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_gam_laa)


legend <- get_legend(p_gam_laa)
P_gam_all <-plot_grid(p_gam_lac + ggplot2::theme(legend.position="none"),
                      p_gam_mu + ggplot2::theme(legend.position="none"),
                      p_gam + ggplot2::theme(legend.position="none"),
                      p_gam_laa + ggplot2::theme(legend.position="none"),
                     nrow = 1,align = "h",labels = c("A", "B", "C", "D"))
plot_grid(P_gam_all,legend,rel_widths = c(3, 0.4))

### laa group
p_laa_mu <- ggplot2::ggplot(laa, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_mu, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_mu, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_mu))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of anagenesis") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated extinction") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_mu,
                      labeller = ggplot2::labeller(mean_mu  = ggplot2::as_labeller(mu_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_laa_mu)


p_laa_lac <- ggplot2::ggplot(laa, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_lac, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_lac, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_lac))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of anagenesis") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated cladogenesis") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_lac,
                      labeller = ggplot2::labeller(mean_lac  = ggplot2::as_labeller(lac_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_laa_lac)


p_laa_gam <- ggplot2::ggplot(laa, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_gam, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_gam, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_gam))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of anagenesis") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated colonization") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0.005, 0.02)+
  ggplot2::facet_grid(~ mean_gam,
                      labeller = ggplot2::labeller(mean_gam  = ggplot2::as_labeller(gam_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_laa_gam)

p_laa <- ggplot2::ggplot(laa, ggplot2::aes(x=RRD)) +
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x=RRD,y=est1_laa, color = "estimation1"),
                      position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_point(position = ggplot2::position_jitterdodge(jitter.width = 0.03, dodge.width = 0.5),
                      ggplot2::aes(x=as.numeric(RRD) + 0.15,y=est2_laa, color = "estimation2")) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::geom_hline(ggplot2::aes(yintercept = as.numeric(as.character(mean_laa))), linetype = "solid", size = 0.3) +
  ggplot2::xlab("RRD of anagenesis") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab("estimated anagenesis") +
  ggplot2::scale_color_manual(name = "Estimation",
                              breaks = c("estimation1", "estimation2"),
                              values = colors,
                              labels = c("Estimation1", "Estimation2"))+
  ggplot2::ylim(0, 1)+
  ggplot2::facet_grid(~ mean_laa,
                      labeller = ggplot2::labeller(mean_laa  = ggplot2::as_labeller(laa_names)))+
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))
print(p_laa)

legend <- get_legend(p_laa)
P_laa_all <-plot_grid(p_laa_lac + ggplot2::theme(legend.position="none"),
                      p_laa_mu + ggplot2::theme(legend.position="none"),
                      p_laa_gam + ggplot2::theme(legend.position="none"),
                      p_laa + ggplot2::theme(legend.position="none"),
                      nrow = 1,align = "h",labels = c("A", "B", "C", "D"))
plot_grid(P_laa_all,legend,rel_widths = c(3, 0.4))


# colors <- c("est1"="red","est2"="blue")
# p_lac <- ggplot2::ggplot(lac, ggplot2::aes(x=RRD,y=est1_lac)) +
#   ggplot2::theme_bw() +
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(color = "est1"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(x=RRD,y=est2_lac, color = "est2"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +
#   ggplot2::geom_hline(yintercept = 0.2, linetype = "dashed", size = 0.3) +
#   ggplot2::geom_hline(yintercept = 0.4, linetype = "dashed", size = 0.3) +
#   ggplot2::xlab("RRD of lac") +  #Rate differential ratio of anagenesis/Diversity dependence
#   ggplot2::ylab("estimated lac") +
#   ggplot2::ggtitle("cladogenesis") +
#   ggplot2::scale_color_manual(values = colors)+
#   ggplot2::ylim(0, 1)+
#   ggplot2::facet_wrap(~mean_lac)
# print(p_lac)
#
#
#
# p_lac_mu <- ggplot2::ggplot(lac, ggplot2::aes(x=RRD,y=est1_mu)) +
#   ggplot2::theme_bw() +
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(color = "est1"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(x=RRD,y=est2_mu, color = "est2"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +
#   ggplot2::geom_hline(yintercept = 0.1, linetype = "dashed", size = 0.3) +
#   ggplot2::geom_hline(yintercept = 0.2, linetype = "dashed", size = 0.3) +
#   ggplot2::xlab("real rate") +  #Rate differential ratio of anagenesis/Diversity dependence
#   ggplot2::ylab("estimated rate") +
#   ggplot2::ggtitle("cladogenesis") +
#   ggplot2::scale_color_manual(values = colors)+
#   ggplot2::ylim(0, 1)+
#   ggplot2::facet_wrap(~mean_mu)
# print(p_lac_mu)
#
#
# p_lac_gam <- ggplot2::ggplot(lac, ggplot2::aes(x=RRD,y=est1_gam)) +
#   ggplot2::theme_bw() +
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(color = "est1"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(x=RRD,y=est2_gam, color = "est2"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +
#   ggplot2::geom_hline(yintercept = 0.008, linetype = "dashed", size = 0.3) +
#   ggplot2::geom_hline(yintercept = 0.012, linetype = "dashed", size = 0.3) +
#   ggplot2::xlab("real rate") +  #Rate differential ratio of anagenesis/Diversity dependence
#   ggplot2::ylab("estimated rate") +
#   ggplot2::ggtitle("cladogenesis") +
#   ggplot2::scale_color_manual(values = colors)+
#   ggplot2::ylim(0, 0.015)+
#   ggplot2::facet_wrap(~mean_gam)
# print(p_lac_gam)
#
# p_lac_laa <- ggplot2::ggplot(lac, ggplot2::aes(x=RRD,y=est1_laa)) +
#   ggplot2::theme_bw() +
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(color = "est1"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(x=RRD,y=est2_laa, color = "est2"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +
#   ggplot2::geom_hline(yintercept = 0.2, linetype = "dashed", size = 0.3) +
#   ggplot2::geom_hline(yintercept = 0.4, linetype = "dashed", size = 0.3) +
#   ggplot2::xlab("real rate") +  #Rate differential ratio of anagenesis/Diversity dependence
#   ggplot2::ylab("estimated rate") +
#   ggplot2::ggtitle("cladogenesis") +
#   ggplot2::scale_color_manual(values = colors)+
#   ggplot2::ylim(0, 0.5)+
#   ggplot2::facet_wrap(~mean_gam)
# print(p_lac_laa)
#
#
#
# p_mu <- ggplot2::ggplot(mu, ggplot2::aes(x=RRD,y=est1_mu)) +
#   ggplot2::theme_bw() +
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(color = "est1"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(x=RRD,y=est2_mu, color = "est2"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +
#   ggplot2::geom_hline(yintercept = 0.1, linetype = "dashed", size = 0.3) +
#   ggplot2::geom_hline(yintercept = 0.2, linetype = "dashed", size = 0.3) +
#   ggplot2::xlab("real rate") +  #Rate differential ratio of anagenesis/Diversity dependence
#   ggplot2::ylab("estimated rate") +
#   ggplot2::ggtitle("extinction") +
#   ggplot2::scale_color_manual(values = colors)+
#   ggplot2::ylim(0, 0.3)+
#   ggplot2::facet_wrap(~mean_mu)
# print(p_mu)
#
#
#
# p_gam <- ggplot2::ggplot(gam, ggplot2::aes(x=RRD,y=est1_gam)) +
#   ggplot2::theme_bw() +
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(color = "est1"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
#   ggplot2::geom_jitter(alpha = 0.3,ggplot2::aes(x=RRD,y=est2_gam, color = "est2"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +
#   ggplot2::geom_hline(yintercept = 0.008, linetype = "dashed", size = 0.3) +
#   ggplot2::geom_hline(yintercept = 0.012, linetype = "dashed", size = 0.3) +
#   ggplot2::xlab("real rate") +  #Rate differential ratio of anagenesis/Diversity dependence
#   ggplot2::ylab("estimated rate") +
#   ggplot2::ggtitle("colonization") +
#   ggplot2::scale_color_manual(values = colors)+
#   ggplot2::ylim(0.005, 0.015)+
#   ggplot2::facet_wrap(~mean_gam)
# print(p_gam)
#
#
# p_laa <- ggplot2::ggplot(laa, ggplot2::aes(x=RRD,y=est1_laa)) +
#   ggplot2::theme_bw() +
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(color = "est1"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
#   ggplot2::geom_jitter(alpha = 0.5,ggplot2::aes(x=RRD,y=est2_laa, color = "est2"),position = ggplot2::position_jitterdodge(jitter.width = 0.3, dodge.width = 0.6)) +
#   ggplot2::geom_hline(yintercept = 0.2, linetype = "dashed", size = 0.3) +
#   ggplot2::geom_hline(yintercept = 0.4, linetype = "dashed", size = 0.3) +
#   ggplot2::xlab("real rate") +  #Rate differential ratio of anagenesis/Diversity dependence
#   ggplot2::ylab("estimated rate") +
#   ggplot2::ggtitle("anagenesis") +
#   ggplot2::scale_color_manual(values = colors)+
#   ggplot2::ylim(0, 0.5)+
#   ggplot2::facet_wrap(~mean_laa)
# print(p_laa)


