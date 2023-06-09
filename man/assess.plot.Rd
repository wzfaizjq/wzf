% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assess.plot.R
\name{assess.plot}
\alias{assess.plot}
\title{check the relationship between the prediction and observation and create a scatter plot with the regression or a quantile regression}
\usage{
assess.plot(obs, pre, quantile = c(0.05, 0.95), ...)
}
\arguments{
\item{obs}{the original value}

\item{pre}{the prediction value}

\item{quantile}{optional, the quantile percentage for quantile regression plote g.c(0.05,0.95)(default)}

\item{...}{the other parameters of package ggplot2}
}
\value{
the scatter plot with the regression formula
}
\description{
check the relationship between the prediction and observation
}
\examples{

assess.plot(pre = sample(1:100, 100, replace = TRUE), obs = sample(1:100, 100, replace = TRUE))
}
