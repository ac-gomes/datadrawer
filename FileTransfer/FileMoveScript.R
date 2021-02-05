#Script to move files between directories
#Versão 0.1


#Call functions
source("C:/Users/Antonio/OneDrive/FileTransfer/Functions.R")

if(reNameOldFile("_FINAL") == TRUE ){

    #setwd(origem)
    if ( getNewfile("_FINAL") == TRUE ){
      
     setwd(destinationPath)
     out <-file.remove('OLD_Arquivo_FINAL.xlsx')

    }
  
    if(out == TRUE){
      
      logSave('fileMoveScriptLog.csv',logTemp )
    }
}

setwd(Root)





 
  
