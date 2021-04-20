

library(dplyr)

#Distribuição normal
dist_normal_1 <- rnorm(600,1)

dist_normal_2 <- rnorm(600, 2)

#Variável de contagem
dist_poisson <- rpois(600, 3)

#Distribuição binomial negativa
dist_bi_neg <- rnbinom(600, mu=3, size=10)

#Distribuição binomial
dist_bi <- rbinom(600, 1, 0.4)

#Variável qualitativa

dist_quali <- ifelse(dist_bi == 1, "ferrari", "mercedes")

#Variável de index
dist_index <- seq(1, length(dist_normal_1))


#Centralização das distribuições normais

dist_normal_1_central <- dist_normal_1 - mean(dist_normal_1)

dist_normal_2_central <- dist_normal_2 - mean(dist_normal_2)


#Troca dos 0 por 1 na variável de contagem

dist_poisson1 <- ifelse(dist_poisson == 0, 1 , )


banco <- data.frame(dist_bi, dist_bi_neg, dist_normal_1, dist_normal_2, dist_poisson, dist_quali)

banco2 <- replicate(100, sample(banco, 6, replace = TRUE))

sample(dist_normal_1, 100, replace = FALSE)



               