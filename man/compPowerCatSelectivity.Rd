\name{compPowerCatSelectivity}
\alias{compPowerCatSelectivity}
\title{
Compute number of simulated neurons with a significant effect of category using a
bootstrapped F-ratio test.
}
\description{
Compute number of simulated neurons with a significant effect of category using a
bootstrapped F-ratio test.
}
\usage{
compPowerCatSelectivity(respRates, normDistribution = FALSE, showProgress = FALSE,
numTrialsPerCat = 15, numBootIters = 1000, numRuns = 1000, alpha = 0.05)
}

\arguments{
  \item{respRates}{
Vector of rates of responses in each category to be simulated.
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
\examples{

\dontrun{
# 
# Compute power of the F-ratio test for category selectivity over
# a range of plausible simulation parameters, placing results
# in a dataframe. This computes values a subset of which were used to 
# generate figure 5 of Steinmetz & Thorp, 2013.
#

if (exists('res',inherits=FALSE)) rm('res')

numRuns<-1000

for (numCats in c(5,10,20,30)) {
  for (anovaP in c(0.01,0.05)) {
    for (meanRate in seq(0.5,10,by=0.5)) {
      for (fracChange in c(0.1,0.25,0.5,1)) { 
        minRate<-meanRate*(1-fracChange)
        maxRate<-meanRate*(1+fracChange)
        respLevels<-seq(minRate,maxRate,length.out=numCats)
        
        print(paste(numCats,anovaP,meanRate,fracChange))
                
        numSig<-compPowerCatSelectivity(respLevels,
                                        alpha=anovaP, numRuns=numRuns,
                                        showProgress=TRUE)

        df1<-data.frame(numCats=numCats,
                        fracChange=fracChange, anovaP=anovaP, meanRate=meanRate,
                        frac=numSig/numRuns)
      
        if (!exists('res',inherits=FALSE)) res<-df1
        else res<-rbind(res,df1)
      }
    }
  }
}

}

#
# Example of smaller simulation corresponding to circle at 0.5 fractional 
# change in figure 5A of Steinmetz & Thorp, 2013.
#
numRuns<-5
numCats<-30
anovaP<-0.05
meanRate<-0.5
fracChange<-0.5
minRate<-meanRate*(1-fracChange)
maxRate<-meanRate*(1+fracChange)
respLevels<-seq(minRate,maxRate,length.out=numCats)
        
print(paste(numCats,anovaP,meanRate,fracChange))
                
numSig<-compPowerCatSelectivity(respLevels,
                                    alpha=anovaP, numRuns=numRuns,
                                    showProgress=TRUE)

df1<-data.frame(numCats=numCats,
                  fracChange=fracChange, anovaP=anovaP, meanRate=meanRate,
                  frac=numSig/numRuns)

}

\keyword{datagen}
