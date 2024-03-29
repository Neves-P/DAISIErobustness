% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/input-output.R
\name{save_output}
\alias{save_output}
\title{Save \code{run_robustness()} output}
\usage{
save_output(output, param_space_name, param_set)
}
\arguments{
\item{output}{List. Contains all the pipeline output that was able to
run up to a given point. Will be saved into .rds file by
\code{\link{save_output}()} if the \code{\link{run_robustness}()} argument
\code{save_output} is \code{TRUE}.}

\item{param_space_name}{A string with the parameter space to run. See
\code{\link{is_param_space_name}()} for options.}

\item{param_set}{A numeric with the line corresponding to parameter set to
run, as found in the file named in \code{param_space}.}
}
\value{
.rds file named by \code{\link{create_output_file_name}()} in
default location. See details for more information on filesystem. This
}
\description{
Save \code{run_robustness()} output
}
\details{
Files are saved to a subdirectory named after
  \code{param_space_name} within the current directory. The \code{/results/}
  directory and subfolders are created if they don't exist. The status of
  saving is printed as a message if successful, a warning if unsuccessful.
}
\seealso{
Other I/O: 
\code{\link{check_create_folders}()},
\code{\link{create_output_file_name}()}
}
\author{
Joshua W. Lambert, Pedro Santos Neves, Shu Xie
}
\concept{I/O}
