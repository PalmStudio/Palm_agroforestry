#### estimate density of a design###
##R Perez, 23 january 2020


# Load packages -----------------------------------------------------------

packs <- c("lubridate", "stringr", "ggplot2",'dplyr','Vpalmr','xlsx','ggpmisc','plotly')
InstIfNec<-function (pack) {
  if (!do.call(require,as.list(pack))) {
    do.call(install.packages,as.list(pack))  }
  do.call(require,as.list(pack)) }
lapply(packs, InstIfNec)


# functions ---------------------------------------------------------------



#' Estimate density on simple alley cropping
#'
#' @param dist_inter inter row distance (m) 
#' @param dist_intra intra-row distance (m)
#'
#' @return density (palms.ha-1)
#' @export
#'
#' @examples
density_alley=function(dist_inter,dist_intra){
  den=floor((100/dist_inter)*(100/dist_intra))
  return(den)
}


intra=seq(4,10,1)
inter=seq(10,30,3)

frame=data.frame(d_intra=rep(x = intra,times=length(inter)),d_inter=rep(x=inter,each=length(intra)))%>%
  mutate(density=density_alley(dist_inter = d_inter,dist_intra = d_intra))
                 