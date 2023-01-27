load("whole_df_hellinger_dist.RData")
ss = 1
if (ss == 1) {
  x_error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  y_error_label <- expression(HD ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  x_error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  y_error_label <- expression(HD ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  x_error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  y_error_label <- expression(HD ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  x_error_label <- expression(ED[95] ~ (N["Spec"]))
  y_error_label <- expression(HD ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  x_error_label <- expression(ED[95] ~ (N["Col"]))
  y_error_label <- expression(HD ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  x_error_label <- expression(ED[95] ~ (sigma["CS"]))
  y_error_label <- expression(HD ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  x_error_label <- expression(ED[95] ~ (sigma["CT"]))
  y_error_label <- expression(HD ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
ss_vs_hdss_1 <- ggplot2::ggplot(data = whole_df) +  #,ggplot2::aes(color = RRD)
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x = ss1,y = hd_ss1),
                      shape = 16,alpha = 0.8) +
  ggplot2::theme_classic() +
  ggplot2::xlim(0,0.35)+
  ggplot2::ylim(0,0.35)+
  ggplot2::theme(title = ggplot2::element_text(size = 10),
                 text = ggplot2::element_text(size = 10)) +
  ggplot2::ylab(y_error_label) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))+
  ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::geom_vline(xintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::xlab(x_error_label)

ss = 2
if (ss == 1) {
  x_error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  y_error_label <- expression(HD ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  x_error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  y_error_label <- expression(HD ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  x_error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  y_error_label <- expression(HD ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  x_error_label <- expression(ED[95] ~ (N["Spec"]))
  y_error_label <- expression(HD ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  x_error_label <- expression(ED[95] ~ (N["Col"]))
  y_error_label <- expression(HD ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  x_error_label <- expression(ED[95] ~ (sigma["CS"]))
  y_error_label <- expression(HD ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  x_error_label <- expression(ED[95] ~ (sigma["CT"]))
  y_error_label <- expression(HD ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
ss_vs_hdss_2 <- ggplot2::ggplot(data = whole_df) +  #,ggplot2::aes(color = RRD)
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x = ss2,y = hd_ss2),
                      shape = 16,alpha = 0.8) +
  ggplot2::theme_classic() +
  ggplot2::xlim(0,0.35)+
  ggplot2::ylim(0,0.35)+
  ggplot2::theme(title = ggplot2::element_text(size = 10),
                 text = ggplot2::element_text(size = 10)) +
  ggplot2::ylab(y_error_label) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))+
  ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::geom_vline(xintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::xlab(x_error_label)


ss = 3
if (ss == 1) {
  x_error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  y_error_label <- expression(HD ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  x_error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  y_error_label <- expression(HD ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  x_error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  y_error_label <- expression(HD ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  x_error_label <- expression(ED[95] ~ (N["Spec"]))
  y_error_label <- expression(HD ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  x_error_label <- expression(ED[95] ~ (N["Col"]))
  y_error_label <- expression(HD ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  x_error_label <- expression(ED[95] ~ (sigma["CS"]))
  y_error_label <- expression(HD ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  x_error_label <- expression(ED[95] ~ (sigma["CT"]))
  y_error_label <- expression(HD ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
ss_vs_hdss_3 <- ggplot2::ggplot(data = whole_df) +  #,ggplot2::aes(color = RRD)
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x = ss3,y = hd_ss3),
                      shape = 16,alpha = 0.8) +
  ggplot2::theme_classic() +
  ggplot2::xlim(0,0.35)+
  ggplot2::ylim(0,0.35)+
  ggplot2::theme(title = ggplot2::element_text(size = 10),
                 text = ggplot2::element_text(size = 10)) +
  ggplot2::ylab(y_error_label) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))+
  ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::geom_vline(xintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::xlab(x_error_label)


ss = 4
if (ss == 1) {
  x_error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  y_error_label <- expression(HD ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  x_error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  y_error_label <- expression(HD ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  x_error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  y_error_label <- expression(HD ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  x_error_label <- expression(ED[95] ~ (N["Spec"]))
  y_error_label <- expression(HD ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  x_error_label <- expression(ED[95] ~ (N["Col"]))
  y_error_label <- expression(HD ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  x_error_label <- expression(ED[95] ~ (sigma["CS"]))
  y_error_label <- expression(HD ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  x_error_label <- expression(ED[95] ~ (sigma["CT"]))
  y_error_label <- expression(HD ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
ss_vs_hdss_4 <- ggplot2::ggplot(data = whole_df) +  #,ggplot2::aes(color = RRD)
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x = ss4,y = hd_ss4),
                      shape = 16,alpha = 0.8) +
  ggplot2::theme_classic() +
  ggplot2::xlim(0,0.35)+
  ggplot2::ylim(0,0.35)+
  ggplot2::theme(title = ggplot2::element_text(size = 10),
                 text = ggplot2::element_text(size = 10)) +
  ggplot2::ylab(y_error_label) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))+
  ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::geom_vline(xintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::xlab(x_error_label)

ss = 5
if (ss == 1) {
  x_error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  y_error_label <- expression(HD ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  x_error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  y_error_label <- expression(HD ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  x_error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  y_error_label <- expression(HD ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  x_error_label <- expression(ED[95] ~ (N["Spec"]))
  y_error_label <- expression(HD ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  x_error_label <- expression(ED[95] ~ (N["Col"]))
  y_error_label <- expression(HD ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  x_error_label <- expression(ED[95] ~ (sigma["CS"]))
  y_error_label <- expression(HD ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  x_error_label <- expression(ED[95] ~ (sigma["CT"]))
  y_error_label <- expression(HD ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
ss_vs_hdss_5 <- ggplot2::ggplot(data = whole_df) +  #,ggplot2::aes(color = RRD)
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x = ss5,y = hd_ss5),
                      shape = 16,alpha = 0.8) +
  ggplot2::theme_classic() +
  ggplot2::xlim(0,0.35)+
  ggplot2::ylim(0,0.35)+
  ggplot2::theme(title = ggplot2::element_text(size = 10),
                 text = ggplot2::element_text(size = 10)) +
  ggplot2::ylab(y_error_label) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))+
  ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::geom_vline(xintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::xlab(x_error_label)


ss = 6
if (ss == 1) {
  x_error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  y_error_label <- expression(HD ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  x_error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  y_error_label <- expression(HD ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  x_error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  y_error_label <- expression(HD ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  x_error_label <- expression(ED[95] ~ (N["Spec"]))
  y_error_label <- expression(HD ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  x_error_label <- expression(ED[95] ~ (N["Col"]))
  y_error_label <- expression(HD ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  x_error_label <- expression(ED[95] ~ (sigma["CS"]))
  y_error_label <- expression(HD ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  x_error_label <- expression(ED[95] ~ (sigma["CT"]))
  y_error_label <- expression(HD ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
ss_vs_hdss_6 <- ggplot2::ggplot(data = whole_df) +  #,ggplot2::aes(color = RRD)
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x = ss6,y = hd_ss6),
                      shape = 16,alpha = 0.8) +
  ggplot2::theme_classic() +
  ggplot2::xlim(0,0.35)+
  ggplot2::ylim(0,0.35)+
  ggplot2::theme(title = ggplot2::element_text(size = 10),
                 text = ggplot2::element_text(size = 10)) +
  ggplot2::ylab(y_error_label) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))+
  ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::geom_vline(xintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::xlab(x_error_label)


ss = 7
if (ss == 1) {
  x_error_label <- expression(ED[95] ~ (Delta * "SRTT"))
  y_error_label <- expression(HD ~ (Delta * "SRTT"))
  title <- "Species richness through time"
} else if (ss == 2) {
  x_error_label <- expression(ED[95] ~ (Delta * "ESRTT"))
  y_error_label <- expression(HD ~ (Delta * "ESRTT"))
  title <- "Endemic richness through time"
} else if (ss == 3) {
  x_error_label <- expression(ED[95] ~ (Delta * "NESRTT"))
  y_error_label <- expression(HD ~ (Delta * "NESRTT"))
  title <- "Non-endemic richness through time"
} else if (ss == 4) {
  x_error_label <- expression(ED[95] ~ (N["Spec"]))
  y_error_label <- expression(HD ~ (N["Spec"]))
  title <- "Total number of species"
} else if (ss == 5) {
  x_error_label <- expression(ED[95] ~ (N["Col"]))
  y_error_label <- expression(HD ~ (N["Col"]))
  title <- "Number of colonists"
} else if (ss == 6) {
  x_error_label <- expression(ED[95] ~ (sigma["CS"]))
  y_error_label <- expression(HD ~ (sigma["CS"]))
  title <- "Clade size standard deviation"
} else if (ss == 7) {
  x_error_label <- expression(ED[95] ~ (sigma["CT"]))
  y_error_label <- expression(HD ~ (sigma["CT"]))
  title <- "Colonization time standard deviation"
}
ss_vs_hdss_7 <- ggplot2::ggplot(data = whole_df) +  #,ggplot2::aes(color = RRD)
  ggplot2::theme_bw() +
  ggplot2::geom_point(ggplot2::aes(x = ss7,y = hd_ss7),
                      shape = 16,alpha = 0.8) +
  ggplot2::theme_classic() +
  ggplot2::xlim(0,0.35)+
  ggplot2::ylim(0,0.35)+
  ggplot2::theme(title = ggplot2::element_text(size = 10),
                 text = ggplot2::element_text(size = 10)) +
  ggplot2::ylab(y_error_label) +
  ggplot2::ggtitle(title) +
  ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 10,colour = "black")) +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 12,colour = "black")) +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 12, hjust = 0.5))+
  ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
  ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::geom_vline(xintercept = 0.05, linetype = "dashed", size = 0.5) +
  ggplot2::xlab(x_error_label)


library(ggplot2)
library(cowplot)
tiff(paste0("ss_vs_hdss1.tiff"),
     units="px", width=4000, height=2000,res = 300,compression="lzw")
p_hellinger <- ggdraw(plot_grid(plot_grid(ss_vs_hdss_1, ss_vs_hdss_2,ss_vs_hdss_3,
                           ss_vs_hdss_4,ss_vs_hdss_5,ss_vs_hdss_6,
                           ss_vs_hdss_7,nrow = 2,align = "h"),
                 rel_heights=c(1, 1)))
print(p_hellinger)
while (!is.null(dev.list()))  dev.off()
