\name{calcNumRejects}
\alias{calcNumRejects}
\title{
Calculate number of cases rejected for repeated simulation of Poisson background and
responses grouped into categories.
}
\description{
Calculate number of cases rejected for repeated simulation
of Poisson background and responses grouped into categories.
}
\usage{
calcNumRejects(bkg, resps, numRespsPerCat, numSims, calcPValFnc, sigLevel = 0.05, ...)
}
\arguments{
  \item{bkg}{
Mean firing rate during a background interval, unrelated to stimulus presentation.
}
  \item{resps}{
Mean firing rates during a response period, one for each category.
}
  \item{numRespsPerCat}{
Number of repetitions (presentation of stimuli) in each category.
}
  \item{numSims}{
Number of simulation to run.
}
  \item{calcPValFnc}{
Function to be called with simulation output from \code{\link{simCatResp}} to 
calculate the achieved significance level, or p-value.
}
  \item{sigLevel}{
Significance level to use when determining if test is significant. Default is 0.05.
}
  \item{\dots}{
Other arguments to pass to \code{calcPValFnc}
}
}
\value{
Number of simulations which were detected as significant, out of \code{numSims}
}
\author{
Peter N. Steinmetz <PeterNSteinmetz@steinmetz.org>
}


\seealso{
\code{\link{compPowerRespDetection}}, \code{\link{compPowerGeneralRespDetection}},
\code{\link{simCatResp}}
}
\examples{
  # Calculate number of cases which will be detected as having an effect of 
  # category when there are 4 categories with 2 having different responses and
  # when use a standard F test to detect the category effect.
  pvalFnc<-function(df){anova(glm(resp~category,data=df),test='F')$"Pr(>F)"[2]}
  calcNumRejects(1,c(1,1.5,2,1),6,100,pvalFnc)
}

\keyword{datagen}
