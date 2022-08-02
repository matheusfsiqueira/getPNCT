#' Get information on K Factors of PNCT count sites
#'
#' @description
#' Gathers information on K Factors (in portuguese, Fatores K) for a given count location using the DNIT Web API.
#' @param id PNCT equipment id (given by get_PNCT_sites()).
#' @param year traffic data for a given year. Input one of the following years: 2014,2015,2016,2017,2018,2019 or 2021.
#' @return Returns a data frame with K factors data for a given count location
#' @examples 
#' temp1 <- get_K_factor(id = 414,year=2018)
#' @export
#' 


get_K_factor <- function(id,year){
  
  url <- "http://servicos.dnit.gov.br/dadospnct/api/FatorK/"
  
  fatorK <- jsonlite::fromJSON(paste0(url,id,"/",year,"?maxDados=500"),
                               simplifyDataFrame = T)[["dado"]]
  
  fatorK_crescente <- fatorK[["crescente"]]
  
  fatorK_decrescente <- fatorK [["decrescente"]]
  
  fatorK_treated <- rbind( cbind(fatorK_crescente[["valores"]],data.frame(diasConsiderados = fatorK_crescente$diasConsiderados,VDMA = fatorK_crescente$vmda)),
                           cbind(fatorK_decrescente[["valores"]],data.frame(diasConsiderados = fatorK_decrescente$diasConsiderados,VDMA = fatorK_decrescente$vmda))
  )
  
}

