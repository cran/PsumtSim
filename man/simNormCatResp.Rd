\name{simNormCatResp}
\alias{simNormCatResp}
\title{
Simulates normally distributed responses to stimuli.
}

\description{
Simulates a set of normally distributed responses to stimuli grouped
into categories and corresponding background counts unrelated to 
stimulation.
}
\usage{
simNormCatResp(bkgRate, respRates, numRespsPerCat)
}

\arguments{
  \item{bkgRate}{
Mean firing rate during a background interval, unrelated to stimulus presentation.
}
  \item{respRates}{
Mean firing rates during a response period, one for each category.
}
  \item{numRespsPerCat}{
Number of repetitions (presentation of stimuli) in each category.
}
}

\value{
Dataframe with columns for category label, background, and response counts for
each trial.
}
\author{
Peter N. Steinmetz <PeterNSteinmetz@steinmetz.org>
}

\seealso{
\code{\link{simCatResp}}
}
\examples{
simNormCatResp(10.0,c(10,20,30),5)->sim2
anova(glm(resp~category,data=sim2),test='F')
}

\keyword{datagen}
