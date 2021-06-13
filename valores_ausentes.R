library(data.table)
library(funModeling) 
library(tidyverse) 

acidentes_2020 <- read.csv2("http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv")

status(acidentes_2020)

acidentes_sombra <- as.data.frame(abs(is.na(acidentes_2020))) # cria a matriz sombra da base de covid19

acidentes_sombra <- acidentes_sombra[which(sapply(acidentes_sombra, sd) > 0)] # mantém variáveis com NA
round(cor(acidentes_sombra), 3) # calcula correlações




