

############################Settings##########################

#Root Path
Root <- "C:/Users/Antonio/OneDrive/FileTransfer"
setwd(Root)

#Set directories
sourcePath <- "C:/Users/Antonio/Desktop/sourcePath"
destinationPath <- "C:/Users/Antonio/Desktop/destination_Path"
newFileName <- 'Arquivo_FINAL.xlsx'
logTemp <- tempfile()


#########################Packges###############################

packages <- c("readr", "dplyr")
install.packages(setdiff(packages, rownames(installed.packages())))

library(readr)
library(dplyr)


#Delete old file only if new one exists
reNameOldFile <- function(pattern){
  
  setwd(destinationPath)
  Term <- pattern
  files <- file.info(list.files(pattern = Term ))
  oldFile  <- row.names(files)
  
  
  if(file.exists(paste(destinationPath,oldFile,sep = '/'))){
    
    logTemp <<- cbind(row.names(files), data.frame(files[4],row.names = NULL))
    names(logTemp) <<- c('Deleted.file','Created.at')
    
   
    #Rename old file
    out <-file.rename(paste(destinationPath,oldFile, sep = '/'),paste(destinationPath,paste0('OLD_',oldFile), sep = '/'))
    
  }
  return(out)
}

#Get the latest file
getNewfile <- function(pattern){
  
  setwd(sourcePath)
  Term <- pattern
  filesNew  <- file.info(list.files(pattern = Term ))
  nomeArquivo  <- row.names(filesNew)

  if (!is.null(nomeArquivo)){
    
    
   out <- file.copy(paste(sourcePath,newFileName,sep="/"),destinationPath)
    
    logTemp <<- cbind(logTemp,'New.file' = row.names(filesNew), data.frame(filesNew[4],row.names = NULL))
    names(logTemp)[4] <<- c('New.Created.at')
    
    
  }
  return(out)
}

#Create log
logSave <- function(logFile,newLog){
  
  setwd(Root)
  
  if(file.exists(paste(Root, logFile ,sep = '/'))){
    
    fileMoveScriptLog <- read_delim(logFile,
                                 ";",
                                 escape_double = FALSE, col_types = cols(New.file = col_character(),
                                 New.Created.at = col_character()),
                                 trim_ws = TRUE)
    
    #Initialize log
    logTemp <- logTemp %>%
                mutate_all(as.character)
    
    fileMoveScriptLog <- rbind(fileMoveScriptLog,logTemp)
    
    
    
    write_csv2(fileMoveScriptLog,logFile)
   
    
  }else{
    
    logTemp <- logTemp %>%
        mutate_all(as.character)
    
   write_csv2(logTemp,logFile)
    

  }
}

