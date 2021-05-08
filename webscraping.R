library(rvest)
library(dplyr)

url <- "https://pt.wikipedia.org/wiki/Campeonato_Pernambucano_de_Futebol"

urlTables <- url %>% read_html %>% html_nodes("table")

urlLinks <- url %>% read_html %>% html_nodes("link")

camp_pernambucano <- as.data.frame(html_table(urlTables[7]))
