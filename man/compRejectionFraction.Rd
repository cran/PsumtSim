\name{compRejectionFraction}
\alias{compRejectionFraction}
\title{
Compute rejection fraction for sequential tests.
}
\description{
Computes the fraction of simulated neurons with Poisson spike counts which are rejected
by a sequence of tests. First a t-test for a difference from baseline for any category,
followed by an ANOVA of an effect of category on the cells found to be significant in the
first test.
}
\usage{
compRejectionFraction(bkgLevel, respLevel, numCats, pretestP, anovaP, showProgress =
FALSE, numTrialsPerCat = 10, numCells = 1000)
}
\arguments{
  \item{bkgLevel}{
Average firing rate for background counts.
}
  \item{respLevel}{
Average firing rate for response counts.
}
  \item{numCats}{
Number of categories to test for a response in.
}
  \item{pretestP}{
p-value to use in first t-test for a difference from baseline.
}
  \item{anovaP}{
p-value to use in second ANOVA testing for an effect of category on the responses.
}
  \item{showProgress}{
TRUE if should list cell number as calculating. Default is FALSE.
}
  \item{numTrialsPerCat}{
Number of trials, with background and response counts, in each category. Default is 10.
}
  \item{numCells}{
Number of cells to simulate. Default is 1000.
}
}
\details{
If the first and second tests were operating independently, the rejectionFrac would remain
constant and equal to the anovaP value for all exclusion fractions.
}
\value{
\item{exclusionFrac}{Fraction of cells which were not rejected by the first t-test;
thus fraction of those ignored for the second test.}
\item{rejectionFrac}{Fraction of cells rejected by the first test which were rejected
by the second test.}
}
\references{
Steinmetz & Thorp, 2012.
}
\author{
Peter N. Steinmetz <Peter.Steinmetz@steinmetz.org>
}
\note{
Both the t-test and the ANOVA assume a normal distribution of the counts.
}

\examples{
  compRejectionFraction(1,1,10,0.01,0.05,showProgress=TRUE)
}

\keyword{datagen}
