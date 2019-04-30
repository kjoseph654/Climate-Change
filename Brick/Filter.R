bartlett_noise_filter <- function(x,y) { 
  # x = data set; y = size of bartlett filter
  library(signal) #installs signal package
  bartlett_window <- c(bartlett(y)) #contructs a Bartlett vector with the size of the bartlett filter
  bartlett_sum <- sum(bartlett_window) #creates a sum of the bartlett window to construct an average 
  #apply filter weighted on the average and divded by the sum of the bartlett window to smooth out the data 
  filtered_data <- stats::filter(x,bartlett_window/bartlett_sum,method="convolution") 
  return(filtered_data)
}

#required packages are signal