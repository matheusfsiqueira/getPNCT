% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_VDMS.R
\name{get_VDMS}
\alias{get_VDMS}
\title{Get information on Weekly Average Daily Traffic (WADT) of PNCT count sites}
\usage{
get_VDMS(id, year = "all")
}
\arguments{
\item{id}{PNCT equipment id (given by get_PNCT_sites()).}

\item{year}{traffic data for a given year. Input "all" for all available data (default), or one of the following years: 2014,2015,2016,2017,2018,2019 or 2021.}
}
\value{
Returns a data frame with WADT data for a given count location
}
\description{
Gathers information on WADT (in portuguese, VDMs, Volume Diário Médio Semanal) for a given count location using the DNIT Web API.
}
\examples{
temp1 <- get_VDMS(id = 414,year="all")
temp2 <- get_VDMS(id = 414,year=2018)
}
