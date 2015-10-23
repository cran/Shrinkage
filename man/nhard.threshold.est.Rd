\name{nhard.threshold.est}
\alias{nhard.threshold.est}
\alias{nfc.threshold.est}
\title{
Hard-threshold estimators.
}
\description{
Hard-threshold estimators based on the raw estimates of the log fold change and their p-values.
}
\usage{
nhard.threshold.est(x, y = NULL, opt = c("fold.change","twer", "fwer", "lfdr",
    "lfdr0", "lfdr1"), alpha = 0.05, pval.fun = t.test, arglis.pvalfun = list(),
    alternative = "two.sided", ...)

nfc.threshold.est(x, y = NULL, threshold = 0.5, ...)
}
\arguments{
    \item{x}{Input data matrix: features(rows) x samples (columns). See examples.}
    \item{y}{Optional input data matrix.}
    \item{opt}{Option for selecting the type of estimator, it is a character:% "FC", "TWER", "FWER", "LFDR"
    \describe{
      \item{"fold.change"}{estimator based on the log of the raw estimated fold change (can use function \code{nfc.threshold.est} instead)}
      \item{"twer"}{estimator  based on the raw p-value that controls test-wise error rate (TWER).}
      \item{"fwer"}{estimator based on the adjusted p-value that controls family-wise error rate (FWER) from \code{multtest} package.}
      \item{"lfdr"}{estimator based on the Efrons local false discovery rate (LFDR) from \code{locfdr} package.}}}
  \item{alpha}{Hard threshold value for the general function \code{nhard.threshold.est}.}
  \item{threshold}{Hard threshold value for function \code{nfc.threshold.est}.}
  \item{pval.fun}{Function to compute p-values from the input data. Usually: "t.test", "wilcox.test", etc.}
  \item{alternative}{Argument for input function \code{pval.fun}, type of p-values to be computed: "less", "greater", "two-sided" (see \code{stats} R package).}
  \item{arglis.pvalfun}{Further arguments for the input function \code{pval.fun} (see \code{stats} R package).}
  \item{\dots}{Arguments to pass to function \code{mt.rawp2adjp} (for opt = FWER), \code{locfdr} (for opt = LFDR) or to another internal function.}
}
\value{
A vector of length equal to the total number of features (i.e. proteins, genes,...).
}
\seealso{
  \code{multtest}  and \code{locfdr} packages.
}
\author{
Code: Zahra Montazeri, Corey M. Yanofsky, David R. Bickel and Marta Padilla (modifications)\cr
Documentation: Alaa Ali and Marta Padilla
}
\references{
Montazeri, Z., Yanofsky, C. M., & Bickel, D. R. (2010). Shrinkage estimation of effect sizes as an alternative to hypothesis testing followed by estimation in high-dimensional biology: Applications to differential gene expression. Statistical Applications in Genetics and Molecular Biology, 9, 23.
}
\examples{
#simulate some data sets: matrices of log-abundance levels
nsam<-10        #number of individuals
nfeat<-40       #number of features (metabolites, genes,...)
diffs<-c(1:7)   #features with differential log-abundance levels
lfc<-5          #differential quantity

# create data sets:
x <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #case
y <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #control
x[diffs,] <- x[diffs,] + lfc

# hard threshold estimator on fold change: ----------
z1 <- nhard.threshold.est(x=x,y=y,alpha=0.3,opt="fold.change")
z2 <- nfc.threshold.est(x=x,y=y,threshold=0.5)

# other options: -----
z4 <- nhard.threshold.est(x=x,y=y,pval.fun=t.test,opt="TWER")
z5 <- nhard.threshold.est(x=x,y=y,alpha=0.05,opt="FWER")     
z6 <- nhard.threshold.est(x=x,y=y,pval.fun=wilcox.test,opt="LFDR")
\dontshow{
    str(z1);str(z2);str(z4);str(z5);str(z6)
}
}
\keyword{Hard-threshold}
\keyword{TWER}
\keyword{FWER}
\keyword{LFDR}
\keyword{test-wise error rate}
\keyword{family-wise error rate}
\keyword{local false discovery rate}
