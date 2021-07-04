
#1. Extraia a base geral de covid em Pernambuco disponível neste endereço: https://dados.seplag.pe.gov.br/apps/corona_dados.html

dados <- read.csv2("https://dados.seplag.pe.gov.br/apps/basegeral.csv", header=T, na.strings=c("","NA"))


#2. Corrija os NAs da coluna sintomas através de imputação randômica 

library(Hmisc)

(dados$sintomas <- impute(dados$sintomas, "random")) # fazemos a imputação aleatória


#3. Calcule, para cada município do Estado, o total de casos confirmados e negativos

library(dplyr)

dados_municipio <- dados %>% group_by(municipio) %>% count(classe)


#4. Crie uma variável binária se o sintoma inclui tosse ou não e calcule quantos casos confirmados e negativos tiveram tosse como sintoma

dados <- dados %>% mutate(Tosse = ifelse(grepl(paste(pattern = "TOSSE", collapse="|"), sintomas), 'Sim', 'Não'))

covid_tosse <- dados %>% group_by(classe) %>% count(Tosse)


#5. Agrupe os dados para o Estado, estime a média móvel de 7 dias de confirmados e negativos

dados$dt_notificacao <- as.Date(dados$dt_notificacao, format = "%Y-%m-%d")#transformar a variável em data

dados_pe <- dados[grep("CONFIRMADO",dados$classe), ] #filtrar os casos confirmados

dados_pe <-dados_pe %>% group_by(dt_notificacao) %>% count(classe) #agrupar por data

casospordia <- as.numeric(dados_pe$n)  

covid <- data.frame(dados_pe$dt_notificacao, casospordia)

# A função de média móvel não estava reconhecendo a coluna de casos diários. 
# Tive que criar um novo dataframe unindo uma variável de casos por dia, aplicando a 
# função as.numeric, só assim consegui.
                        
library(zoo)

covid <- covid %>% mutate(casos_MM7 = round(rollmean(x = casospordia, 7, align = "right", fill = NA), 2))

covid <- covid %>% mutate(casosL7 = dplyr::lag(casospordia, 7)) # valor defasado em 7 dias

library(ggplot2)
ggplot(covid, aes(x =dados_pe.dt_notificacao)) + 
  geom_line(aes(y = casospordia, colour = "Casos diários"), size = 0.1) +
  geom_line(aes(y = casos_MM7, colour = "Média Móvel"), size = 1) 
   

