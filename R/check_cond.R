testit::assert("Chosen directory exists", dir.exists(folder_path))

param_space <- load_param_space(param_space_name)

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



param_space_name <- "continental_iw"

folder_path <- file.path(
  "G:\\Discos partilhados\\DAISIE-RUG\\Robustness\\data_neves_lambert_et_al_2022\\results",
  param_space_name
)


calc_ed95_for_plots(
  folder_path = folder_path,
  param_space = load_param_space(param_space_name)
)
