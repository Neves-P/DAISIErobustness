
folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\nonoceanic_land_bridge"
nonoceanic_m_1_1 <- calc_stat_diff(folder_path, 1:64)
nonoceanic_m_2_1 <- calc_stat_diff(folder_path, 65:128)
nonoceanic_m_1_2 <- calc_stat_diff(folder_path, 129:192)
nonoceanic_m_2_2 <- calc_stat_diff(folder_path, 193:256)
nonoceanic_k_1_1 <- calc_stat_diff(folder_path, 257:320)
nonoceanic_k_2_1 <- calc_stat_diff(folder_path, 321:384)
nonoceanic_k_1_2 <- calc_stat_diff(folder_path, 385:448)
nonoceanic_k_2_2 <- calc_stat_diff(folder_path, 449:512)
beepr::beep(8)




error_metrics_list_nonoceanic <- list(
  nonoceanic_m_1_1[[5]],
  nonoceanic_m_2_1[[5]],
  nonoceanic_m_1_2[[5]],
  nonoceanic_m_2_2[[5]],
  nonoceanic_k_1_1[[5]],
  nonoceanic_k_2_1[[5]],
  nonoceanic_k_1_2[[5]],
  nonoceanic_k_2_2[[5]]
)

xlabel_vec <- c("1", "2", "1", "2")
plot_error_boxes_grouped(
  error_metrics_list = error_metrics_list_nonoceanic,
  error = "num_col",
  error_metrics_names = c(
    "m_1",
    "m_2",
    "m_1",
    "m_2",
    "k_1",
    "k_2",
    "k_1",
    "k_2"
  ),
  xlabels = xlabel_vec
)


## Short and long division


folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\nonoceanic_land_bridge"
nonoceanic_m_1_1_s <- calc_stat_diff(folder_path, 1:32)
nonoceanic_m_1_1_l <- calc_stat_diff(folder_path, 33:64)
nonoceanic_m_2_1_s <- calc_stat_diff(folder_path, 65:96)
nonoceanic_m_2_1_l <- calc_stat_diff(folder_path, 97:128)
nonoceanic_m_1_2_s <- calc_stat_diff(folder_path, 129:160)
nonoceanic_m_1_2_l <- calc_stat_diff(folder_path, 161:192)
nonoceanic_m_2_2_s <- calc_stat_diff(folder_path, 193:224)
nonoceanic_m_2_2_l <- calc_stat_diff(folder_path, 225:256)
nonoceanic_k_1_1_s <- calc_stat_diff(folder_path, 257:288)
nonoceanic_k_1_1_l <- calc_stat_diff(folder_path, 289:320)
nonoceanic_k_2_1_s <- calc_stat_diff(folder_path, 321:354)
nonoceanic_k_2_1_l <- calc_stat_diff(folder_path, 355:384)
nonoceanic_k_1_2_s <- calc_stat_diff(folder_path, 385:416)
nonoceanic_k_1_2_l <- calc_stat_diff(folder_path, 417:448)
nonoceanic_k_2_2_s <- calc_stat_diff(folder_path, 449:480)
nonoceanic_k_2_2_l <- calc_stat_diff(folder_path, 481:512)
beepr::beep(8)

nonoc_m_1_s <- c(nonoceanic_m_1_1_s[[4]], nonoceanic_m_1_2_s[[4]])
nonoc_m_2_s <- c(nonoceanic_m_2_1_s[[4]], nonoceanic_m_2_2_s[[4]])
nonoc_m_1_l <- c(nonoceanic_m_1_1_l[[4]], nonoceanic_m_1_2_l[[4]])
nonoc_m_2_l <- c(nonoceanic_m_2_1_l[[4]], nonoceanic_m_2_2_l[[4]])
nonoc_k_1_s <- c(nonoceanic_k_1_1_s[[4]], nonoceanic_k_1_2_s[[4]])
nonoc_k_2_s <- c(nonoceanic_k_2_1_s[[4]], nonoceanic_k_2_2_s[[4]])
nonoc_k_1_l <- c(nonoceanic_k_1_1_l[[4]], nonoceanic_k_1_2_l[[4]])
nonoc_k_2_l <- c(nonoceanic_k_2_1_l[[4]], nonoceanic_k_2_2_l[[4]])


error_metrics_list_nonoceanic_sep <- list(
  nonoc_m_1_s,
  nonoc_m_2_s,
  nonoc_m_1_l,
  nonoc_m_2_l,
  nonoc_k_1_s,
  nonoc_k_2_s,
  nonoc_k_1_l,
  nonoc_k_2_l
)

xlabel_vec <- c("1 long", "1 short", "2 long", "2 short")
plot_error_boxes_grouped(
  error_metrics_list = error_metrics_list_nonoceanic_sep,
  error = "num_col",
  error_metrics_names = c(
    "1_s",
    "2_s",
    "1_l",
    "2_l",
    "1_s",
    "2_s",
    "1_l",
    "2_l"
  ),
  xlabels = xlabel_vec
)

