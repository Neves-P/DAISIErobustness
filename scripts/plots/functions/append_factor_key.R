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
  }
  return(out)
}
