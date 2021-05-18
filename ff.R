install.packages("ffbase")

library(ff)
library(ffbase)

enderecoBase <- 'C:/Users/uliss_000/Documents/analise_de_dados/bases_originais/analise_de_dados_2/largeData.csv'

system.time(extracaoLD4 <- read.csv.ffdf(file=enderecoBase)
            
head(extracaoLD4)                                         

median(extracaoLD4[, 7])

mean(extracaoLD4[, 7])
