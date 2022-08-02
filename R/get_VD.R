#' Get information on Daily Traffic Volumes of PNCT count sites
#'
#' @description
#' Gathers information on Daily Traffic Volumes (in portuguese, Volumes Diários) for a given count location using the DNIT Web API.
#' @param id PNCT equipment id (given by get_PNCT_sites()).
#' @param year traffic data for a given year. Input "all" for all available data (default), or one of the following years: 2014,2015,2016,2017,2018,2019 or 2021.
#' @return Returns a data frame with traffic volume data for a given count location
#' @examples 
#' temp1 <- get_dailyVolumes(id = 414,year="all")
#' temp2 <- get_dailyVolumes(id = 414,year=2018)
#' @export
#' 


get_VD <- function(id,year="all"){
  
  url <- "http://servicos.dnit.gov.br/dadospnct/api/Vtd/"
  
  year <- ifelse(year=="all","",year)
  
  vd <- jsonlite::fromJSON(paste0(url,id,"?ano=",year),
                             simplifyDataFrame = T)[["dado"]]
  
}

