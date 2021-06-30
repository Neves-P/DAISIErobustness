#' Calculate job elapsed time from log file
#'
#' Obtains the elapsed job time in seconds from a standard Peregrine HPCC log
#' file
#'
#' @inheritParams default_params_doc
#'
#' @return An atomic numeric vector with the elapsed run time of the associated
#'   job.
#' @author Pedro Neves
#' @export
#'
#' @examples
#' \dontrun{
#' runtime <- calc_runtime_log(log_file_path = "logs/robustness-20596511.log")
#' }
calc_runtime_log <- function(log_file_path) {
  log_lines <- readLines(con = log_file_path, n = 2000)
  starttime_line_bools <- grepl("Start               : ", log_lines)
  starttime_line <- log_lines[starttime_line_bools]
  testit::assert(length(starttime_line) == 1 && is.character(starttime_line))
  starttime_string <- sub(".*: ", replacement = "", x = starttime_line)
  starttime <- strptime(
    starttime_string,
    format = "%Y-%m-%dT%H:%M:%OS",
    tz = "Europe/Amsterdam"
  )

  endtime_line_bools <- grepl("End                 : ", log_lines)
  endtime_line <- log_lines[endtime_line_bools]
  testit::assert(length(endtime_line) == 1 && is.character(endtime_line))
  endtime_string <- sub(".*: ", replacement = "", x = endtime_line)
  endtime <- strptime(
    endtime_string,
    format = "%Y-%m-%dT%H:%M:%OS",
    tz = "Europe/Amsterdam"
  )

  elapsed_seconds <- as.numeric(difftime(
    time1 = endtime,
    time2 = starttime,
    units = "secs"
  ))
  testit::assert(is.numeric(elapsed_seconds) && (length(elapsed_seconds == 1)))
  elapsed_seconds
}
