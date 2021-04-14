#estrutura condicional

library(haven)

url <- "https://github.com/MartinsRodrigo/Analise-de-dados/raw/master/04622.sav"

download.file(url, "banco.sav", mode = "wb")

banco <- read_sav("banco.sav")


#Histograma feito com base no interesse por polÃ­tica

lapply(banco$ANOANIVER, hist)

banco$D1A_ID <- ifelse(banco$D1A_ID > 60, "idoso", "não idoso") #Modifica a variável idade do ESEB 2018, separando idosos (>60) de não idosos.