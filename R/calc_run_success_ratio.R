#' Calculate success rate of \code{\link{run_robustness}()} HPCC runs
#'
#' @inheritParams default_params_doc
#'
#' @return A data frame containing 4 columns and as many rows as the parameter
#'   spaces found on the log files. Columns are as follows:
#'   \itemize{
#'     \item{\code{"param_space"}: }{string with the name of the parameter
#'     spaces}
#'     \item{\code{"success_rate"}: }{A numeric between 0 and 1 with the ratio
#'     of successful runs of each parameter space}
#'     \item{\code{"failed_rate"}: }{A numeric between 0 and 1 with the ratio
#'     of failed runs of each parameter space}
#'     \item{\code{"timeout_rate"}: }{A numeric between 0 and 1 with the ratio
#'     of timed out runs of each parameter space}
#'  }
#' @export
#'
#' @author Pedro Neves
calc_run_success_ratio <- function(logs_folder_path) {
  runtime_params <- get_runtime_params(logs_folder_path = logs_folder_path)

  param_space_names <- unique(runtime_params$param_space_name)
  param_space_names <- param_space_names[
    !grepl("corrupted_", param_space_names)
  ]
  status <- unique(runtime_params$status)
  status

  resultless_list <- list()
  failed_list <- list()
  timeout_list <- list()
  success_ratio <- data.frame(
    "param_space" = character(),
    "success_rate" = numeric(),
    "failed_rate" = numeric(),
    "timeout_rate" = numeric()
  )
  for (i in seq_along(param_space_names)) {
    space_length <- nrow(load_param_space(param_space_names[i]))

    resultless_list[[i]] <- dplyr::filter(
      runtime_params,
      param_space_name == param_space_names[i],
      status != "COMPLETED" & status != "RUNNING"
    )
    failed_list[[i]] <- dplyr::filter(
      runtime_params,
      param_space_name == param_space_names[i],
      status == "FAILED"
    )
    timeout_list[[i]] <- dplyr::filter(
      runtime_params,
      param_space_name == param_space_names[i],
      status != "COMPLETED" & status != "RUNNING" & status != "FAILED"
    )
    success_ratio[i, 1] <- param_space_names[i]
    success_ratio[i, 2] <- (space_length - nrow(resultless_list[[i]])) /
      space_length
    success_ratio[i, 3] <- nrow(failed_list[[i]]) / space_length
    success_ratio[i, 4] <- nrow(timeout_list[[i]]) / space_length
  }
  return(success_ratio)
}
