#two functions
source("D:/RStudio/Climate Change/Brick/brickdata.R")
source("D:/RStudio/Climate Change/Brick/Filter.R")
source("D:/RStudio/Climate Change/Brick/tsbrick.R")

b <-raster::brick("D:/RStudio/Climate Change/gz/ccsm4_historical_pr_masked.nc/ccsm4_historical_pr_masked.nc",varname="pr")
in_f <-raster::brick("D:/RStudio/Climate Change/gz/ccsm4_rcp85_pr_masked.nc/ccsm4_rcp85_pr_masked.nc",varname="pr")

timeseries<-tsbrick(276.875,8.375,b)

bricked<-brickdata(timeseries,b)