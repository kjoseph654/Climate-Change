brickdata<- function (filtered, b) {
  #filtered=tsbrick output, b = rasterbrick
  
  require(plyr)
  require(dplyr)
  require(tidyr)
  require(signal)
  require(raster)
  require(rgdal)
  require(ncdf4)
  require(lubridate)
  require(stringr)
  
  extraction<-data.frame(matrix(nrow=(nlayers(b)/365),ncol=8))
  names(extraction)<-c("Year","Onset","End","Minimum","Duration","Intensity","Onset Date","End Date")
  
  for (year in strtoi(substr(labels(b)[1],2,5)):strtoi(substr(labels(b)[nlayers(b)],2,5)))
  {
    onset<-max(filtered[which(grepl(paste(year,"-05-01",sep=""), filtered$Date)):which(grepl(paste(year,"-07-15",sep=""), filtered$Date)),2])
    end<-max(filtered[which(grepl(paste(year,"-07-16",sep=""), filtered$Date)):which(grepl(paste(year,"-09-30",sep=""), filtered$Date)),2])
    index1<-match(onset,filtered[,2])
    index2<-match(end,filtered[,2])
    minimum<-min(filtered[index1:index2,2])
    date1<-filtered[index1,1]
    date2<-filtered[index2,1]
    duration<-index2-index1
    intensity<-((onset+end)/2)-minimum
    #rounding for ease
    onset<-format(round(onset,2),nsmall=2)
    end<-format(round(end,2),nsmall=2)
    minimum<-format(round(minimum,2),nsmall=2)
    intensity<-format(round(intensity,2),nsmall=2)
    #adding to the data.frame
    extraction[year+1-strtoi(substr(labels(b)[1],2,5)),1:8]<-c(year,onset,end,minimum,duration,intensity,toString(date1),toString(date2))
  }
  return(extraction)
}
  
