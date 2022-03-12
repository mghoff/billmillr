
<!-- README.md is generated from README.Rmd. Please edit that file -->

# billmillr

**Author:** [Matthew Hoff](https://github.com/mghoff) **License:**
[MIT](https://opensource.org/licenses/MIT)<br/>

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/ropensci/epubr?branch=master&svg=true)](https://ci.appveyor.com/project/leonawicz/epubr)

## The Premise

This package calculates “The Bill Miller Problem” from Leonard
Mlodinow’s “The Drunkard’s Walk: *How Randomness Rules Our Lives*”.

The premise of this story goes that Bill Miller (financier) was an
amazing stock picker after having performed incredibly well - beating
the market over 15 consecutive years. As a result, he was celebrated and
acclaimed by the likes of Forbes and others, who claimed that the
likelihood of his ability to perform this well was 1 in 32,768. Dr.,
Mlodinow ups this likelihood, stating that the probability that any 1
person among 1000 who started “tossing coins” (i.e. picking stocks) was
closer to 3%.

Dr. Mlodinow then further ups the probability, considering the
likelihood that any 1 person over a 40 year period seeing that level of
success - defined as beating the market for 15 years in a row or longer
- is roughly around 3 out of 4, or 75%.

**The resulting likelihood for any one person to beat the market within
a definite start and stop time of at least 15 years in a single 40 year
period, while larger the the 3% of his second calculation, is much
smaller than the final proposed calc of \~75%, coming in at \~33%.**

## The Math

Firstly, one must compute the odds of getting a run (Streak) of at least
k heads out of n coin tosses where p (q = 1-p) is the probability of
obtaining heads (tails) from the toss of a coin.

Mathematically,

-   S\[N, K\] = p^K + sum\_{j=1, K} ( p^(j-1) \* (1-p) \* S\[N-j, K\] )

which needs broken down recursively into the sum of terms

-   S\[n, k\] = p^k + … = sum\_{j=1, k} ( p^(j-1) \* (1-p) \* S\[n-j,
    k\] )for 1 \<= j \<= k

This recursive odds calculation is provided by `oddsOfStreak`.

Secondly, to calculate the likelihood that at least 1 out of X-number of
people will obtain a streak of at least k Heads out of n coin tosses,
one must perform the following:

1.  Calculate the pdf: P(X = x) = choose(n, x) \* (p^x) \* ((1-p)^(n-x))
2.  Calculate the cdf: P(X \<= x) = sum\_{i=0, x} (1) for i \<= x
3.  Calculate P(X > x) = 1 - P(X \<= x); i.e. 1 - (2)

which can be performed by using the `probOfAtLeastK`.

## An Example

Load Package…

``` r
library(billmillr)
```

Calculate the likelihood of a streak of at least 3 Heads out of 10 coin
tosses given that the probability p (q) of heads (tails) is fair, i.e. p
= q = 0.5.

``` r
pS <- oddsOfStreak(numCoins = 10, minHeads = 3, probHeads = 0.5)
pS
#> [1] 0.5449219

# # Example from "The Drunkard's Walk: How Randomness Rules Our Lives"
# tictoc::tic()
# oddsOfStreak(40, 15, 0.5) # p = 0.000411981; NOTE: for the @Risk simulation, we got 0.0002 - i.e. this is within bounds.
# tictoc::toc() # 24713.89 sec elapsed (6.865 hours)
```

Now calculate the probability that at least 1 out of 100 people will
obtain such a streak given that the probability of said streak is
0.5449219.

``` r
probOfAtLeastK(N = 100, K = 1, P = pS)
#> [1] 1

# # Example from "The Drunkard's Walk: How Randomness Rules Our Lives" continued...
# # Result (1): P(X = k) where k = 0
# choose(n, k)*(p**k)*((1-p)**(n-k))
# # P(X = 0) ~= 0.66 => P(X > 0) ~= 1 - 0.66 = 0.33
```
