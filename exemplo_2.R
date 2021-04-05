
#Fução simples:

família <- c("Lucas", "Ulisses", "Djair", "Edjane")

#Função mais complexa, previamente realizada com os dados do ESEB 2018, observa a #possível correlação entre a idade e a avaliação no candidato Jair Bolsonaro.

library(tidyverse)
library(lmtest)

url <- "https://github.com/MartinsRodrigo/Analise-de-dados/raw/master/04622.sav"

download.file(url, "banco.sav", mode = "wb")

banco <- read_sav("banco.sav")

banco <- banco %>% mutate("avaliacao_bolsonaro" = as.numeric(Q1607)) 

banco <- banco%>% filter(avaliacao_bolsonaro <= 10)  

banco <- banco %>% filter(D9 != 9999998, D9 != 9999999)

banco <- banco %>% filter(Q1501 <= 10)

banco <- banco %>% filter(Q18 <= 10)

regressão <- lm(avaliacao_bolsonaro ~ D1A_ID + D3_ESCOLA + D9 + Q1501 + Q18, data = banco)

str(regressão)