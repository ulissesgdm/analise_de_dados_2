tarefaSemente <- addTaskCallback(function(...) {set.seed(123);TRUE}) 
tarefaSemente

library(dplyr)

dist_normal_1 <- rnorm(600,1)

dist_normal_2 <- rnorm(600, 2)

dist_poisson <- rpois(600, 3)

dist_bi_neg <- rnbinom(600, mu=3, size=10)

dist_bi <- rbinom(100, 3, 0.1)

dist_quali <- factor(dist_bi, label = c("ferrari", "mercedes"), levels= c(0,1))

dist_index <- seq(1, length(dist_normal_1))



               