
library(eeptools)

nome_clube <- c("Sport", "Santa Cruz", "Náutico", "Central", "RetrÔ", "Salgueiro")

criação_clube <- as.Date(c("1905-03-13", "1914-02-03", "1901-04-07", "1919-06-15", "2016-02-15", "1972-05-23"))

idade_clue <- round(age_calc(criação_clube, units = 'years'))

lista_clubes <- data.frame(
  Clube = nome_clube,
  Criação = criação_clube,
  Idade = idade_clue
)