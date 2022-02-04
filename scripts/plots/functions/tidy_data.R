tidy_data <- function(scenario_res, grouping_var) {


  # Compute N per strip and make it into legend
  data_no_na <- na.omit(scenario_res)
  n_df <- data_no_na %>% dplyr::group_by(key, Island) %>%
    dplyr::tally() %>% dplyr::arrange(Island)
  return(list(data = data, n_df = n_df))
}
