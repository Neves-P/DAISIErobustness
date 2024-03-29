% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_error_metrics.R
\name{check_calc_error_metrics_input}
\alias{check_calc_error_metrics_input}
\title{Checks calc_error_metrics_input is correct}
\usage{
check_calc_error_metrics_input(
  spec_nltt_error,
  num_spec_error,
  num_col_error,
  endemic_nltt_error,
  nonendemic_nltt_error,
  spec_baseline_nltt_error,
  num_spec_baseline_error,
  num_col_baseline_error,
  endemic_baseline_nltt_error,
  nonendemic_baseline_nltt_error
)
}
\arguments{
\item{spec_nltt_error}{Numeric vector with the nltt error from the novel
simulation and the oceanic DAISIE simulation.}

\item{num_spec_error}{Numeric vector with the difference in the number
of species at the end of the simulation between the novel simulation and
the oceanic DAISIE simulation.}

\item{num_col_error}{Numeric vector with the difference in the number of
colonists at the end of the simulation between the novel simulation and the
 oceanic DAISIE simulation.}

\item{endemic_nltt_error}{Numeric vector with the nltt error of the
endemic species from the novel simulation and the oceanic DAISIE
simulation.}

\item{nonendemic_nltt_error}{Numeric vector with the nltt error of the
non-endemic species from the novel simulation and the oceanic DAISIE
simulation.}

\item{spec_baseline_nltt_error}{Numeric vector with the baseline nltt error
between oceanic DAISIE simulations.}

\item{num_spec_baseline_error}{Numeric vector with the difference in the
number of species at the end of the simulation between the oceanic DAISIE
simulations.}

\item{num_col_baseline_error}{Numeric vector with the difference in the
number of colonists at the end of the simulation between the oceanic DAISIE
simulations.}

\item{endemic_baseline_nltt_error}{Numeric vector with the nltt error of the
endemic species from the oceanic DAISIE simulations.}

\item{nonendemic_baseline_nltt_error}{Numeric vector with the nltt error of
the non-endemic species from the oceanic DAISIE simulations.}
}
\value{
Nothing. Throws error if input is not correct
}
\description{
Checks calc_error_metrics_input is correct
}
\author{
Joshua W. Lambert, Pedro Santos Neves, Shu Xie
}
