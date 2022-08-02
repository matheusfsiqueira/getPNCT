#' Get information on Daily Average Daily Traffic (DADT) of PNCT count sites
#'
#' @description
#' Gathers information on DADT (in portuguese, VDMd, Volume Diário Médio Diário) for a given count location using the DNIT Web API.
#' @param id PNCT equipment id (given by get_PNCT_sites()).
#' @param year traffic data for a given year. Input one of the following years: 2014,2015,2016,2017,2018,2019 or 2021.
#' @return Returns a data frame with WADT data for a given count location
#' @examples 
#' temp1 <- get_VDMS(id = 414,year="all")
#' temp2 <- get_VDMS(id = 414,year=2018)
#' @export
#' 


get_VDMD <- function(id,year){
  
  url <- "http://servicos.dnit.gov.br/dadospnct/api/VmdDiaSemana/"
  
  vdmd <- jsonlite::fromJSON(paste0(url,id,"/",year),
                             simplifyDataFrame = T)[["dado"]]
  
}

