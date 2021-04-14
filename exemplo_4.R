
tarefasemente <- addTaskCallback(function(...) {set.seed(123); TRUE}) #seta a semente aleatória de geração de dados

simulaçaonorm <- rnorm(125) #distribuição normal
summary(simulaçaonorm)

simulaçaobinomial <- rbinom(100, 1, 0.7) #é muito últil para machine learning (distribuição binomial)

classessimulação <- c(rep("jovem", length(simulaçaobinomial)/2), rep("jovem adulto", length(simulaçaobinomial)/2))

indexsimulação <- seq(1, length(simulaçaonorm))

removeTaskCallback(tarefasemente)

sample(simulaçaonorm, 15, replace = FALSE) #Sem reposição

sample(simulaçaonorm, 15, replace = TRUE) #com reposição

set.seed(412) #bootstraping com função replicate

#Bootstraping

bootstraping_normal_10 <- replicate(10, sample(simulaçaonorm, 10, replace = TRUE)) #Replica-se 10x a amostra, criando uma amostra (sempre é bom fazer com reposição)

mediabootsnorm10 <- replicate(10, mean(sample(simulaçaonorm, 10, replace = TRUE))) #Cálculo da média de 10 amostras de 10 casos

mediabootsnorm50 <- replicate(50, mean(sample(simulaçaonorm, 50, replace = TRUE))) #Cálculo da média de 50 amostras de 50 casos

mediabootsnorm100 <- replicate(100, mean(sample(simulaçaonorm, 100, replace = TRUE))) #Cálculo da média de 100 amostras de 100 casos

mean(mediabootsnorm10)

mean(mediabootsnorm50)

mean(mediabootsnorm100)

mean(simulaçaonorm)


# Partição

install.packages("caret", dependencies = T)
library(caret) #é um pacote geral de machine learning

#primeiro criamos a partição de dados
partição_dist_normal <- createDataPartition(1:length(simulaçaonorm), p= .7)

treino_dist_normal <- simulaçaonorm[unlist(partição_dist_normal)] #foi criada uma partição para treinar os dados, usando a partição anteiror. O comando "unlist" é muito utilizado para tranformar uma lista em um vetor

teste_dist_normal <- simulaçaonorm[-unlist(partição_dist_normal)]





