#estrutura condicional

library(haven)

url <- "https://github.com/MartinsRodrigo/Analise-de-dados/raw/master/04622.sav"

download.file(url, "banco.sav", mode = "wb")

banco <- read_sav("banco.sav")

banco$D1A_ID <- ifelse(banco$D1A_ID > 60, "idoso", "não idoso") #Modifica a variável idade do ESEB 2018, separando idosos (>60) de não idosos.

library(poliscidata)

banco <- gss %>% 
  filter(!is.na(sibs),
         !is.na(childs),
         !is.na(age))

par(mfrow = c(2, 2))

#Análise realizada a partir do banco gss, observando a idade o número de filhos e irmãos

for (i in 7:9) {
  x <- banco[ , i] 
  hist(x,
       main = names(banco)[i],
       xlab = "Valores da Variável", 
       ylab = 'Frequência', 
       xlim = c(min(banco[, i]), max(banco[, i]))) 
}