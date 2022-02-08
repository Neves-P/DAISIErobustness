tidy_data <- function(scenario_res, partition_by) {
  # Compute N per strip and make it into legend
  n_per_strip <- na.omit(scenario_res) |> dplyr::group_by(key, Island) |>
    dplyr::tally() |> dplyr::arrange(Island)
  testit::assert(identical(nrow(na.omit(scenario_res)), sum(n_per_strip$n)))
  n_per_strip
}
