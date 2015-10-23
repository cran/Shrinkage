\name{nIC.est}
\alias{nIC.est}
\alias{nBF_estimator}
\alias{nAICc_estimator}
\alias{nBIC_estimator}
\title{
Estimators based on model selection criteria. 
}
\description{
Estimators based on a model selection criteria: Bayes factor, Akaike information or Bayesian information criteria.
}
\usage{
nIC.est(x, y = NULL, opt = c('BF','AIC','BIC'), param0 = NULL, param = NULL,
  logx = TRUE, ...)

nBF_estimator(x, y = NULL, param0 = NULL, param = NULL, logx = TRUE, ...)

nAICc_estimator(x, y = NULL, param0 = NULL, param = NULL, logx = TRUE, ...)

nBIC_estimator(x, y = NULL, param0 = NULL, param = NULL, logx = TRUE, ...)
}
\arguments{
  \item{x}{Input data matrix: features(rows) x samples (columns). See examples.}
  \item{y}{Optional input data matrix.}
  \item{opt}{Option for selecting the type of estimator, it is a character: 
  \describe{  
    \item{"BIC"}{estimator based on the Bayesian information criterion (BIC). Equivalent function: \code{nBIC_estimator}}
    \item{"AIC"}{estimator based on the Akaike information criterion corrected for small samples (AICc). Equivalent function: \code{nAICc_estimator}}
    \item{"BF"}{estimator based on the Bayes factor (BF). Equivalent function: \code{nBF_estimator}.}
  }}
  \item{param}{Numeric vector, the effect-size of the parameter of interest. If input \code{param = NULL}, it is internally computed from the input matrices \code{x} and \code{y} if they are given.}
  \item{param0}{Value of the effect-size of the parameter of interest corresponding to the null hypothesis (null value)(i.e. log fold change corresponding to no change, usually 0). If input \code{param0 = NULL}, it is internally set.}
  \item{logx}{If \code{logx = TRUE} (and \code{param = NULL} and \code{param0 = NULL}), \code{param} is computed internally considering that input matrices \code{x} and \code{y} are logarithms and thus \code{param0} is set to 0.}
  \item{\dots}{Further arguments to pass to an internal function.}
}
\value{
A vector of length equal to the total number of features (i.e. proteins, genes,...).
}
\note{
    When inputs \code{param} and/or \code{param0} are not given, they are computed internally from matrices \code{x} and \code{y}.
    If \code{logx = TRUE} then \code{param} \eqn{= \bar{x} - \bar{y}} and \code{param0} is set to 0, while if \code{logx = FALSE} then \code{param} \eqn{= \bar{x} / \bar{y}} and \code{param0} is set to 1.
}

\author{
Code: Zahra Montazeri, Corey M. Yanofsky, David R. Bickel and Marta Padilla (modifications)\cr
Documentation: Alaa Ali and Marta Padilla
}
\references{
%Schwarz G: Estimating the Dimension of a Model. The Annals of Statistics 1978, 6(2):461-464.
Yanofsky, C. M., & Bickel, D. R. (2010). Validation of differential gene expression algorithms: Application comparing fold-change estimation to hypothesis testing. BMC Bioinformatics, 11, 63.
}
\examples{
#simulate some data sets: matrices of log-abundance levels
nsam<-5         #number of individuals
nfeat<-6        #number of features (metabolites, genes,...)
diffs<-c(1,4)   #features with differential log-abundance levels
lfc<-5          #differential quantity

# create xprnSet, xprnSetPair and numeric objects:
x <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #case
y <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #control
x[diffs,] <- x[diffs,] + lfc

# examples: ----------
z1 <- nIC.est(x=x,opt='BIC')
z2 <- nIC.est(x=x,opt='BF')   
z3 <- nIC.est(x=x,opt='AIC') 
z4 <- nIC.est(x=x,y=y,opt='BIC')
z5 <- nIC.est(x=x,y=y,opt='BF')   
z6 <- nIC.est(x=x,y=y,opt='AIC') 
\dontshow{
    str(z1);str(z2);str(z3);str(z4);str(z5);str(z6)
}
}
\keyword{Bayes factor}
\keyword{Akaike information criterion}
\keyword{Bayesian information criterion}
\keyword{AIC}
\keyword{BIC}
