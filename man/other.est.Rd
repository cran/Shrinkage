\name{other.est}
\alias{other.est}
\alias{npseudo.est}
\alias{nlimma.est}
\alias{nlfdr0.est}
\alias{nlfdr1.est}
\title{
Other shrinkage estimators.%Estimators based on moderated t-statistics.
}
\description{
Other shrinkage estimators.
}
\usage{
other.est(x, y = NULL, opt = c("limma","pseudo","lfdr0","lfdr1"), pval.fun = t.test,
    alternative = "greater", arglis.pvalfun = list(), ...)

npseudo.est(x, y = NULL, ...)

nlimma.est(x, y = NULL, ...)

nlfdr0.est(x, y = NULL, pval.fun = t.test, alternative = "greater",
  arglis.pvalfun = list(), ...)

nlfdr1.est(x, y = NULL, pval.fun = t.test, alternative = "greater",
  arglis.pvalfun = list(), ...)
}
\arguments{
     \item{x}{Input data matrix: features(rows) x samples (columns). See examples.}
  \item{y}{Optional input data matrix.}
  \item{opt}{Option for selecting the type of estimator, it is a character:% "limma","pseudo""locfdr",
  \describe{
    \item{"locfdr0"}{estimator based on the local false discovery rate (LFDR) with theoretical null (null hypothesis distribution follows N(0,1)). Equivalent function: \code{nlfdr0.est}.}
    \item{"locfdr1"}{estimator based on the local false discovery rate (LFDR) with empiricalical null (null hypothesis distribution estimated from data). Equivalent function: \code{nlfdr1.est}.}
    \item{"limma"}{estimator  based on the raw p-value that controls test-wise error rate (TWER). Equivalent function: \code{nlimma.est}}
    \item{"pseudo"}{estimator based on the adjusted p-value that controls family-wise error rate (FWER). Equivalent function: \code{npseudo.est}}
    }}
    %\item{arglis.pvalfun}{List of arguments to input function \code{pval.fun}.}
    %\item{alternative}{Input to \code{pval.fun}. Type of p-values to be computed.}
    %\item{pval.fun}{Function name to compute the p-values. Usually: "t.test", "wilcox.test", etc.}
    \item{pval.fun}{Function to compute p-values from the input data. Usually: "t.test", "wilcox.test", etc.}
    \item{alternative}{Argument for input function \code{pval.fun}, type of p-values to be computed: "less", "greater", "two-sided" (see \code{stats} R package).}
    \item{arglis.pvalfun}{Further arguments to pass to input function \code{pval.fun} (see \code{stats} R package).}
    \item{\dots}{Further arguments to pass to internal an function.}
}
\value{
A vector of length equal to the total number of features (i.e. proteins, genes,...).
}
\author{
Code: Corey M. Yanofsky, Zahra Montazeri, David R. Bickel and Marta Padilla (modifications)\cr
Documentation: Alaa Ali and Marta Padilla
}
\references{
Yanofsky, C. M., & Bickel, D. R. (2010). Validation of differential gene expression algorithms: Application comparing fold-change estimation to hypothesis testing. BMC Bioinformatics, 11, 63.
}
\examples{
#simulate some data sets: matrices of log-abundance levels
nsam<-25         #number of individuals
nfeat<-50        #number of features (metabolites, genes,...)
diffs<-c(1,4)   #features with differential log-abundance levels
lfc<-5          #differential quantity

# create data sets:
x <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #case
y <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #control
x[diffs,] <- x[diffs,] + lfc

# moderated t-stat estimators: ----------

z1 <- other.est (x=x,y=y,opt="limma")         
z2 <- other.est (x=x,y=y,opt="pseudo")
z3 <- other.est (x=x,y=y,opt="lfdr0",pval.fun="t.test") 

\dontshow{
    str(z1);str(z2);str(z3)
}
}
\keyword{limma}
\keyword{pseudo}
\keyword{LFDR}
\keyword{locfdr}
