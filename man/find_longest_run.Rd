% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulations.R
\name{find_longest_run}
\alias{find_longest_run}
\title{Calculate the Longest Run}
\usage{
find_longest_run(sample, run_value)
}
\arguments{
\item{sample}{numeric or character vector.}

\item{run_value}{number or character, the value for which to count sequential occurrences.}
}
\value{
number, the longest run (streak) of values
}
\description{
Finds the single longest run (streak) of a specified value
contained within a provided vector
}
\examples{
s <- sample(c(0, 1), size = 10, replace = TRUE)
print(s)

find_longest_run(sample = s, run_value = 1)
}
