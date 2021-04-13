
tarefasemente <- addTaskCallback(function(...) {set.seed(123); TRUE}) #seta a semente aleatória de geração de dados

simulaçaonorm <- rnorm(100) #distribuição normal
summary(simulaçaonorm)

simulaçaobinomial <- rbinom(100, 1, 0.7) #é muito últil para machine learning (distribuição binomial)

classessimulação <- c(rep("jovem", length(simulaçaobinomial)/2), rep("jovem adulto", length(simulaçaobinomial)/2))

indexsimulação <- seq(1, length(simulaçaonorm))

removeTaskCallback(tarefasemente)