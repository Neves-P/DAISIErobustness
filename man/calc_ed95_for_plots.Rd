% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_ed95_for_plots.R
\name{calc_ed95_for_plots}
\alias{calc_ed95_for_plots}
\title{Calculate ED95 statistic for all parameter sets of a parameter space}
\usage{
calc_ed95_for_plots(folder_path, param_set_range = NULL)
}
\arguments{
\item{folder_path}{A file path (use \code{file.path()} for formatting
convenience) where all the parameter sets results of a given parameter
space are stored in .RData format.}

\item{param_set_range}{Defaults to \code{NULL}, which computes the ED95
statistic for all parameter sets in the file of the parameter space located
in \code{folder_path}. Otherwise, a numeric vector of length 2, where the
first element must be lower than the second. This specifies the range of
parameter sets to load compute ED95 for, i.e \code{c(1, 20)} will attempt
to compute and load parameter sets 1 to 20. If there are gaps in this
range, the function works regardless, and will return ED95 for the
parameter set results within the 1 to 20 range.}
}
\value{
A list with numeric vectors of ED95 statistic for:
\itemize{
  \item{\code{$ed95_spec_nltt}}
  \item{\code{$ed95_endemic_nltt}}
  \item{\code{$ed95_nonendemic_nltt}}
  \item{\code{$ed95_num_spec}}
  \item{\code{$ed95_num_col}}
}
}
\description{
This function will load the results of each parameter set from a given
parameter space and compute all associated ED95 statistics. All parameter
sets of the parameter space must be in the same folder, located in
\code{folder_path}. The return type is appropriate for the main plot
functions.
}
\author{
Pedro Neves, Joshua W. Lambert
}
