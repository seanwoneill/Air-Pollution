complete <- function(directory= getwd(), id = 1:332) {

  directory <- getwd()

  for(i in id){
    no0 <- (3 - nchar(toString(i)))
    no0 <- paste(replicate(no0,"0"),sep="",collapse="")
    file <- paste(no0,i,".csv",sep="",collapse="")
    temp <- read.csv(file)
    temp <- na.omit(temp)
    temp <- nrow(temp)
    if (exists("store")){ ##if not first instance and store is object
      store <- rbind(store,c(i,temp))
    }else{ ##if first instance and store not yet object
      store <-  data.frame("id" = i,"nobs" = temp)
    }
  }
  
  return(store)
}