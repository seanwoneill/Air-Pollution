directory <- "C:\\Users\\sean\\Courses\\Coursera R Programming\\Project 1 Data\\specdata"
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## Set Directory
  setwd(directory)
  
  if(tolower(substr(pollutant,1,2)) == "n"){
    ## If Nitrate
    pol <- 1
  }
  ## If Sulfate
  else{pol <- 2 }
  
  print(pol)
  
  readcsv()

}