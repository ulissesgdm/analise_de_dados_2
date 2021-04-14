
binomialnegsimulação <- rnbinom(300, mu = 3, size = 10) #criamos uma binomial negativa

poisonsimulação <- rpois(300, 3)

#são duas distribuições de contagem, para mero exemplo.

hist(binomialnegsimulação)
hist(poisonsimulação)

#gáfico de histograma, bom para identificar outliers.

binomialnegsimulação + poisonsimulação #soma das funções

poisonsimulação + 100 #adicionar 100 a cada elemento da função

poisonsimulação^2 #eleva ao quadrado

poisonsimulação * binomialnegsimulação # multiplica

round(simulaçaonorm, 0) # arredonda o vetor para inteiros

ceiling(simulaçaonorm) # arredonda para cima

floor(simulaçaonorm) # arredonda para baixo

simulaçaonorm %% poisonsimulação # módulo dos vetores



#centralização

#A centralização auxilia na normalização dos dados, contudo sempre é bom tomar cuidado com a manipulação desses dados.

library(eeptools)

nome_clube <- c("Sport", "Santa Cruz", "Náutico", "Central", "RetrÔ", "Salgueiro")

criação_clube <- as.Date(c("1905-03-13", "1914-02-03", "1901-04-07", "1919-06-15", "2016-02-15", "1972-05-23"))

idade_clue <- round(age_calc(criação_clube, units = 'years'))

idade_clube_central <- idade_clue - mean(idade_clue)
hist(idade_clue)
hist(idade_clube_central)


