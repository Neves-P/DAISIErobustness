load("G:/R/DAISIErobustness/plots/paper_final_whole_df.RData")

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
# error_label <- "Error"
p1 <- ggplot2::ggplot(whole_df, ggplot2::aes(x=RRD, y=ss1, color = Asymmetry)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_brewer(palette = "Set1") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("RRD") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15,colour = "black")) +
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
p2 <- ggplot2::ggplot(whole_df, ggplot2::aes(x=RRD, y=ss2, color = Asymmetry)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_brewer(palette = "Set1") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("RRD") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15,colour = "black")) +
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
p3 <- ggplot2::ggplot(whole_df, ggplot2::aes(x=RRD, y=ss3, color = Asymmetry)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_brewer(palette = "Set1") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("RRD") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 14, hjust = 0.5))

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
p4 <- ggplot2::ggplot(whole_df, ggplot2::aes(x=RRD, y=ss4, color = Asymmetry)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_brewer(palette = "Set1") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("RRD") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 15, hjust = 0.5))

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
p5 <- ggplot2::ggplot(whole_df, ggplot2::aes(x=RRD, y=ss5, color = Asymmetry)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_brewer(palette = "Set1") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("RRD") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15,colour = "black")) +
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
p6 <- ggplot2::ggplot(whole_df, ggplot2::aes(x=RRD, y=ss6, color = Asymmetry)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_brewer(palette = "Set1") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("RRD") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.position = "none") +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15,colour = "black")) +
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
p7 <- ggplot2::ggplot(whole_df, ggplot2::aes(x=RRD, y=ss7, color = Asymmetry)) +  ##change y and factor  (shape = K)
  ggplot2::theme_bw() +
  ggplot2::theme_classic() +
  ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(jitter.width = 0.01, dodge.width = 0.6)) +  ##position = ggplot2::position_jitterdodge(0.2)
  ggplot2::scale_color_brewer(palette = "Set1") +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.3) +
  ggplot2::xlab("RRD") +  #Rate differential ratio of anagenesis/Diversity dependence
  ggplot2::ylab(error_label) +
  ggplot2::ylim(0, 0.3) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 15,colour = "black")) +
  ggplot2::theme(plot.margin = ggplot2::margin(6, 2, 6, 2)) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 15, hjust = 0.5))


library(ggplot2)
library(cowplot)
legend <- get_legend(p7)
tiff(paste0("G:/results/project 1/paper_plots/ss_all.tiff"),
     units="px", width=5000, height=2500,res = 250,compression="lzw")
p_ed95 <- ggdraw(plot_grid(plot_grid(p1, p2,p3,p4,p5,p6,
                                     p7 + ggplot2::theme(legend.position="none"),legend, nrow = 2,align = "h"),
                           rel_heights=c(1, 1)))
print(p_ed95)
while (!is.null(dev.list()))  dev.off()
