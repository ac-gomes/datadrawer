

############################Settings##########################

#Root Path
Root <- 'C:\\UserData\\z004737u\\OneDrive - Siemens Healthineers\\R\\FileTransfer'
setwd(Root)

# Diretórios
origem <- "\\\\ad005.onehc.net\\meddfsroot\\dfs84\\HC_LAM_PACOTE\\CONSULTA CODIGO A7B\\"
destino <- "C:\\UserData\\z004737u\\Siemens Healthineers\\SHS AM LAM BRA FI SCM PL - HC_CX_SCM_PL\\3_EQUIP&ACESS_INVIVO\\Cadastro_de_Material\\"
novoNomeArquivo <- 'MAT_BL_FINAL.xlsx'
logTemp <- tempfile()


################################################################

library(readr)
library(jsonlite)
library(dplyr)


#Excluir arquivo antigo somente se existir o novo
reNameOldFile <- function(pattern){
  
  setwd(destino)
  Term <- pattern
  files <- file.info(list.files(pattern = Term ))
  antigoArquivo  <- row.names(files)
  
  
  if(file.exists(paste(destino,antigoArquivo,sep = '//'))){
    
    logTemp <<- cbind(row.names(files), data.frame(files[4],row.names = NULL))
    names(logTemp) <<- c('Deleted.file','Created.at')
    
   
    #Renomear arquivo
    out <-file.rename(paste(destino,antigoArquivo, sep = '//'),paste(destino,paste0('OLD_',antigoArquivo), sep = '//'))
    
  }
  return(out)
}

#Obter o arquivo mais recente
getNewfile <- function(pattern){
  
  setwd(origem)
  Term <- pattern
  filesNew  <- file.info(list.files(pattern = Term ))
  nomeArquivo  <- row.names(filesNew)

  if (!is.null(nomeArquivo)){
    
    
   out <- file.copy(paste0(origem,nomeArquivo),destino)
    
    logTemp <<- cbind(logTemp,'New.file' = row.names(filesNew), data.frame(filesNew[4],row.names = NULL))
    names(logTemp)[4] <<- c('New.Created.at')
    
    
  }
  return(out)
}

#log
logSave <- function(logFile,newLog){
  
  setwd(Root)
  
  if(file.exists(paste(Root, logFile ,sep = '\\'))){
    
    fileMoveScript <- read_delim(logFile,
                                 ";",
                                 escape_double = FALSE, col_types = cols(New.file = col_character(),
                                 New.Created.at = col_character()),
                                 trim_ws = TRUE)
    
    #fileMoveScript <- fromJSON(logFile)
    
    logTemp <- logTemp %>%
                mutate_all(as.character)
    
    fileMoveScript <- rbind(fileMoveScript,logTemp)
    
    #write_json(fileMoveScript,logFile)
    
    write_csv2(fileMoveScript,logFile)
   
    
  }else{
    
    logTemp <- logTemp %>%
        mutate_all(as.character)
    
   write_csv2(logTemp,logFile)
    
   # write_json(logTemp,logFile)
               
    
  }
}

