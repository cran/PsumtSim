\name{PsumtSim-package}
\alias{PsumtSim-package}
\alias{PsumtSim}
\docType{package}
\title{
Simulations of grouped responses relative to baseline.
}
\description{
Functions to simulate Poisson distributed responses relative to
a baseline and compute achieved significance level and powers for tests on the
simulated responses. These functions were used to perform the calculations in the 
paper by Steinmetz & Thorp (2013).
}

\details{
\tabular{ll}{
Package: \tab PsumtSim\cr
Version: \tab 0.4\cr
Date: \tab 2012-08-26\cr
License: \tab GPL version 3 or newer\cr
Built: \tab R 2.13.0; ; 2012-02-03 22:41:44 UTC; unix\cr
}

\preformatted{
Index:
calcNumRejects          Calculate number of cases rejected in grouped Poisson responses.
catEffectBootAdaptor
                        Adaptor to use a statistic calculating function with boot 
												functions.
compExclusionFraction		
                        Computes fraction of simulated cells, with Poisson responses 
                        to background and varying rates to different categories, which 
                        will have an effect of category but be excluded by pre-testing.
compPowerCatSelectivity
												Compute number of simulated neurons with a significant effect 
												of category using a bootstrapped F-ratio test.
compPowerGeneralRespDetection
                        Perform repeated simulations of grouped responses, where all
                        groups differ from baseline and determine number significant.
compPowerRespDetection
                        Perform repeated simulations of grouped responses, where some
                        groups differ from baseline and determine number significant.
compRejectionFraction   Compute rejection fraction for sequential tests.												
simCatResp              Simulate grouped Poisson responses.
simNormCatResp          Simulate grouped responses which are Normally distributed.
testCatEffectBoot       Test for an effect of category using bootstrapping.
}

This package provides a set of functions for simulating grouped responses and 
testing them for significant deviations from baseline. This is primarily of 
use for computing power of different testing methods. 

The highest level functions are \code{\link{compPowerGeneralRespDetection}} and 
\code{\link{compPowerRespDetection}} which will perform repeated simulation 
and testing, determining the number of simulations which produce significant results.

The example for the \code{\link{compPowerRespDetection}} shows code to generate 
the data in figure 4 of Steinmetz & Thorp 2013 and the example for 
\code{\link{compPowerCatSelectivity}} shows code to generate figure 5.
}

\author{
Peter N. Steinmetz <PeterNSteinmetz@steinmetz.org>, 
Christopher Thorp <thorp@spacia.org>

Maintainer: Peter N. Steinmetz <PeterNSteinmetz@steinmetz.org>
}
\references{
Efron B, Tibshirani RJ. An Introduction to the Bootstrap (Chapman & Hall/CRC Monographs on
Statistics & Applied Probability). Chapman and Hall/CRC; 1994.

Steinmetz, P.N. & Thorp, C.K. (2013) Testing for effects of different stimuli on neuronal
firing relative to background activity. Journal of Neural Engineering, Sept. 2013.
}
\keyword{ package }
\seealso{
\code{\link[EffectsRelBaseline:EffectsRelBaseline-package]{EffectsRelBaseline}},
\code{\link{boot}}
}
