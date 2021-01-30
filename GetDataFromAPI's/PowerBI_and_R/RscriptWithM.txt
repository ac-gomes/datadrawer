let
    Script_R = R.Execute("library(httr)#(lf)library(jsonlite)#(lf)library(dplyr)#(lf)library(purrr)#(lf)library(tidyr)#(lf)Dado<- GET(paste0("&Text.From(URL_BASE)&","&Text.From(QUERY)&"),#(lf) authenticate("&Text.From(USER_ID)&","&Text.From(TOKEN)&"))#(lf)
        jsonFile  <- tempfile()#(lf)
        b <- content(Dado)#(lf)
        write_json(b$results, jsonFile )#(lf)

        extractedData <-  jsonFile  %>% 
                            fromJSON() %>% 
                            map_if(is.data.frame, list)%>%
                            as_tibble()%>%
                            unnest(cols = c( id, title, url, is_paid,published_title,instructor_name)) "),
                            
    #"Value Expandido" = Table.ExpandTableColumn(Script_R, "Value", {"id", "title", "url", "is_paid"}, {"Value.id", "Value.title", "Value.url", "Value.is_paid"})
in
    #"Value Expandido"