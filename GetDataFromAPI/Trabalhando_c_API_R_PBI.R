
#Autor: https://www.linkedin.com/in/antoniocgomes/
#E-mail: acgoms88@gmail.com
#Ref: https://www.youtube.com/watch?v=tlaJf0CHbFE&feature=youtu.be
#API para o projeto 360: Condição dos Aeroportos (Aberto, Fechado etc) - http://servicos.cptec.inpe.br/XML/

#Pacotes Para instalar/Carregar

#install.packages("httr")
#install.packages("jsonlite")
#install.packages("dplyr")
#install.packages("readxl")
#install.packages("stringr")

#Carregar Pacote
library(dplyr)
library(httr)
library(jsonlite)
library(readxl)

#Configurar diretórios
Dir.local <-  paste(Sys.getenv("USERPROFILE"),"\\Desktop\\R_PONTO\\Projeto360", sep = "")

#Definir work directory
setwd(Dir.local) 

#Declaração de Variveis autenticação.
key <- '41e5099328200ea76c5350e628c993ad' #APPID publica

#Listar arquivos com base de referencias de Parametros
db.pais<- list.files(Dir.local,"db_pais",TRUE,ignore.case = TRUE)

#Pegar os dados de todas as sheets e cria uma lista, é possivel com está linha lê várias planilhas de varios arquivos
pais.sheets <- lapply(1:1, function(i) read_excel(paste(Dir.local, db.pais, sep = "\\"), sheet = i))

#loop para pegar matriz dentro da lista (aplicavel principalemte quando a dados vindo de varias planilhas ajustar contador)
for (i in 1:length( pais.sheets)){
  
  if(i == 1){
    
    db.cidades <- pais.sheets[[i]]
  }  
 
}

#converter variavel em vetor
cidade.id <- paste(as.numeric( db.cidades$ID), collapse=",") 

#exemplo com 3 IDs, maximo permitido 20 para contas free
Api.url <- paste("http://api.openweathermap.org/data/2.5/group?id=", c(cidade.id),'&units=metric','&appid=', key, sep = "")

query <- httr::GET(url = Api.url)

query.json <- jsonlite::fromJSON(Api.url)
#dplyr::glimpse(query.json)

#Salvar jason  no diretorio atual
jsonlite::write_json(query.json, "previsao.json")






















