#' Get information on Seasonal Factors of PNCT count sites
#'
#' @description
#' Gathers information on Seasonal Factors (in portuguese, Fatores de Sazonalidade) for a given count location using the DNIT Web API.
#' @param id PNCT equipment id (given by get_PNCT_sites()).
#' @param year traffic data for a given year. Input one of the following years: 2014,2015,2016,2017,2018,2019 or 2021.
#' @param type type of seasonal factor: "month" for Monthly factors, "week" for Weekly factors, or "weekday" for seasonal factors among days of the week.
#' @return Returns a data frame with seasonal factors data for a given count location
#' @examples 
#' temp1 <- get_seasonal_factors(id = 414,year=2018,type="month")
#' @export
#' 


get_seasonal_factor <- function(id,year,type=c("month","week","weekday")){
  
  if(type == "month"){
  
  url <- "http://servicos.dnit.gov.br/dadospnct/api/FatorSazonalidadeMensal/"
  
  }else if(type == "week"){
    
    url <- "http://servicos.dnit.gov.br/dadospnct/api/FatorSazonalidadeSemanal/"
    
  }else{
    
    url <- "http://servicos.dnit.gov.br/dadospnct/api/FatorSazonalidadeDiaSemana/"
    
  }
  
  fatorSazonal <- jsonlite::fromJSON(paste0(url,id,"/",year),
                               simplifyDataFrame = T)[["dado"]]

  
}

