## calculate the clade size SD of TraiSIE sim

source("scripts/trait/calc_cssd_ctsd.R")
calc_novel_cs_sd_mean <- function(folder_path, param_set_range = NULL) {

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

  novel_cs_sd <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    if (!identical(file_to_load, character())) {
      load(file.path(folder_path, file_to_load))
      novel_sim <- output$passed_novel_sims
      novel_cs_sd[i] <- median(clade_size_sd(novel_sim)/clade_size_mean(novel_sim))

    } else {
      novel_cs_sd[i] <- NA
    }
    utils::setTxtProgressBar(pb, i)
  }
  message("\nTime elapsed: ", Sys.time() - start_time)
  return(novel_cs_sd)
}


calc_novel_cs_sd <- function(folder_path, param_set_range = NULL) {

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

  novel_cs_sd <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    if (!identical(file_to_load, character())) {
      load(file.path(folder_path, file_to_load))
      novel_sim <- output$passed_novel_sims
      novel_cs_sd[i] <- median(clade_size_sd(novel_sim))

    } else {
      novel_cs_sd[i] <- NA
    }
    utils::setTxtProgressBar(pb, i)
  }
  message("\nTime elapsed: ", Sys.time() - start_time)
  return(novel_cs_sd)
}


calc_novel_cs_sd_numclade <- function(folder_path, param_set_range = NULL) {

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

  novel_cs_sd <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    if (!identical(file_to_load, character())) {
      load(file.path(folder_path, file_to_load))
      novel_sim <- output$passed_novel_sims
      novel_cs_sd[i] <- median(clade_size_sd(novel_sim)/sqrt(num_clade(novel_sim)))

    } else {
      novel_cs_sd[i] <- NA
    }
    utils::setTxtProgressBar(pb, i)
  }
  message("\nTime elapsed: ", Sys.time() - start_time)
  return(novel_cs_sd)
}
