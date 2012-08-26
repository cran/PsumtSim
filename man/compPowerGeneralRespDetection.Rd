\name{compPowerGeneralRespDetection}
\alias{compPowerGeneralRespDetection}

\title{
Compute power to detect differences from background where all categories differ from
background.
}
\description{
Compute power to detect responses differing from background in a simulation of 
responses to a number of categories of stimuli, all of which differ from the 
background level of firing.
}
\usage{
compPowerGeneralRespDetection(bkgLevel, generalRespLevel, respLevel, numCats,
numCatsWithResp, normDistribution = FALSE, showProgress = FALSE, numTrialsPerCat = 15,
numBootIters = 1000, numRuns = 1000, alpha = 0.05)
}

\arguments{
  \item{bkgLevel}{
Background firing rate, prior to stimulus onset.
}
  \item{generalRespLevel}{
Response firing rate applied to categories not having the \code{respLevel} of firing.
}
  \item{respLevel}{
Response firing rate during categories which have a response other than background.
}
  \item{numCats}{
Total number of categories of stimulus.
}
  \item{numCatsWithResp}{
Number of categories to be given \code{respLevel} responses.
}
  \item{normDistribution}{
TRUE if normally distributed response and background counts should be used, otherwise
Poisson distributed counts are used. Default is FALSE.
}
  \item{showProgress}{
TRUE if run count should be printed. Default is FALSE.
}
  \item{numTrialsPerCat}{
Number of trials of responses and backgrounds for each category. Default is 15.
}
  \item{numBootIters}{
Number of boot iterations, passed as 'R' argument to \code{\link{boot}} function.
Default is 1000.
}
  \item{numRuns}{
Number of simulations to perform followed by bootstrap testing. Default is 1000.
}
  \item{alpha}{
Significance level, alpha, to use in counting if simulated results are significant.
Default is 0.05.
}
}

\value{
Number of trials, out of \code{numRuns} which were detected as significant in the 
bootstrap testing.
}

\author{
Peter N. Steinmetz <PeterNSteinmetz@steinmetz.org>
}

\seealso{
\code{\link{compPowerRespDetection}}
}
\examples{
# Simulate responses in 3 of 6 categories and compute how often these responses 
# are detected. Will return a random number generally between 10 and 15, so 
# the estimate of power would be between 20% and 30%.
require(EffectsRelBaseline)
require(boot)
compPowerGeneralRespDetection(1,1,2,6,3,numBootIters=50,numRuns=25)
}

\keyword{datagen}
