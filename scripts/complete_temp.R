folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\nonoceanic"
nonoceanic <- calc_stat_diff(folder_path, 1:384)
folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\nonoceanic_land_bridge"
nonoceanic_land_bridge <- calc_stat_diff(folder_path, 1:512)
folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\oceanic_ontogeny"
oceanic_ontogeny <- calc_stat_diff(folder_path, 1:384)
folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\oceanic_sea_level"
oceanic_sea_level <- calc_stat_diff(folder_path, 1:768)
folder_path <- "G:\\Discos partilhados\\DAISIE-RUG\\Josh_Pedro_paper\\results\\oceanic_ontogeny_sea_level"
oceanic_ontogeny_sea_level <- calc_stat_diff(folder_path, 1:768)


error_metrics_list_scenarios <- list(
  oceanic_ontogeny[[5]],
  oceanic_sea_level[[5]],
  oceanic_ontogeny_sea_level[[5]],
  nonoceanic[[5]],
  nonoceanic_land_bridge[[5]]
)

error_metrics_names <- c("Oceanic ontogeny",
                         "Oceanic sea-level",
                         "Oceanic ontogeny \nsea-level",
                         "Non-oceanic",
                         "Non-oceanic \nland-bridge")

plot_error_boxes(error_metrics_list = error_metrics_list_scenarios, error = "num_col", error_metrics_names = error_metrics_names)
