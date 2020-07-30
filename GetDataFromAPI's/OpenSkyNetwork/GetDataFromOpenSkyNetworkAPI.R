#####################################
#'
#'@author: Antonio Gomes
#'@description: Script para baixar e transformar em dataset os dados da OpenSky Network API
#'@documentation: https://opensky-network.org/apidoc/
#'
#####################################

#Caso as biblitecas nao estejam instaladas descomente as linhas abaixo
#packges <-c("httr","jsonlite","plyr","dplyr","stringr","tidyr","tibble","purrr")
#install.packages(packges)

#Carregar bibliotecas
library(httr)
library(jsonlite)
library(plyr)
library(dplyr)
library(stringr)
library(tidyr)
library(tibble)
library(purrr)

#----Configurar os diretorios

#Diretorio raiz
setwd(paste0(Sys.getenv("USERPROFILE"),"\\OneDrive\\datadrower\\OpenSky\\Scripts")) 
#pasta dados onde estao os arquivo Json contendo informacoes de login
sources <- paste(getwd(),'dados',sep = "/") 
  
  #Carregarnome login da API
  UserName <- jsonlite::fromJSON(paste(sources, 'nome.json', sep = "/"))
  #Carregar senha da API
  key <- jsonlite::fromJSON(paste(sources, 'nomekey.json', sep = "/"))
  #URL base da API
  URL.Base <- '@opensky-network.org/api/states/all'
  
  #Construcao da URL para acesso
  OpenSky.API.Url <- paste0('https://',UserName ,':',key ,URL.Base)
  
  #'Cria um arquivo temporario para escrever os dados
  #'Solução idal para carregar os dados direto no ambiente do Power BI 
  #'ou qualquer outra ferramenta que tenha itegração com R
  temp.Json <- tempfile()
  
  #----Baixar os dados
  query.voos <- httr::GET(url = OpenSky.API.Url)
  
  #Remover dados de acesso
  rm(key, UserName, OpenSky.API.Url)
  
  #Extrair content para a Variavel dodos.voos
  dados.voos <-  content(query.voos)
  
  #Escrever dados no arquivo temporario 
  write_json(dados.voos, temp.Json)
  
  #Liberar memoria
  rm(query.voos,dados.voos)
  
  #----'Transformar os dados (os dados estao em listas)
  #'neste caso temos apenas um nivel de lista se houvesse mais um nivel basteria 
  #'acrescentar mais um, unnest(nome_da_lista)%>%
  dados.Opensky <- temp.Json %>% 
                      fromJSON() %>% 
                      map_if(is.data.frame, list) %>% 
                      as_tibble() %>% 
                      unnest(states)%>% 
                      mutate_all(as.character) 
  
  #Remover coluna time
  dados.Opensky <- dados.Opensky[,-c(1)]
  
  #----'Construção do titulo da tabela
  #'Titulos foram retirados da documentacao
  titulo <- c('icao24', 'callsign','origin_country', 'time_position', 'last_contact',
              'longitude',	'latitude',	'baro_altitude', 'on_ground',	'velocity','true_track',
              'vertical_rate',	'sensors',	'geo_altitude',	'squawk','spi',	'position_source')
  
  #Converter os dados em data frame e nomear as colunas 
  dados.Opensky <- as.data.frame(matrix(dados.Opensky$states, ncol=17, byrow=TRUE))
  names(dados.Opensky) <- titulo
  
  #Remover o texto list() (list() é equivalente a NULL) dados faltantes, neste caso subistiui por NA
  dados.Opensky[] <- lapply(dados.Opensky, gsub, pattern= "list\\(\\)", replacement='NA')
  
  #'As colunas (time_position e last_contact) de data de hora estao no formato Unix epoch
  #'Dever ser convertido em um formato legivel para humanos
  #'Ajustar a Time zone (tz) da sua regiao
  #'Converter as colunas em valor numerico
  dados.Opensky$time_position <- as.numeric(dados.Opensky$time_position)
  dados.Opensky$last_contact <- as.numeric(dados.Opensky$last_contact)
  
  #----Conversao da data e hora
  dados.Opensky <- dados.Opensky %>%
                    mutate(time_position = as.POSIXct(time_position, origin="1970-01-01", tz="America/Sao_Paulo"),
                              last_contact = as.POSIXct(last_contact, origin="1970-01-01", tz="America/Sao_Paulo"))

#'Para gravar o arquivo em CSV descomente a linha abaixo
#'Para carrega os dados ja transformados no Power BI ou outra ferramenta que tenha integracao com R
#'Comente a linha abaixo
write.table(dados.Opensky, file='Opensky_Result.csv', sep=',', dec='.', row.names=FALSE)
