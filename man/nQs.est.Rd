\name{nQs.est}
\alias{nQs.est}
\alias{nQ1.est}
\alias{nQ2.est}
\title{
Frequentist estimators.
}
\description{
Frequentist Q1 and Q2 estimators. 
}
\usage{%nQs.est(x, y = NULL, opt = "Q1", mu0 = 0, c = 0.5, a = 0.4, b = 0.01, h = 1)
nQs.est(x, y = NULL, opt = "Q1", mu0 = 0, c = 0.5, a = 0.4, b = 0.01, h = 1)

nQ1.est(x, y=NULL, mu0=0, c=0.5, h=1)

nQ2.est(x, y=NULL, mu0=0, c=0.5, a=0.4, b=0.01)
}
\arguments{
    \item{x}{Input data matrix: features (rows) x samples (columns). See examples.}
  \item{y}{Optional input data matrix.}
  \item{opt}{Option for selecting the type of estimator, it is a character:
  \describe{
    \item{"Q1"}{Estimator based on the log of the raw estimated fold change. Equivalent function: \code{nQ1.est}}
    \item{"Q2"}{Estimator  based on the raw p-value that controls test-wise error rate (TWER). Equivalent function: \code{nQ2.est}}
    }}
  \item{h}{Tuning parameters for Q1 estimator.}
  \item{a,b}{Tuning parameters for Q2 estimator.}
  \item{c}{Tuning parameter for Q1 and Q2 estimator.}
  \item{mu0}{Effect size corresponding to the null hypothesis (i.e. log fold change corresponding to no change, usually 0).}
}
\value{
A vector of length equal to the total number of features (i.e. proteins, genes,...).
}
\author{
Code: Zahra Montazeri, Corey M. Yanofsky, David R. Bickel and Marta Padilla (modifications)\cr
Documentation: Alaa Ali and Marta Padilla
}
\references{
%Willink, R. (2008). Shrinkage confidence intervals for the normal mean: using a guess for greater efficiency, The Canadian Journal of Statistics, 34, 623-637.
Montazeri, Z., Yanofsky, C. M., & Bickel, D. R. (2010). Shrinkage estimation of effect sizes as an alternative to hypothesis testing followed by estimation in high-dimensional biology: Applications to differential gene expression. Statistical Applications in Genetics and Molecular Biology, 9, 23.
}
\examples{
#simulate some data sets: matrices of log-abundance levels
nsam<-5         #number of individuals
nfeat<-6        #number of features (metabolites, genes,...)
diffs<-c(1,4)   #features with differential log-abundance levels
lfc<-5          #differential quantity

# create data matrices; features x samples:
x <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #case
y <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #control
x[diffs,] <- x[diffs,] + lfc


# Q1: ----------
out <- nQs.est(x=x,opt='Q1')
out <- nQ1.est(x=x,y=y,h=0.9)           
out <- nQ1.est(x=x,y=y)              
out <- nQ1.est(x=x,mu0=0.1,c=0.4)  

# Q2: ----------
z1 <- nQs.est(x=x,y=y,opt='Q2',mu0=0.2)
z2 <- nQ2.est(x=x,y=y,c=0.4)            
z3 <- nQ2.est(x=x,a=0.4,b=0.02)  
z4 <- nQ2.est(x=x)
\dontshow{
    str(z1);str(z2);str(z3);str(z4)
}
}
\keyword{Q2}
\keyword{Q1}
\keyword{frequentist shrinkage estimator}

