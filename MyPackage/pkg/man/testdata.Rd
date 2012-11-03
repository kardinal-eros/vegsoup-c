\name{testdata}
\alias{testdata}
\docType{data}
\title{Test data set}
\description{
	Simple data structure for testing.
}
\format{
This data frame contains the following columns:
\describe{
	\item{plot}{plot identifier, mode \code{"character"}}
	\item{abbr}{species names, mode \code{"character"}}
	\item{layer}{layer code, mode \code{"character"}}
	\item{cov}{species abundance, mode \code{"character"}} 	
}
}
\usage{
data(testdata)
}	
\examples{
data(testdata)
head(testdata)
}