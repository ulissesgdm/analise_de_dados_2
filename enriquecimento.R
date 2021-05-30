
library(dplyr)
library(tidyverse)

votacao <- read.csv2('C:/Users/uliss_000/Downloads/votacao_partido_munzona_2020_BRASIL.csv', sep = ';')

eleitorado <- read.csv2('C:/Users/uliss_000/Downloads/perfil_eleitorado_2020.csv')

eleitorado <- left_join(eleitorado, votacao, by = c('NR_ZONA' = 'NR_ZONA'))
