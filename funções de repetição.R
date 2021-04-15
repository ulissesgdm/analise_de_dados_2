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
       ylab = 'Entrevistados', 
       xlim = c(min(banco[, i]), max(banco[, i]))) 
}

lapply(gss[ ,7:9], mean)

sapply(gss[ ,7:9], hist)

sapply(gss[ ,7:9], mean)

#Testei as funções apply no banco de dados GSS, mas ocorreu algum erro. Apesar de ter realizado o comando para a criação de histogramas, ela não foi capaz de apresentar a média das variáveis.





