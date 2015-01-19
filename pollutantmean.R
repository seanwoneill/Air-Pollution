
pollutantmean <- function(directory = getwd(), pollutant = "sulfate", id = 1:332) {
  
  directory <- getwd()

  if( (substr(tolower(toString(pollutant)),1,1)) == "n"){
    ## If Nitrate
    pol <- 3
  }
  ## If Sulfate
  else{pol <- 2 }
  
  for(i in 1:length(dir(directory))){
    currentFilePath <- normalizePath(dir(directory)[i])  ##Get name of current file
    ##Get file name w/o .csv and convert to integer
    currentFileNum <- as.integer(substr(dir(directory)[i],1,3))
    if(currentFileNum %in% id){
      temp <- read.csv(currentFilePath)
      temp <- temp[[pol]]
      temp <- na.omit(temp)
      if (exists("store")){ ##if not first instance and store is object
        store <- c(store,temp)
      }else{ ##if first instance and store not yet object
        store <- temp
      }
    }
    if(exists("temp")){
      rm(temp)  
    }
  }

  #write.csv(store,file = normalizePath("store.csv"))
  final <- mean(store,strip.white=TRUE,na.rm = TRUE)
  return(final)
}
