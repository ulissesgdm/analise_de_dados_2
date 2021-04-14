library(tidyverse)
library(haven)

url <- "https://github.com/MartinsRodrigo/Analise-de-dados/raw/master/04622.sav"

download.file(url, "banco.sav", mode = "wb")

banco <- read_sav("banco.sav")

banco$Q1501 > banco$Q1607 #Nota dada ao PT é maior que a nota dada a Bolsonaro

banco$D1A_ID>60 #Entrevistados maiores de 60 anos

which(banco$D1A_ID<60) #Quais entrevistados são idosos

banco$D1A_ID>18 & banco$D1A_ID<25 # quais entrevistados são jovens