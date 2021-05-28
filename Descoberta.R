install.packages('funModeling')

library(funModeling) 
library(tidyverse)

acidentes <- read.csv2("http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv", sep = ';', encoding = 'UTF-8')

glimpse(acidentes) # olhada nos dados
status(acidentes) # estrutura dos dados (missing etc)
freq(acidentes) # frequência das variáveis fator
plot_num(acidentes) # exploração das variáveis numéricas
profiling_num(acidentes) # estatísticas das variáveis numéricas
