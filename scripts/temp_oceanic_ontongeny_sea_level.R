
folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\oceanic_ontogeny_sea_level"
ontogeny_sea_level_m_l_l_lg <- calc_stat_diff(folder_path, 1:48)
ontogeny_sea_level_m_h_l_lg <- calc_stat_diff(folder_path, 49:96)
ontogeny_sea_level_m_l_h_lg <- calc_stat_diff(folder_path, 97:144)
ontogeny_sea_level_m_h_h_lg <- calc_stat_diff(folder_path, 145:192)
ontogeny_sea_level_m_l_l_hg <- calc_stat_diff(folder_path, 193:240)
ontogeny_sea_level_m_h_l_hg <- calc_stat_diff(folder_path, 241:288)
ontogeny_sea_level_m_l_h_hg <- calc_stat_diff(folder_path, 289:336)
ontogeny_sea_level_m_h_h_hg <- calc_stat_diff(folder_path, 337:384)
ontogeny_sea_level_k_l_l_lg <- calc_stat_diff(folder_path, 385:432)
ontogeny_sea_level_k_h_l_lg <- calc_stat_diff(folder_path, 433:480)
ontogeny_sea_level_k_l_h_lg <- calc_stat_diff(folder_path, 481:528)
ontogeny_sea_level_k_h_h_lg <- calc_stat_diff(folder_path, 529:576)
ontogeny_sea_level_k_l_l_hg <- calc_stat_diff(folder_path, 577:624)
ontogeny_sea_level_k_h_l_hg <- calc_stat_diff(folder_path, 625:672)
ontogeny_sea_level_k_l_h_hg <- calc_stat_diff(folder_path, 673:720)
ontogeny_sea_level_k_h_h_hg <- calc_stat_diff(folder_path, 721:768)
beepr::beep(8)


error_metrics_list_ontogeny_sea_level <- list(
  c(ontogeny_sea_level_m_l_l_lg[[i]], ontogeny_sea_level_m_l_l_hg[[i]]),
  c(ontogeny_sea_level_m_h_l_lg[[i]], ontogeny_sea_level_m_h_l_hg[[i]]),
  c(ontogeny_sea_level_m_l_h_lg[[i]], ontogeny_sea_level_m_l_h_hg[[i]]),
  c(ontogeny_sea_level_m_h_h_lg[[i]], ontogeny_sea_level_m_h_h_hg[[i]]),
  c(ontogeny_sea_level_k_l_l_lg[[i]], ontogeny_sea_level_k_l_l_hg[[i]]),
  c(ontogeny_sea_level_k_h_l_lg[[i]], ontogeny_sea_level_k_h_l_hg[[i]]),
  c(ontogeny_sea_level_k_l_h_lg[[i]], ontogeny_sea_level_k_l_h_hg[[i]]),
  c(ontogeny_sea_level_k_h_h_lg[[i]], ontogeny_sea_level_k_h_h_hg[[i]])
)

xlabel_vec <- c(expression(atop("Low"~x, "Low"~d)),
                expression(atop("Low"~x,"High"~d)),
                expression(atop("High"~x,"Low"~d)),
                expression(atop("High"~x,"High"~d)))
plot_error_boxes_grouped(
  error_metrics_list = error_metrics_list_ontogeny_sea_level,
  error = "num_col",
  error_metrics_names = c(
    "l_l",
    "h_l",
    "l_h",
    "h_h",
    "l_l",
    "h_l",
    "l_h",
    "h_h"
  ),
  xlabels = xlabel_vec
)


## gradient

error_metrics_list_ontogeny_sea_level_gradient <- list(
  c(ontogeny_sea_level_m_l_l_lg[[i]],
    ontogeny_sea_level_m_h_l_lg[[i]],
    ontogeny_sea_level_m_l_h_lg[[i]],
    ontogeny_sea_level_m_h_h_lg[[i]]),
  c(ontogeny_sea_level_m_l_l_hg[[i]],
    ontogeny_sea_level_m_h_l_hg[[i]],
    ontogeny_sea_level_m_l_h_hg[[i]],
    ontogeny_sea_level_m_h_h_hg[[i]]),
  c(ontogeny_sea_level_k_l_l_lg[[i]],
    ontogeny_sea_level_k_h_l_lg[[i]],
    ontogeny_sea_level_k_l_h_lg[[i]],
    ontogeny_sea_level_k_h_h_lg[[i]]),
  c(ontogeny_sea_level_k_l_l_hg[[i]],
    ontogeny_sea_level_k_h_l_hg[[i]],
    ontogeny_sea_level_k_l_h_hg[[i]],
    ontogeny_sea_level_k_h_h_hg[[i]])
)


xlabel_vec <- c("Low gradient", "High gradient", "Low gradient", "High gradient")
plot_error_boxes_grouped(
  error_metrics_list = error_metrics_list_ontogeny_sea_level_gradient,
  error = "num_col",
  error_metrics_names = c(
    "lg",
    "hg",
    "lg",
    "hg"
  ),
  xlabels = xlabel_vec
)

