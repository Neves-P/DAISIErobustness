tidy_data <- function(scenario_res, partition_by) {
  # Compute N per strip and make it into legend
  n_per_strip <- na.omit(scenario_res) %>% dplyr::group_by(key, Island) %>%
    dplyr::tally() %>% dplyr::arrange(Island)
  n_per_strip
}
