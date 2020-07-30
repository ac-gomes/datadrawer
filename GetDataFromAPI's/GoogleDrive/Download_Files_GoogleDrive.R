#Autenticação com firebase
#https://www.youtube.com/results?search_query=authentication+using+firebase
#Autor: https://www.linkedin.com/in/antoniocgomes/


library(googledrive)
library(readxl)
library(jsonlite)
library(dplyr)
#library(tidyverse)

#Root folder
Sources <- "C:/Users/Antonio/Google Drive/Arquivos/"
#User Account
drive_auth('YOUR_EMAIL_HERE')

#Download Root file
setwd(Sources)

  #Liste files by pattern in Google Drive folder
  My.Files <- drive_find(pattern = "Base_")
    
  #Donwload files funded by ID 
   for (id in My.Files$id) {
     
     googledrive::drive_download(
                                  as_id(id)
                                   ,overwrite = TRUE)
     
  }
   #List local files
   My.Files <- list.files(pattern = "Base")
   
   #Initialize dataset
   Dataset <-read_excel(My.Files[1])
   
   
   for (f in My.Files) {
     
      Current.File <-  read_excel(f)
      
      Dataset <- rbind(Dataset, Current.File)
      
      #Remove local files
      file.remove(f)
     
   }
 
#Remove all variable 
rm(list=setdiff(ls(), 'Dataset'))


