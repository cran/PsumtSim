\name{compExclusionFraction}
\alias{compExclusionFraction}
\title{
Compute fraction of cells with category selective response which are excluded by
pre-testing.
}
\description{
Computes fraction of simulated cells, with Poisson responses to background and varying 
rates to different categories, which will have an effect of category but be excluded by 
pre-testing.
}
\usage{
compExclusionFraction(bkg, resps, numTrialsPerCat, pretestP, anovaP, showProgress = FALSE,
numCells = 1000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{bkg}{
Mean firing rate during a background interval, unrelated to stimulus presentation.
}
  \item{resps}{
Mean firing rates during a response period, one for each category.
}
  \item{numTrialsPerCat}{
Number of repetitions (presentation of stimuli) in each category.
}
  \item{pretestP}{
Significance level applied in pre-tests for effect of each category.
}
  \item{anovaP}{
Significance level applied in ANOVA for effect of category.
}
  \item{showProgress}{
TRUE if should list cell number as calculating. Default is FALSE.
}
  \item{numCells}{
Number of cells to simulate. Default is 1000.
}
}
\value{
\item{exclusionFrac}{Fraction of cells which were not rejected by the first t-test;
thus fraction of those ignored for the second test.}
\item{catSelectiveFrac}{Fraction of all cells determined to have an effect of category on
responses.}
\item{catSelExclFrac}{Fraction of cells with a significant response to category which
are excluded because they were not rejected by the first t-test.}
}
\references{
Steinmetz, P.N. & Thorp, C.K. (2013) Testing for effects of different stimuli on neuronal
firing relative to background activity. Journal of Neural Engineering, Sept. 2013.
}
\author{
Peter N. Steinmetz <PeterNSteinmetz@steinmetz.org>
}
\note{
The t-test which is performed for pre-selection is two-sided.
}

\examples{
# This set of rates and alphas will exclude approximately 62% of neurons with 
# an effect of category on firing rates.
compExclusionFraction(10,c(10,9.5,10.5),5,
	pretestP=0.01,anovaP=0.05,showProgress=TRUE)
}

\keyword{datagen}
