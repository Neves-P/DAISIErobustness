
folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\nonoceanic"
nonoceanic_m_low_low <- calc_stat_diff(folder_path, 1:48)
nonoceanic_m_high_low <- calc_stat_diff(folder_path, 49:96)
nonoceanic_m_low_high <- calc_stat_diff(folder_path, 97:144)
nonoceanic_m_high_high <- calc_stat_diff(folder_path, 145:192)
nonoceanic_k_low_low <- calc_stat_diff(folder_path, 193:240)
nonoceanic_k_high_low <- calc_stat_diff(folder_path, 241:288)
nonoceanic_k_low_high  <- calc_stat_diff(folder_path, 289:336)
nonoceanic_k_high_high <- calc_stat_diff(folder_path, 337:384)
beepr::beep(8)


error_metrics_list_nonoceanic <- list(
  nonoceanic_m_low_low[[5]],
  nonoceanic_k_low_low[[5]],
  nonoceanic_m_low_high[[5]],
  nonoceanic_k_low_high[[5]],
  nonoceanic_m_high_low[[5]],
  nonoceanic_k_high_low[[5]],
  nonoceanic_m_high_high[[5]],
  nonoceanic_k_high_high[[5]]
)

xlabel_vec <- c(expression(atop("Low"~x[s], "Low"~x[nonend])),
                expression(atop("Low"~x[s],"High"~x[nonend])),
                expression(atop("High"~x[s],"Low"~x[nonend])),
                expression(atop("High"~x[s],"High"~x[nonend])))
plot_error_boxes_grouped(
  error_metrics_list = error_metrics_list_nonoceanic,
  error = "num_col",
  error_metrics_names = c(
    "low low",
    "low low",
    "low high",
    "low high",
    "high low",
    "high low",
    "high high",
    "high high"
  ),
  xlabels = xlabel_vec
)

folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\oceanic_ontogeny"
oceanic_ontogeny_m_low_low <- calc_stat_diff(folder_path, 1:48)
oceanic_ontogeny_m_high_low <- calc_stat_diff(folder_path, 49:96)
oceanic_ontogeny_m_low_high <- calc_stat_diff(folder_path, 97:144)
oceanic_ontogeny_m_high_high <- calc_stat_diff(folder_path, 145:192)
oceanic_ontogeny_k_low_low <- calc_stat_diff(folder_path, 193:240)
oceanic_ontogeny_k_high_low <- calc_stat_diff(folder_path, 241:288)
oceanic_ontogeny_k_low_high  <- calc_stat_diff(folder_path, 289:336)
oceanic_ontogeny_k_high_high <- calc_stat_diff(folder_path, 337:384)
beepr::beep(8)

oceanic_ontogeny_input <- list(
  oceanic_ontogeny_m_low_low,
  oceanic_ontogeny_k_low_low,
  oceanic_ontogeny_m_high_low,
  oceanic_ontogeny_k_high_low,
  oceanic_ontogeny_m_low_high,
  oceanic_ontogeny_k_low_high,
  oceanic_ontogeny_m_high_high,
  oceanic_ontogeny_k_high_high
)

error_metrics_list_oceanic_ontogeny <- list(
  oceanic_ontogeny_m_low_low[[1]],
  oceanic_ontogeny_k_low_low[[1]],
  oceanic_ontogeny_m_high_low[[1]],
  oceanic_ontogeny_k_high_low[[1]],
  oceanic_ontogeny_m_low_high[[1]],
  oceanic_ontogeny_k_low_high[[1]],
  oceanic_ontogeny_m_high_high[[1]],
  oceanic_ontogeny_k_high_high[[1]]
)

xlabel_vec <- c(expression(atop("Low"~x, "Low"~d)),
                expression(atop("Low"~x,"High"~d)),
                expression(atop("High"~x,"Low"~d)),
                expression(atop("High"~x,"High"~d)))
plot_error_boxes_grouped(
  error_metrics_list = error_metrics_list_oceanic_ontogeny,
  error = "spec_nltt",
  error_metrics_names = c(
    "low low",
    "low low",
    "low high",
    "low high",
    "high low",
    "high low",
    "high high",
    "high high"
  ),
  xlabels = xlabel_vec
)
