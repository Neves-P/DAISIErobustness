# install.packages("statip")
library(statip)
calc_hellinger_dist_trait <- function(folder_path, param_set_range = NULL) {

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

  hellinger_dist_spec_nltt <- c()
  hellinger_dist_endemic_nltt <- c()
  hellinger_dist_nonendemic_nltt <- c()
  hellinger_dist_num_spec <- c()
  hellinger_dist_num_col <- c()
  hellinger_dist_clade_size <- c()
  hellinger_dist_colon_time <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),  ### .rds
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

      hellinger_dist_spec_nltt[i] <- tryCatch(hellinger(trait_error_spec_nltt,baseline_error_spec_nltt,
                                               -Inf, Inf,method = 1),error=function(err) NA)
      hellinger_dist_endemic_nltt[i] <- tryCatch(hellinger(trait_error_endemic_nltt, baseline_error_endemic_nltt,
                                                  -Inf, Inf,method = 1),error=function(err) NA)
      hellinger_dist_nonendemic_nltt[i] <-tryCatch(hellinger(trait_error_nonendemic_nltt, baseline_error_nonendemic_nltt,
                                                    -Inf, Inf,method = 1),error=function(err) NA)
      hellinger_dist_num_spec[i] <- tryCatch(hellinger(trait_error_num_spec, baseline_error_num_spec,
                                              -Inf, Inf,method = 1),error=function(err) NA)
      hellinger_dist_num_col[i] <-tryCatch(hellinger(trait_error_num_col, baseline_error_num_col,
                                            -Inf, Inf,method = 1),error=function(err) NA)
      hellinger_dist_clade_size[i] <- tryCatch(hellinger(trait_error_clade_size,baseline_error_clade_size,
                                                -Inf, Inf,method = 1),error=function(err) NA)
      hellinger_dist_colon_time[i] <- tryCatch(hellinger(trait_error_colon_time, baseline_error_colon_time,
                                                -Inf, Inf,method = 1),error=function(err) NA)
    }
    else {
      hellinger_dist_spec_nltt[i] <- NA
      hellinger_dist_endemic_nltt[i] <- NA
      hellinger_dist_nonendemic_nltt[i] <- NA
      hellinger_dist_num_spec[i] <- NA
      hellinger_dist_num_col[i] <- NA
      hellinger_dist_clade_size[i] <- NA
      hellinger_dist_colon_time[i] <- NA
    }
    utils::setTxtProgressBar(pb, i)
  }
  message("\nTime elapsed: ", Sys.time() - start_time)
  return(list(
    hellinger_dist_spec_nltt = hellinger_dist_spec_nltt,
    hellinger_dist_endemic_nltt = hellinger_dist_endemic_nltt,
    hellinger_dist_nonendemic_nltt = hellinger_dist_nonendemic_nltt,
    hellinger_dist_num_spec = hellinger_dist_num_spec,
    hellinger_dist_num_col = hellinger_dist_num_col,
    hellinger_dist_clade_size = hellinger_dist_clade_size,
    hellinger_dist_colon_time = hellinger_dist_colon_time
  ))
}



