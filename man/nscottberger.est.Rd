\name{nscottberger.est}
\alias{nscottberger.est}
\title{
Scott-Berger estimator.
}
\description{
Estimator that implements a slightly altered version of the model of Scott and Berger (see references).
}
\usage{
nscottberger.est(x, y = NULL, scaled = F, ...)
}
\arguments{
  \item{x}{Input data matrix: features(rows) x samples (columns). See examples.}
  \item{y}{Optional input data matrix.}
  \item{scaled}{Logical.}
  \item{\dots}{Further arguments to pass to an internal function.}
%  \item{n_iter}{Number of iterations for the algorithm.}
%  \item{burnin}{}, n_iter = 10, burnin = 2, nchains = 15,
%    opt_init_val
%  \item{nchains}{}
% \item{opt_init_val}{Optional inicial value. }
}
\value{
A vector of length equal to the total number of features (i.e. proteins, genes,...).
}
\author{
Code: Corey M. Yanofsky, Zahra Montazeri, David R. Bickel and Marta Padilla (modifications)\cr
Documentation: Alaa Ali and Marta Padilla
}
\references{
Montazeri, Z., Yanofsky, C. M., & Bickel, D. R. (2010). Shrinkage estimation of effect sizes as an alternative to hypothesis testing followed by estimation in high-dimensional biology: Applications to differential gene expression. Statistical Applications in Genetics and Molecular Biology, 9, 23.

James G. Scott and James O. Berger, "An exploration of aspects of Bayesian multiple testing", J. Stat. Plan. Inf., 136, 2133-2162, 2006
}
\examples{
#simulate some data sets: matrices of log-abundance levels
nsam<-10        #number of individuals
nfeat<-40       #number of features (metabolites, genes,...)
diffs<-c(1:4)   #features with differential log-abundance levels
lfc<-5          #differential quantity

# create data sets:
x <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #case
y <- matrix(runif(nfeat*nsam), nrow = nfeat, ncol = nsam) #control
x[diffs,] <- x[diffs,] + lfc

# scottberger estimator: ----------
z1 <- nscottberger.est(x=x)          
z2 <- nscottberger.est(x=x,y=y)
\dontshow{
    str(z1);str(z2)
}
}
\keyword{Scottberger estimator}

