library(data.table)

acidentes_2020 <- read.csv2("http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv")

# tendência central
library(Hmisc) # biblio que facilita imputação de tendência central
acidentes_2020$auto <- impute(acidentes_2020$auto, fun = mean) # média
acidentes_2020$auto <- impute(acidentes_2020$auto, fun = median) # mediana

is.imputed(acidentes_2020$auto) # teste se o valor foi imputado
table(is.imputed(acidentes_2020$auto)) # tabela de imputação por sim / não

# predição
(acidentesNASeed <- round(runif(30, 1, 6))) # criamos 10 valores aleatórios

acidentes_2020$auto[acidentesNASeed] <- NA # recolocamos os NA

acidentes <- lm(auto ~ ., data = acidentes_2020) # criamos a regressão (Não consegui criar a regressão "Error in `contrasts<-`(`*tmp*`, value = contr.funs[1 + isOF[nn]]) : contrastes podem ser aplicados apenas a fatores com 2 ou mais níveis")
acindentesindex <- is.na(acidentes_2020$auto) # localizamos os NA
acidentes_2020$auto[acidentesindex] <- predict(acidentes, newdata = acidentes_2020[acidentesindex, ]) # imputamos os valores preditos

## Hot deck
# imputação aleatória
acidentes_2020$auto[acidentesNASeed] <- NA # recolocamos os NA

(acidentes_2020$auto <- impute(acidentes_2020$auto, "random")) # fazemos a imputação aleatória

# imputação por instâncias
acidentes_2020$auto[acidentesNASeed] <- NA # recolocamos os NA

install.packages('VIM')
library(VIM)
acidentes2 <- kNN(acidentes_2020)
