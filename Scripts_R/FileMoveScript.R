#Script para vomer arquivos entre diretorios
#Versão 1.0
#autor: z004737u

#Call functions
source('C:\\UserData\\z004737u\\OneDrive - Siemens Healthineers\\R\\FileTransfer\\Functions.R')

if(reNameOldFile("_FINAL") == TRUE ){

    #setwd(origem)
    if ( getNewfile("_FINAL") == TRUE ){
     setwd(destino)
     out <-file.remove('OLD_MAT_BL_FINAL.xlsx')

    }
  
    if(out == TRUE){
      #Log
      logSave('fileMoveScript.csv',logTemp )
    }
}

setwd(Root)





 
  
