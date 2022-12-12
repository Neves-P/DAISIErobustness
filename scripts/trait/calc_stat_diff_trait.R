calc_stat_diff_trait <- function(folder_path, param_set_range = NULL) {

  testit::assert("Chosen directory exists", dir.exists(folder_path))

  start_time <- Sys.time()
  message("Start time: ", start_time)
  files <- list.files(folder_path)
  data_file_indices <- grep(x = files, pattern = ".RData")  ### .rds/.RData
  n_files <- length(data_file_indices)
  testit::assert(
    ".rds files exist",
    n_files > 0
  )
  message(n_files, " data files found.")
  message("Looking for parameter set ",
          min(param_set_range),
          " to ",
          max(param_set_range),
          ".")

  pb <- utils::txtProgressBar(
    min = min(param_set_range),
    max = max(param_set_range),
    style = 3
  )

  stat_diff_spec_nltt <- c()
  stat_diff_endemic_nltt <- c()
  stat_diff_nonendemic_nltt <- c()
  stat_diff_num_spec <- c()
  stat_diff_num_col <- c()
  stat_diff_clade_size <- c()
  stat_diff_colon_time <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),  ### .rds/.RData
                         files,
                         value = TRUE,
                         fixed = TRUE)

    if (!identical(file_to_load, character())) {
      # output <- readRDS(file.path(folder_path, file_to_load))   ## load
      load(file.path(folder_path, file_to_load))
      trait_error_spec_nltt <- output$spec_nltt_error
      baseline_error_spec_nltt <- output$spec_baseline_nltt_error

      trait_error_endemic_nltt <- output$endemic_nltt_error
      baseline_error_endemic_nltt <- output$endemic_baseline_nltt_error

      trait_error_nonendemic_nltt <- output$nonendemic_nltt_error
      baseline_error_nonendemic_nltt <- output$nonendemic_baseline_nltt_error

      trait_error_num_spec <- output$num_spec_error
      baseline_error_num_spec <- output$num_spec_baseline_error

      trait_error_num_col <- output$num_col_error
      baseline_error_num_col <- output$num_col_baseline_error

      calc_clade_size <- calc_clade_size_error(output)
      trait_error_clade_size <- calc_clade_size$clade_size_error
      baseline_error_clade_size <- calc_clade_size$clade_size_baseline_error

      calc_colon_time <- calc_colon_time_error(output)
      trait_error_colon_time <- calc_colon_time$colon_time_error
      baseline_error_colon_time <- calc_colon_time$colon_time_baseline_error

      boundary_spec_nltt <- stats::quantile(baseline_error_spec_nltt, 0.95)
      boundary_endemic_nltt <- stats::quantile(baseline_error_endemic_nltt, 0.95)
      boundary_nonendemic_nltt <- stats::quantile(baseline_error_nonendemic_nltt, 0.95)
      boundary_num_spec <- stats::quantile(baseline_error_num_spec, 0.95)
      boundary_num_col <- stats::quantile(baseline_error_num_col, 0.95)
      boundary_clade_size <- stats::quantile(baseline_error_clade_size, 0.95)
      boundary_colon_time <- stats::quantile(baseline_error_colon_time, 0.95)

      stat_diff_spec_nltt[i] <- (sum(trait_error_spec_nltt > boundary_spec_nltt) + 1) /
        (length(baseline_error_spec_nltt) + 1)
      stat_diff_endemic_nltt[i] <- (sum(trait_error_endemic_nltt > boundary_endemic_nltt) + 1) /
        (length(baseline_error_endemic_nltt) + 1)
      stat_diff_nonendemic_nltt[i] <- (sum(trait_error_nonendemic_nltt > boundary_nonendemic_nltt) + 1) /
        (length(baseline_error_nonendemic_nltt) + 1)
      stat_diff_num_spec[i] <- (sum(trait_error_num_spec > boundary_num_spec) + 1) /
        (length(baseline_error_num_spec) + 1)
      stat_diff_num_col[i] <- (sum(trait_error_num_col > boundary_num_col) + 1) /
        (length(baseline_error_num_col) + 1)
      stat_diff_clade_size[i] <- (sum(trait_error_clade_size > boundary_clade_size) + 1) /
        (length(baseline_error_clade_size) + 1)
      stat_diff_colon_time[i] <- (sum(trait_error_colon_time > boundary_colon_time) + 1) /
        (length(baseline_error_colon_time) + 1)
    }
    else {
      stat_diff_spec_nltt[i] <- NA
      stat_diff_endemic_nltt[i] <- NA
      stat_diff_nonendemic_nltt[i] <- NA
      stat_diff_num_spec[i] <- NA
      stat_diff_num_col[i] <- NA
      stat_diff_clade_size[i] <- NA
      stat_diff_colon_time[i] <- NA
    }
    utils::setTxtProgressBar(pb, i)
  }

  message("\nTime elapsed: ", Sys.time() - start_time)
  return(list(
    stat_diff_spec_nltt = stat_diff_spec_nltt,
    stat_diff_endemic_nltt = stat_diff_endemic_nltt,
    stat_diff_nonendemic_nltt = stat_diff_nonendemic_nltt,
    stat_diff_num_spec = stat_diff_num_spec,
    stat_diff_num_col = stat_diff_num_col,
    stat_diff_clade_size = stat_diff_clade_size,
    stat_diff_colon_time = stat_diff_colon_time
  ))
}

