#' Get information on Annual Average Daily Traffic (AADT) of PNCT count sites
#'
#' @description
#' Gathers information on AADT (in portuguese, VDMa, Volume Diário Médio Anual) for a given count location using the DNIT Web API.
#' @param id PNCT equipment id (given by get_PNCT_sites()).
#' @param year traffic data for a given year. Input "all" for all available data (default), or one of the following years: 2014,2015,2016,2017,2018,2019 or 2021.
#' @return Returns a data frame with AADT data for a given count location
#' @examples 
#' temp1 <- get_VDMA(id = 414,year="all")
#' temp1 <- get_VDMA(id = 414,year=2018)
#' @export
#' 


# captura VDMa

get_VDMA <- function(id,year="all"){
  
  url <- "http://servicos.dnit.gov.br/dadospnct/api/Vmda/"
  
  year <- ifelse(year=="all","",year)
  
  vdma <- jsonlite::fromJSON(paste0(url,id,"?ano=",year),
                   simplifyDataFrame = T)[["dado"]]
  
  vdma <- rbind(vdma[["crescente"]],vdma[["decrescente"]])
  
}

