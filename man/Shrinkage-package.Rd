\name{Shrinkage-package}
\alias{Shrinkage-package}
\alias{Shrinkage}
\docType{package}
\title{
    Several Shrinkage Estimators. 
}
\description{
Several shrinkage estimators of the effect-size of a parameter of interest based on different criteria.
}
\details{
\tabular{ll}{
Package: \tab Shrinkage\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-10-20\cr
License: \tab GPL-3\cr
Depends: \tab methods, PsiHat, multtest, limma\cr
}
}
\author{
Code: Corey M. Yanofsky, Zahra Montazeri, David R. Bickel and Marta Padilla\cr
Documentation: Alaa Ali and Marta Padilla\cr
Maintainer: M. Padilla <padilla.mpf@gmail.com>
}
\references{
Montazeri, Z., Yanofsky, C. M., & Bickel, D. R. (2010). Shrinkage estimation of effect sizes as an alternative to hypothesis testing followed by estimation in high-dimensional biology: applications to differential gene expression. Statistical applications in genetics and molecular biology, 9(1), Article 23.

Yanofsky, C. M., & Bickel, D. R. (2010). Validation of differential gene expression algorithms: Application comparing fold-change estimation to hypothesis testing. BMC Bioinformatics, 11, 63.
}
\keyword{shrinkage estimator}
\keyword{effect size estimator}
\keyword{shrinkage effect size estimator}
\keyword{effect size}
\keyword{shrinkage}

\seealso{
\code{\link[PsiHat:PsiHat-package]{PsiHat}}, \code{multtest} and \code{locfdr} packages.
}
\examples{
#simulate some data sets: matrices of log-abundance levels
nsam<-5         #number of individuals
nfeat<-6        #number of features (metabolites, genes,...)
diffs<-c(1,4)   #features with differential log-abundance levels
lfc<-5          #differential quantity

# create data sets:
x <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #case
y <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #control
x[diffs,] <- x[diffs,] + lfc

# Examples:

z1 <- nQ1.est(x=x,mu0=0.1,c=0.4)
z2 <- nQ2.est(x=x,y=y,a=0.4,b=0.02)
z3 <- nlocfdr.x(x=x,y=y)      
z4 <- nIC.est(x=x,opt="BF")

z5 <- nscottberger.est(x=x)
z6 <- other.est (x=x,y=y,opt="pseudo")
z7 <- nhard.threshold.est(x=x,y=y,alpha=1,opt="fc")

\dontshow{
    str(z1);str(z2);str(z3);str(z4);str(z5);str(z6);str(z7)
}
}
