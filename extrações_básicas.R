#Locais da campanha de vacinação em Recife em CSV
locais_Recife_CSV <- read.csv2("http://dados.recife.pe.gov.br/dataset/72c94f87-1fcd-4145-9016-31dff794688a/resource/dbf660d2-1ee5-451a-94ca-7c316e50d0ad/download/locaisvacinacovid.csv", 
                               sep = ';', encoding = 'UTF-8')

#Locais da campanha de vacinação em Recife em Json
install.packages('rjson')
library(rjson)
locais_Recife_json <- fromJSON(file = "http://dados.recife.pe.gov.br/dataset/72c94f87-1fcd-4145-9016-31dff794688a/resource/3b86294b-0050-484e-8c10-c0152a5ff8ac/download/metadados-covid19.json") 
locais_Recife_json <- data.frame(locais_Recife_json)

#Cursos da WSU em xml
install.packages('XML')
library(XML)
cursos_WSU <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/wsu.xml")
