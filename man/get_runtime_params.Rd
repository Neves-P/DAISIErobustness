% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_runtime_params.R
\name{get_runtime_params}
\alias{get_runtime_params}
\title{Make runtime data frame}
\usage{
get_runtime_params(logs_folder_path)
}
\arguments{
\item{logs_folder_path}{A string with the path for a directory containing the
Peregrine HPCC log files.}
}
\value{
A data frame with three columns:
\describe{
  \item{\code{param_space_name}}{Atomic character vector with parameter space
    name.}
  \item{\code{param_set}}{Atomic numeric vector with parameter space number.}
  \item{\code{runtime}}{Atomic numeric vector with Peregrine job run time in
  seconds.}
  \item{\code{status}}{character with job status upon conclusion.}
  \item{\code{log_name}}{Character vector with name of corresponding log file
  to facilitate debugging.}
}
}
\description{
Make runtime data frame
}
\examples{
\dontrun{
runtimes_data_frame <- get_runtime_params("logs/")
}
}
\author{
Pedro Santos Neves
}
\keyword{internal}
