\name{compPowerRespDetection}
\alias{compPowerRespDetection}
\title{
Compute power to detect differences from background where some categories differ from
background.
}
\description{
Compute power to detect responses differing from background in a simulation of 
responses to a number of categories of stimuli, some of which differ from a 
background level of firing.
}

\usage{
compPowerRespDetection(bkgLevel, respLevel, numCats, numCatsWithResp, normDistribution =
FALSE, showProgress = FALSE, numTrialsPerCat = 15, numBootIters = 1000, numRuns = 1000,
alpha = 0.05)
}

\arguments{
  \item{bkgLevel}{
Background firing rate, prior to stimulus onset.
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
\references{
Steinmetz, P.N. & Thorp, C.K. (2013) Testing for effects of different stimuli on neuronal
firing relative to background activity. Journal of Neural Engineering, Sept. 2013.
}
\author{
Peter N. Steinmetz <PeterNSteinmetz@steinmetz.org>
}

\seealso{
\code{\link{compPowerGeneralRespDetection}}
}
\examples{
# 
# Compute power of changes from background test (CBT) over
# a range of plausible simulation parameters, placing results
# in a dataframe.
# This code generates results, a subset of which is shown in figure 4
# of Steinmetz & Thorp 2013.
#
\dontrun{
require('PsumtSim')
require('EffectsRelBaseline')
require('boot')

if (exists('res',inherits=FALSE)) rm('res')

possibleCatsWithEffect<-c(1,2,5,10)
numRuns<-1000

numCats in c(5,10,20,30)) {
  catsWithEffect<-possibleCatsWithEffect[possibleCatsWithEffect<=numCats]
  
  for (anovaP in c(0.01,0.05)) {
    for (bkgRate in seq(0.5,10, by=0.5)) { 
      for (numCatsWithEffect in catsWithEffect) {
        for (fracChange in c(0.25, 0.5, 1)) {
        	
          print(paste(numCats,anovaP,bkgRate,numCatsWithEffect,fracChange))
          
          respLevel<-bkgRate*(1+fracChange)
      
          numSig<-compPowerRespDetection(bkgRate,respLevel,numCats,
                                          numCatsWithEffect,
                                          alpha=anovaP, numRuns=numRuns,
                                          showProgress=TRUE)

          df1<-data.frame(numCats=numCats,numCatsEffect=numCatsWithEffect,
                        fracChange=fracChange, anovaP=anovaP, bkgRate=bkgRate,
                        frac=numSig/numRuns)
      
          if (!exists('res',inherits=FALSE)) res<-df1
          else res<-rbind(res,df1)
        }
      }
    }
  }
}
}

#
# Example to generate short simulation corresponding to cross at 5 in figure 4B
# of Steinmetz & Thorp, 2013. Estimate here will be highly variable due to small
# number of runs.
#

require('PsumtSim')
require('EffectsRelBaseline')
require('boot')
possibleCatsWithEffect<-5
numRuns<-5
numCats<-30
catsWithEffect<-5
anovaP<-0.01
bkgRate<-1
numCatsWithEffect<-5
fracChange<-1
print(paste(numCats,anovaP,bkgRate,numCatsWithEffect,fracChange))
          
respLevel<-bkgRate*(1+fracChange)
      
numSig<-compPowerRespDetection(bkgRate,respLevel,numCats,
                                 numCatsWithEffect,
                                 alpha=anovaP, numRuns=numRuns,
                                 showProgress=TRUE)

df1<-data.frame(numCats=numCats,numCatsEffect=numCatsWithEffect,
                  fracChange=fracChange, anovaP=anovaP, bkgRate=bkgRate,
                  frac=numSig/numRuns)
}

\keyword{datagen}
