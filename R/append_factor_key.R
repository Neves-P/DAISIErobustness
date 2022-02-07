#' Create key to partition results by scenario
#'
#' @inheritParams default_params_doc
#'
#' @return A data frame which is identical to each scenarios' parameter spaces
#'   as as read by \code{\link{load_param_space}()}. In addition to the columns
#'   in the parameter spaces, 5 columns are appended with the ed95 statistic
#'   obtained for each set parameter set:
#' \itemize{
#'   \item{\code{$ed95_spec_nltt}}
#'   \item{\code{$ed95_endemic_nltt}}
#'   \item{\code{$ed95_nonendemic_nltt}}
#'   \item{\code{$ed95_num_spec}}
#'   \item{\code{$ed95_num_col}}
#' }
#' @keywords internal
append_factor_key <- function(scenario_res, partition_by) {
  if (identical(partition_by, "hyperparameters")) {
    x <- scenario_res$x
    d <- scenario_res$d

    testit::assert(length(unique(x)) == 2 && length(unique(d)) == 2)

    x_fac <- factor(x, labels = c("l", "h"))
    d_fac <- factor(d, labels = c("l", "h"))
    key <- factor(
      paste0(x_fac, d_fac),
      ordered = FALSE,
      levels = unique(paste0(x_fac, d_fac))
    )
    testit::assert(
      "Key order is kept",
      all(as.character(key) == paste0(x_fac, d_fac))
    )
    out <- cbind(scenario_res, key)
  } else if (identical(partition_by, "gradient")) {
    key <- factor(scenario_res$island_gradient_angle)

    testit::assert(
      "Key order is kept",
      all(key == scenario_res$island_gradient_angle)
    )
    out <- cbind(scenario_res, key)
  } else if (identical(partition_by, "sample_parameters")) {
    # TODO: Condense with x and d case in ontogeny?
    x_s <- scenario_res$x_s
    x_nonend <- scenario_res$x_nonend

    testit::assert(length(unique(x_s)) == 2 && length(unique(x_nonend)) == 2)

    x_s_fac <- factor(x_s, labels = c("l", "h"))
    x_nonend_fac <- factor(x_nonend, labels = c("l", "h"))
    key <- factor(
      paste0(x_s_fac, x_nonend_fac),
      ordered = FALSE,
      levels = unique(paste0(x_s_fac, x_nonend_fac))
    )
    testit::assert(
      "Key order is kept",
      all(as.character(key) == paste0(x_s_fac, x_nonend_fac))
    )
    out <- cbind(scenario_res, key)
  } else if (identical(partition_by, "land_bridge_multiplier")) {
      key <- factor(scenario_res$gam_2 / scenario_res$gam_1)
    out <- cbind(scenario_res, key)
  }
  return(out)
}
