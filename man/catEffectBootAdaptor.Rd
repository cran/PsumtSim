\name{catEffectBootAdaptor}
\alias{catEffectBootAdaptor}
\title{
Adaptor for testing category effects in simulations using the boot package and function.
}
\description{
Adaptor for testing category effects in simulations using the boot package and function.
}
\usage{
catEffectBootAdaptor(df, index, testFnc = sumSqCat, useResp = TRUE, ...)
}
\arguments{
  \item{df}{
dataframe structured as that returned by simCatResp, with category, bkg, resp columns.
}
  \item{index}{
index for rearrangement of data as provided by boot function
}
  \item{testFnc}{
function to calculate test statistic based its first argument, using the category
  labels in the second argument, and passed the other arguments (...) given
  to this adaptor function.
}
  \item{useResp}{
true if the statistic should be calculated for the rearranged resp column of 
  the dataframe, otherwise false to use the bkg column.
}
  \item{\dots}{
other arguments to pass to the testFnc
}
}
\value{
value of the test statistic
}
\author{
Peter N. Steinmetz <PeterNSteinmetz@steinmetz.org>
}

\seealso{
  \code{\link{boot}}
}

\examples{
  # Simulate 4 categories of responses and then compute the number of times
  # there would be a significant effect of a change in the categories relative
  # to background using the CBT. This would form a rough estimate of the power
  # of the CBT to detect such changes.
  library(boot)
  library(EffectsRelBaseline)
  simCatResp(1,c(1,1.5,2,1),6)->sim3
  boot(sim3,catEffectBootAdaptor,100,backMean=mean(1,1.5,2,1))->boot3
  sum(boot3$t0>boot3$t)
}

\keyword{Utilities}
