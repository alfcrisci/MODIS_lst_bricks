retrieve_filedate=function(x,prefix="MOD11A2_") {as.Date(x,format=paste0(prefix,"%Y.%m.%d"))}

LST_climday=function(x){
  require(lubridate)
  index=c(-80:284)
  return(index[yday(as.Date(x))])
} 


clim_date=function(x, climfile="layers_clim_MOD_day.rds") {
require(raster)  
layers_modis_MOD_day=readRDS(climfile)
return(layers_modis_MOD_day$MAST + layers_modis_MOD_day$YAST* sin(LST_climday(x) * (2*pi/365)+layers_modis_MOD_day$theta)-273.16)
}

