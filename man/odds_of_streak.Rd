% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analytics.R
\name{odds_of_streak}
\alias{odds_of_streak}
\title{Calculate the Odds of a Streak}
\usage{
odds_of_streak(num_coins, min_heads, prob_heads, .saved = NULL)
}
\arguments{
\item{num_coins}{integer, total number of coin flips}

\item{min_heads}{integer, minimum number of heads to to obtained in a single streak}

\item{prob_heads}{number, probability of obtaining a heads on a single coin toss}

\item{.saved}{data frame, contains previously computed probabilities for a given index;
used to speed up recursion so not to recalculate every probability should an already seen
scenario of num_coins, min_heads, and prob_heads arises.}
}
\value{
numeric, odds of streak
}
\description{
Calculate the odds of a single streak of at least k heads out of n coin tosses given
the probability of heads (tails) is p (q = 1-p).
}
\examples{
odds_of_streak(num_coins = 5, min_heads = 3, prob_heads = 0.5)
}
