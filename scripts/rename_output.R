rename_output <- function(folder) {
  files <- list.files(folder)
  files_to_change <- files[grep(files, pattern = "geosym")]
  file_name_prefix <- paste0("novel_")
  for (i in seq_along(files_to_change)) {
    load(file.path(folder, files_to_change[i]))
    message(paste0("Changing ", files_to_change[i]))
    output <- output_file$geodynamic_sim
    file_name_suffix <- stringr::str_split(
      files[i],
      "_cond_",
      n = Inf,
      simplify = FALSE
    )[[1]][2]
    output_filename <- paste0(file_name_prefix, file_name_suffix)
    save(output, file = file.path(folder, output_filename))
  }
}

