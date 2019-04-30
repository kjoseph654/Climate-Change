tsbrick<-function (xlon, xlat, b){
  #xlon= longitude cord, xlat= latitude cord, b=rasterbrick
  require(plyr)
  require(dplyr)
  require(tidyr)
  require(signal)
  require(raster)
  require(rgdal)
  require(ncdf4)
  require(lubridate)
  require(stringr)
  
  pts <- SpatialPoints(cbind(xlon,xlat), proj4string = CRS("+proj=longlat +ellps=WGS84 +towgs84"))
  
  points_data <- b %>% 
    raster::extract(pts, df = TRUE) %>% #does not take negative lon
    gather(date, value, -ID) %>% 
    spread(ID, value) %>%   # Can be skipped if you want a "long" table
    mutate(date = ymd(str_sub(names(b),2))) %>% 
    as_tibble()
  colnames(points_data)[2] <- "pr"
  
  asda<-bartlett_noise_filter(points_data[,2],31)
  filtered<-data.frame(points_data[,1],asda)
  names(filtered)<-c("Date","Data")
  
  
  return(filtered)
}