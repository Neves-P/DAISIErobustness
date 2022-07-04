#' Calculate correlation between ED95 statistics and runtime
#'
#' @inheritParams default_params_doc
#'
#' @return A data frame with the Pearson correlation coefficient between runtime
#'   and each of the ED95 metrics.
#' @author Pedro Santos Neves
#' @export
calc_runtime_ed95_cor <- function(runtime_params, ed95_param_sets) {
  merged_data_frame <- merge(
    x = runtime_params, ed95_param_sets,
    by = c("param_space_name", "param_set")
  )
  out <- list()

  spec_nltt_cor <- stats::cor(
    merged_data_frame$ed95_spec_nltt,
    merged_data_frame$runtime,
    use = "complete.obs"
  )
  endemic_nltt_cor <- stats::cor(
    merged_data_frame$ed95_endemic_nltt,
    merged_data_frame$runtime,
    use = "complete.obs"
  )
  nonendemic_nltt_cor <- stats::cor(
    merged_data_frame$ed95_nonendemic_nltt,
    merged_data_frame$runtime,
    use = "complete.obs"
  )
  num_spec_cor <- stats::cor(
    merged_data_frame$ed95_num_spec,
    merged_data_frame$runtime,
    use = "complete.obs"
  )
  num_col_cor <- stats::cor(
    merged_data_frame$ed95_num_col,
    merged_data_frame$runtime,
    use = "complete.obs"
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
