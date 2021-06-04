library(data.table)
library(dplyr)

ESEB2018 <- read_sav("https://github.com/ulissesgdm/Analise-de-dados/raw/master/ESEB2018.sav")

esebdt <- ESEB2018 %>% mutate(Q12P2_B = as_factor(Q12P2_B)) %>% setDT()

esebdt[ , lm(formula = D1A_ID ~ Q12P2_B)]

#Regressão com a variável idade e voto no segundo turno das eleições de 2018. 