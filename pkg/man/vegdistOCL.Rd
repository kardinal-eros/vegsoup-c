\encoding{UTF-8}
\name{vegdistCL}
\alias{vegdistCL}
\title{ Open CL implementation of vegan's vegdist function }
\description{

}

\usage{vegdist(x, method="bray", binary=FALSE, diag=FALSE, upper=FALSE,
        na.rm = FALSE, ...) } 
\arguments{
  \item{x}{Community data matrix.}
  \item{method}{Dissimilarity index, partial match to  \code{"manhattan"},
    \code{"euclidean"}, \code{"canberra"}, \code{"bray"}, \code{"kulczynski"},
     \code{"jaccard"}, \code{"gower"}, \code{"altGower"}, \code{"morisita"}, 
     \code{"horn"}, \code{"mountford"}, \code{"raup"} , \code{"binomial"}, 
     \code{"chao"} or \code{"cao"}.}
  \item{binary}{Perform presence/absence standardization before analysis
    using \code{\link{decostand}}.}
  \item{diag}{Compute diagonals. }
  \item{upper}{Return only the upper diagonal. }
  \item{na.rm}{Pairwise deletion of missing observations when
    computing dissimilarities.}
  \item{\dots}{Other parameters.  These are ignored, except in
    \code{method ="gower"} which accepts \code{range.global} parameter of
    \code{\link{decostand}}. .}
}

\details{
 
}
\value{
  Should provide a drop-in replacement for \code{\link{vegdist}} and
  return a distance object of the same type. 
}
\references{

}

\author{  }

\examples{
}
\keyword{ multivariate }
