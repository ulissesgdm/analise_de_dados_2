library(data.table)

#Criação de um large data
casos= 2e7

largeData = data.table(a=rpois(casos, 3),
                       b=rbinom(casos, 1, 0.7),
                       c=rnorm(casos),
                       d=sample(c("fogo","agua","terra","ar"), casos, replace=TRUE),
                       e=rnorm(casos),
                       f=rpois(casos, 3),
                       g=rnorm(casos)
)

head(largeData) 

enderecoBase <- 'C:/Users/uliss_000/Documents/analise_de_dados/bases_originais/analise_de_dados_2/largeData.csv'

system.time(extracaoLD1 <- read.csv2(enderecoBase))

#Extração via fread
extracaoLD3 <- fread(enderecoBase)

#Comparação da eficiência com a função read.csv2
system.time(extracaoLD3 <- fread(enderecoBase))

#Verificação da eficiência
head(extracaoLD3)