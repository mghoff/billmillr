% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulations.R
\name{run_simulation}
\alias{run_simulation}
\title{Run Simulation}
\usage{
run_simulation(
  iters,
  trials,
  sample_space,
  sample_probs = NULL,
  sample_size,
  run_value,
  run_length
)
}
\arguments{
\item{iters}{number, number of simulation iterations.}

\item{trials}{number, see \code{count_runs()}.}

\item{sample_space}{vector, see \code{count_runs()}.}

\item{sample_probs}{vector, see \code{count_runs()}.}

\item{sample_size}{number, see \code{count_runs()}.}

\item{run_value}{number, see \code{count_runs()}.}

\item{run_length}{number, see \code{count_runs()}.}
}
\value{
data frame with
\itemize{
\item 4 columns: \code{iterations}, \code{applicable_trials}, \code{prob_of_zero}, & \code{prob_of_ge_one}; and
\item the number of rows to be determined by \code{iters}
}
}
\description{
Iterate over \code{count_runs()}, counting the number of applicable trials where
such a trial is defined as having the occurrence of a streak of at least the
designated length. Additionally, keep a running tally of the cumulative likelihood
of obtaining exactly zero streaks.
}
\details{
This function outputs a data frame with four columns:
1.) the iteration number,
2.) the count of applicable trials in that iteration, and
3.) the cumulative probability of obtaining zero streaks.
4.) the cumulative probability of obtaining at least one streak.
}
\examples{
tail(
 run_simulation(
   iters = 100,
   trials = 8,
   sample_space = c(0, 1),
   sample_size = 5,
   run_value = 1,
   run_length = 3
 )
)
}
