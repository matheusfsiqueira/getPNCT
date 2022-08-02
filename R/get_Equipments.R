#' Get information on PNCT count locations
#'
#' @description
#' Gathers information on PNCT count locations using the DNIT Web API, for a given year or all available years. Returns data on data frame or sf format.
#' @param year equipments running on a given year. Input "all" for all available equipments (default), or one of the following years: 2014,2015,2016,2017,2018,2019 or 2021.
#' @param geo if TRUE, returns a simple features (sf) object using geographical coordinates from count locations. Defaults FALSE.
#' @return Returns a data frame or sf object regarding PNCT count locations
#' @examples 
#' temp1 <- get_PNCT_sites(year="all",geo=T)
#' temp2 <- get_PNCT_sites(year=2014,geo=F)
#' @export
#' 


# Equipamentos PNCT

get_PNCT_sites <- function(year = "all", geo = FALSE){ 
  
  url <- "http://servicos.dnit.gov.br/dadospnct/api/Equipamentos/GetEquipamentos?ano="
  
  year <- ifelse(year=="all","",year)
  
  # Fetch data
  
  message("Fetching data from API...")
  
  equipamentosPNCT <- jsonlite::fromJSON(paste0(url,year),
                                         simplifyDataFrame = T)[["dado"]]
  
  # Post-treatment
  
  message("Post-treatment...")
  
  equipamentosPNCT_df <- tidyr::unnest(equipamentosPNCT,mesesVmdm)
  
  equipamentosPNCT_df <- equipamentosPNCT_df %>% pivot_wider(names_from = ano,names_prefix = "obs_",names_sort = T, values_from = meses)
  
  # Output
  
  if(GEO==TRUE){
  
  equipamentosGEO <- equipamentosPNCT_df %>%  st_as_sf(.,coords = c("longitude","latitude"),crs=4326)
  
  return(equipamentosGEO)
  
  }
  
  return(equipamentosPNCT_df)
  
}

