\name{testCatEffectBoot}
\alias{testCatEffectBoot}
\title{
Test for an effect of category using bootstrapping.
}
\description{
Test for an effect of category using bootstrapping.
}
\usage{
testCatEffectBoot(sim, R, testFnc, ...)
}
\arguments{
  \item{sim}{
Data frame containing data to be permuted, must have 'resp' and 'category' columns.
}
  \item{R}{
Number of bootstrap iterations to execute.
}
  \item{testFnc}{
Function to evaluate one bootstrap iteration, using 'resp' and 'category' columns
in the dataframe.
}
  \item{\dots}{
Any other arguments for \code{\link{catEffectBootAdaptor}} or \code{testFnc}.
}
}
\details{
The function \code{testFnc} is invoked using the \code{\link{catEffectBootAdaptor}}
function to select
the response or background counts (set with the \code{useResp} argument) and permute 
the rows.
}
\value{
Achieved significance level, ASL}
\references{
Efron B, Tibshirani RJ. An Introduction to the Bootstrap (Chapman & Hall/CRC Monographs on
Statistics & Applied Probability). Chapman and Hall/CRC; 1994.

Steinmetz, P.N. & Thorp, C.K. (2013) Testing for effects of different stimuli on neuronal
firing relative to background activity. Journal of Neural Engineering, Sept. 2013.

}
\author{
Peter N. Steinmetz <PeterNSteinmetz@steinmetz.org>
}

\seealso{
\code{\link{catEffectBootAdaptor}}
}
\examples{
  # run simulation of responses for 4 categories and then test for category 
  # effect on response using the CBT from Steinmetz & Thorp, 2013
  simCatResp(1,c(1,1.5,2,1),6)->sim4
  testCatEffectBoot(sim4,100,sumSqCat,backMean=1)
}

\keyword{nonparametric}
