corr <- function(directory, threshold = 0) {
  
  library("tools")

  setwd("C:\\Users\\sean\\Courses\\Coursera R Programming\\Project 1 Data\\specdata")
  directory <- getwd()
  source("complete.R")
  
  sulfate <- 2
  nitrate <- 3
  
  fileThres <- complete(currentFilePath)
  
  store <- as.numeric(vector())
  
  for(i in 1:length(dir(directory))){
    currentFilePath <- normalizePath(dir(directory)[i])  ##Get name of current file
    if(file_ext(currentFilePath) == "csv"){
      currentFileNum <- as.integer(substr(dir(directory)[i],1,3))
    }else{
      next
    }
    
    if(fileThres[i,2] >= threshold){
      temp <- read.csv(currentFilePath)
      temp <- temp[sulfate:nitrate]
      temp <- na.omit(temp)
      temp <- cor(temp)
      if(!is.na(temp[1,2])){
        if (exists("store")){ ##if not first instance and store is object
          store <- c(store,temp[1,2])
        }else{ ##if first instance and store not yet object
          store <- temp[1,2]
        }
      }
    }
  }
  return(store)
}