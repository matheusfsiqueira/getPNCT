#' Get information on Hourly Traffic Volumes of PNCT count sites
#'
#' @description
#' Gathers information on Hourly Traffic Volumes (in portuguese, Volumes Horários) for a given count location using the DNIT Web API.
#' @param id PNCT equipment id (given by get_PNCT_sites()).
#' @param year traffic data for a given year. Input one of the following years: 2014,2015,2016,2017,2018,2019 or 2021.
#' @param month traffic data for a given month of the year. One of 1,2,3,4,5,6,7,8,9,10,11,12.
#' @param day traffic data for a given day of the month. Input should be between 1 - 31.
#' @return Returns a data frame with traffic volume data for a given count location
#' @examples 
#' temp1 <- get_VH(id = 414,year=2018,month=1,day=1)
#' @export
#' 


get_VH <- function(id,year,month,day){
  
  url <- "http://servicos.dnit.gov.br/dadospnct/api/VolumeHora/"
  
  vh <- jsonlite::fromJSON(paste0(url,id,"?ano=",year,"&mes=",month,"&dia=",day),
                             simplifyDataFrame = T)[["dado"]]
  
}


