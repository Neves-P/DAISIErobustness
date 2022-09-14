#' Title
#'
#' @param param_space_name
#'
#' @return
#' @export
#'
#' @examples
check_cond <- function(param_space_name) {

  param_space <- load_param_space(param_space_name)
  folder_path <- file.path(
    "G:\\Shared drives\\DAISIE-RUG\\Robustness\\resubmission\\results\\", param_space_name
  )
  testit::assert("Chosen directory exists", dir.exists(folder_path))



  start_time <- Sys.time()
  message("Start time: ", start_time)
  files <- list.files(folder_path)
  data_file_indices <- grep(x = files, pattern = ".rds")
  n_files <- length(data_file_indices)
  testit::assert(
    ".rds files exist",
    n_files > 0
  )

  max_param_range <- nrow(param_space)

  param_set_range <- 1:max_param_range

  message(n_files, " data files found.")
  message("Looking for parameter set ",
          1,
          " to ",
          max_param_range,
          ".")

  pb <- utils::txtProgressBar(
    min = 1,
    max = max_param_range,
    style = 3
  )



  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".rds"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    if (!identical(file_to_load, character())) {
      output <- readRDS(file.path(folder_path, file_to_load))
# get n cols and get N species at present
    }
  }
}
