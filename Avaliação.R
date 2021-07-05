library(lubridate)
library(dplyr)
library(readxl)
library(tidyverse)
library(funModeling) 
library(Hmisc)
library(fuzzyjoin)

#Importando os dados
dados <- read.csv2("https://dados.seplag.pe.gov.br/apps/basegeral.csv", header=T, na.strings=c("","NA"))

dados$dt_notificacao <- as.Date(dados$dt_notificacao, format = "%Y-%m-%d")

populacao <- read_excel('C:/Users/uliss_000/Documents/analise_de_dados/bases_originais/analise_de_dados_2/tabela6579.xlsx', sheet = 1)
status(populacao)

#Fitrar municipios de pernambuco
populacao <- populacao[grep("(PE)",populacao$municipio), ]

#Filtrar casos confirmados
dados_filtrados <- dados[grep("CONFIRMADO",dados$classe), ] 

#Criando uma variável de semana epidemiológica
dados_filtrados <- dados_filtrados %>% mutate(epiweek(dados_filtrados$dt_notificacao)) 


#Verficando e retirando os NA da variável município
status(dados_filtrados)

(dados_filtrados$municipio <- impute(dados_filtrados$municipio, "random"))


#Calculando o número de casos confirmados por semana epidemiológica

dados_municipio_confirmados <- dados_filtrados %>% group_by(municipio) %>% count(`epiweek(dados_filtrados$dt_notificacao)`) %>% mutate(casos_confirmados = n)

dados_municipio_obito <- dados_filtrados[grep("OBITO",dados_filtrados$evolucao), ] %>% group_by(municipio) %>% count(`epiweek(dados_filtrados$dt_notificacao)`) %>% mutate(obitos_confirmados = n)


#Unindo dados confirmados e de óbito

dados_municipio <- fuzzyjoin::stringdist_join(dados_municipio_confirmados, dados_municipio_obito, by = c("municipio", "epiweek(dados$dt_notificacao)"), mode='left')


#Unido as duas bases de dados de acordo com a varável município (a função não encontrou os dados entre as variáveis de município)

dados_populacao <- fuzzyjoin::stringdist_join(dados_municipio_confirmados, populacao,  mode='left')

# Fiquei travado neste ponto, não consegui unir as bases de dados de forma útil.

