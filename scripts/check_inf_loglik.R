check_inf_loglik <- function(folder_path) {

  testit::assert("Chosen directory exists", dir.exists(folder_path))

  start_time <- Sys.time()
  message("Start time: ", start_time)
  files <- list.files(folder_path)
  data_file_indices <- grep(x = files, pattern = ".RData")
  n_files <- length(data_file_indices)
  testit::assert(
    ".RData files exist",
    n_files > 0
  )
  message(n_files, " data files found.")

  pb <- utils::txtProgressBar(min = 0, max = n_files, style = 3)
  infinite_index_output <- list()
  for (i in data_file_indices) {
    load(file.path(folder_path, files[i]))
    infinite_index <- c()
    # For every replicate of each param space
    for (j in seq_along(output[["passed_novel_mls"]])) {
      infinite_index[j] <- is.infinite(unlist(output[["passed_novel_mls"]][[j]][6]))
      if (is.infinite(unlist(output[["passed_novel_mls"]][[j]][6]))) {
        message("Replicate ", j, " of param set ", i, " has Inf loglik.\n")
      }
    }
    infinite_index_output[[i]] <- infinite_index
    utils::setTxtProgressBar(pb, i)
  }
  message("\nTime elapsed: ", Sys.time() - start_time)
  return(infinite_index_output)
}
