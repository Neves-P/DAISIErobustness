## calculate the tip ratios

get_tip_ratio <- function(output_file){
  tip_ratio <- c()
  novel_sim <- output_file$passed_novel_sims
  for (i in 1:length(novel_sim)) {
    sim <- novel_sim[[i]]
    stt <- sim[[1]][[1]]$stt_two_states
    present_state <- stt[nrow(stt),2:7]
    n1 <- sum(present_state[1:3])
    n2 <- sum(present_state[4:6])
    tip_ratio[i] <- n1/n2
  }
  return(tip_ratio)
}


calc_tip_ratios <- function(folder_path, param_set_range = NULL) {

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

  tip_ratios <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    if (!identical(file_to_load, character())) {
      load(file.path(folder_path, file_to_load))
      tip_ratios[i] <- median(get_tip_ratio(output_file = output))

    } else {
      tip_ratios[i] <- NA
    }
    utils::setTxtProgressBar(pb, i)
  }
  message("\nTime elapsed: ", Sys.time() - start_time)
  return(tip_ratios)
}
