library(ff)
library(ffbase)

extracao_2020 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2020.csv')

extracao_2019 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2019.csv')

extracao_2018 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2018.csv')

extracao_2017 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2017.csv')

extracao_2016 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2016.csv')

extracao_2015 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2015.csv')

extracao_2014 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2014.csv')

extracao_2013 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2013.csv')

extracao_2012 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2012.csv')

extracao_2011 <- read.csv.ffdf(file='C:/Users/uliss_000/Desktop/situacao_final/situacaofinalalunos2011.csv')

extracao <- rbind(extracao_2011, extracao_2012, extracao_2013, extracao_2014, extracao_2015, extracao_2016, extracao_2017, extracao_2018, extracao_2019, extracao_2020)
head(extracao)

gc()

rm(list=(ls()[ls()!="extracao"]))

#Exportando a base 
saveRDS(extracao, "C:/Users/uliss_000/Documents/analise_de_dados/bases_originais/analise_de_dados_2/exercicio_2.rds")













