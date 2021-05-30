library(data.table)
library(dplyr)
library(tidyverse)

install.packages('validate')
library(validate)

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

latin_america_countries <-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela") # vetor que identifica países latino americanos

latin_america <- general_data %>% filter(location %in% latin_america_countries) # filtra casos apenas no vetor

latin_america <- latin_america %>% select(location, new_cases, new_deaths, median_age)

regras <- validator(median_age >= 0)

validacao <- confront(latin_america, regras)

summary(validacao)

plot(validacao)