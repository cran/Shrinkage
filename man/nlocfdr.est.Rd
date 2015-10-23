\name{nlocfdr.est}
\alias{nlocfdr.est}
\alias{nlocfdr.x}
\alias{nlocfdr.stat}
\title{
LFDR based shrinkage estimator.
}
\description{
Shrinkage estimator based on Efrons local false discovery rate (LFDR).
}
%\title{LFDR shrinkage estimator.}\description{Local FDR shrinkage estimator. }
\usage{
nlocfdr.est(x.stat = NULL, y.pvalue = NULL, pval.fun = t.test, arglis.pvalfun = list(),
    alternative = "greater", param = NULL, param0 = NULL, logx = TRUE, nulltype = 0,
    q.norm = T, ...)

nlocfdr.x(x = NULL, y = NULL, pval.fun = t.test, arglis.pvalfun = list(),
    alternative = "greater", param = NULL, param0 = NULL,  logx = TRUE, nulltype = 0,
    q.norm = T, ...)

nlocfdr.stat(stat = NULL, pvalue = NULL, param = NULL, param0 = 0, nulltype = 0,
    q.norm = T, ...)

}
\arguments{
    \item{x.stat}{Input data matrix (features (rows) x samples (columns)) or numeric vector of statistics for the general function \code{nlocfdr.est}.}
    \item{y.pvalue}{Optional input data matrix or numeric vector of pvalues for the general function \code{nlocfdr.est}.}
    \item{x}{Input data matrix: features (rows) x samples (columns) for function \code{nlocfdr.x}. See examples.}
    \item{y}{Optional input data matrix for function \code{nlocfdr.x}.}
    \item{stat}{Input (numeric) vector of statistics for function \code{nlocfdr.stat}. Pvalues (\code{pvalue}) or statistics (\code{stat}) must be non null.}
    \item{pvalue}{Input (numeric) vector of pvalues for function \code{nlocfdr.stat} (see Note).}
    %       \item{emp.null}{If FALSE, it is used the theoretical null for the null hypothesis distribution, i.e. N(0,1) (see \code{locfdr} package).
    %            If TRUE, the null hypothesis distribution is estimated from data (see \code{Psihat} package).}
    %       \item{moderated.t}{Estimator uses the moderated (regularized) t-statistics.}
    \item{pval.fun}{Function to compute p-values from the input data. Usually: "t.test", "wilcox.test", etc.}
    \item{alternative}{Argument for input function \code{pval.fun}, type of p-values to be computed: "less", "greater", "two-sided" (see \code{stats} R package).}
    \item{arglis.pvalfun}{Further arguments for the input function \code{pval.fun} (see \code{stats} R package).}
    \item{param}{Numeric vector as the parameter of interest (effect-size). If input \code{param = NULL}, it is internally computed from the input matrices \code{x} and \code{y} if they are given.}
    \item{param0}{Null value of the parameter of interest (i.e. log fold change corresponding to no change, usually 0). If input \code{param0 = NULL}, it is internally set.}
    \item{logx}{If \code{logx = TRUE} (and \code{param = NULL} and \code{param0 = NULL}), \code{param} is computed internally considering that input matrices \code{x} and \code{y} are logarithms, and \code{param0} is set to 0.}
    \item{nulltype}{Parameter for selection of the type of null hypothesis distribution in Efrons method (package \code{locfdr}):
        \describe{
        \item{0:}{theoretical null hypothesis distribution,}
        \item{1-3:}{empirical null hypothesis distribution (See function \code{locfdr} in \code{locfdr} package).}}
    }
    \item{q.norm}{If \code{q.norm = TRUE}, \code{stat} is internally computed from \code{pvalue} (see Note).}
    \item{\dots}{Further arguments to pass to function \code{locfdr}  (see package \code{locfdr}).}
    }
\value{
A vector of length equal to the total number of features (i.e. proteins, genes,...).
}
\seealso{
    Function and package \code{locfdr}.
}
\note{
    when \code{stat} is empty (or \code{q.norm = TRUE}), the vector \code{stat} is internally computed by \code{qnorm(pvalue)} if \code{pvalue} is available.
    
    When inputs \code{param} and/or \code{param0} are not given, they are computed internally from matrices \code{x} and \code{y}.
    
    If \code{logx = TRUE} then \code{param} \eqn{= \bar{x} - \bar{y}} and \code{param0} is set to 0, while if \code{logx = FALSE} then \code{param} \eqn{= \bar{x} / \bar{y}} and \code{param0} is set to 1.
    
    Function \code{nlocfdr.stat} needs inputs \code{param} and \code{param0}.
}

\author{
Code: Corey M. Yanofsky, Zahra Montazeri, David R. Bickel and Marta Padilla (modifications)\cr
Documentation: Alaa Ali and Marta Padilla
}
\references{
Yanofsky, C. M., & Bickel, D. R. (2010). Validation of differential gene expression algorithms: Application comparing fold-change estimation to hypothesis testing. BMC Bioinformatics, 11, 63.

Montazeri, Z., Yanofsky, C. M., & Bickel, D. R. (2010). Shrinkage estimation of effect sizes as an alternative to hypothesis testing followed by estimation in high-dimensional biology: Applications to differential gene expression. Statistical Applications in Genetics and Molecular Biology, 9, 23.
}
\examples{
#simulate some data sets: matrices of log-abundance levels
nsam<-20        #number of individuals
nfeat<-40       #number of features (metabolites, genes,...)
diffs<-c(1:4)   #features with differential log-abundance levels
lfc<-5          #differential quantity

# create data sets:
x <- matrix(rnorm(nfeat*nsam), nrow = nfeat, ncol = nsam) #case
y <- matrix(rnorm(nfeat*nsam), nrow = nfeat, ncol = nsam) #control
x[diffs,] <- x[diffs,] + lfc

stat<-rnorm(nfeat) #a vector of statistics
stat[diffs]<-stat[diffs]+lfc

# shrinkage estimator ----------
z1 <- nlocfdr.stat(stat=stat,param=rowMeans(x))
z2 <- nlocfdr.x(x=x,y=y,pval.fun="wilcox.test",nulltype=1,df=3)      

\dontshow{
    str(z1);str(z2)
}
}
\keyword{LFDR}
\keyword{local false discovery rate}

