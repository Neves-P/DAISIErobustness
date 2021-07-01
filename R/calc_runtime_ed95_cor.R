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
  spec_nltt_cor <- cor(
    merged_data_frame$stat_diff_spec_nltt,
    merged_data_frame$runtime
  )
  endemic_nltt_cor <- cor(
    merged_data_frame$stat_diff_endemic_nltt,
    merged_data_frame$runtime
  )
  nonendemic_nltt_cor <- cor(
    merged_data_frame$stat_diff_nonendemic_nltt,
    merged_data_frame$runtime
  )
  num_spec_cor <- cor(
    merged_data_frame$stat_diff_num_spec,
    merged_data_frame$runtime
  )
  num_col_cor <- cor(
    merged_data_frame$stat_diff_num_col,
    merged_data_frame$runtime
  )

  out <- data.frame(
    spec_nltt_cor,
    endemic_nltt_cor,
    nonendemic_nltt_cor,
    num_spec_cor,
    num_col_cor
  )
  out
}
