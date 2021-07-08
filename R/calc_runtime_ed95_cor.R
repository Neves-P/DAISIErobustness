#' Calculate correlation between ED95 statistics and runtime
#'
#' @inheritParams default_params_doc
#'
#' @return A data frame with the Pearson correaltion coefficient between runtime
#'   and each of the ED95 metrics.
#' @author Pedro Neves
#' @export
calc_runtime_ed95_cor <- function(runtime_params, ed95_param_sets) {
  merged_data_frame <- merge(
    x = runtime_params, ed95_param_sets,
    by = c("param_space_name", "param_set")
  )
  param_space_names <- c("oceanic_ontogeny",
                         "oceanic_sea_level",
                         "oceanic_ontogeny_sea_level",
                         "nonoceanic",
                         "nonoceanic_land_bridge")
  out <- list()
  for (i in seq_along(param_space_names)) {

    param_space_data_frame <- subset(
      merged_data_frame,
      merged_data_frame$param_space_name == param_space_names[i]
    )
    # plot

    spec_nltt_cor <- stats::cor(
      param_space_data_frame$stat_diff_spec_nltt,
      param_space_data_frame$runtime
    )
    endemic_nltt_cor <- stats::cor(
      param_space_data_frame$stat_diff_endemic_nltt,
      param_space_data_frame$runtime
    )
    nonendemic_nltt_cor <- stats::cor(
      param_space_data_frame$stat_diff_nonendemic_nltt,
      param_space_data_frame$runtime
    )
    num_spec_cor <- stats::cor(
      param_space_data_frame$stat_diff_num_spec,
      param_space_data_frame$runtime
    )
    num_col_cor <- stats::cor(
      param_space_data_frame$stat_diff_num_col,
      param_space_data_frame$runtime
    )

    out[[i]] <- data.frame(
      spec_nltt_cor,
      endemic_nltt_cor,
      nonendemic_nltt_cor,
      num_spec_cor,
      num_col_cor
    )

  }
  names(out) <- param_space_names
  out
}
