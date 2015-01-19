
setwd("C:\\Users\\sean\\Courses\\Coursera R Programming\\Project 1 Data\\specdata")
pollutantmean <- function(directory = getwd(), pollutant = "sulfate", id = 1:332) {
  
  setwd(directory)
  
  if(tolower(substr(toString(pollutant),1,2)) == "n"){
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
      temp <- temp[pol]
      temp <- na.omit(temp)
      if (exists("store")){ ##if not first instance and store is object
        store <- paste(store,temp,sep="",collapse="")
        #store <- union(store,temp)
      }else{ ##if first instance and store not yet object
        store = temp
      }
    }
    rm(temp)
  }
  
  store <- matrix(store,ncol=10)
  write(store,file = normalizePath("store.txt"))
  final <- mean(store)
  return(final)
}
