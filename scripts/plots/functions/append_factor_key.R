append_factor_key <- function(scenario_res, partition_by) {
  if (partition_by == "hyperparameters") {
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
  } else if (partition_by == "gradient") {
    key <- factor(scenario_res$island_gradient_angle)

    testit::assert(
      "Key order is kept",
      all(key == scenario_res$island_gradient_angle)
    )
    out <- cbind(scenario_res, key)
  }
  return(out)
}
