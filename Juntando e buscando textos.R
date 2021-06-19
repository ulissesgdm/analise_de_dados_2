install.packages('fuzzyjoin')
library(fuzzyjoin)

Clubes <- c('Santa Cruz Futebol_Clube', 'Sport C. do R.', 'C. Náutico Capibaribe', 'E. C. Vitória', 
            'América-MG F. C.', 'Central S. C.')
Estádios <- c('Arruda', 'Ilha do Retiro', 'Aflitos', 'Barradão', 'Independência', 'Lacerdão')
Cidade <- c('Recife', 'Recife', 'Recife', 'Salvador', 'Belo Horizonte', 'Caruaru')

Estádios_particulares <- data.frame(Clubes, Estádios, Cidade)

Clubes <- c('Clube Náutico Capibaribe', 'Espote Clube Vitória',
                         'Santa Cruz Futebol Clube', 'Sport Clube do Recife',
                         'Central Sport Clube', 'América Futebol Clube')

Capacidade_Estádio <- c(15000, 25000, 55000, 35000, 20000, 30000)

Clubes_Capacidade <- data.frame(Clubes, Capacidade_Estádio)

#Unir as bases de dados através dos nomes dos clubes
Dados_Unidos <- fuzzyjoin::stringdist_join(Estádios_particulares, Clubes_Capacidade, mode='left')
Dados_Unidos2 <- fuzzyjoin::distance_join(Estádios_particulares, Clubes_Capacidade , mode='left')

#Ele não idententificou os nomes dos clubes entre as variáveis com os nomes completos
# e os nomes simplificados. Apenas diferenças mais simples, como 'Futbeol_Clube'
# foram identificadas pelo fuzzyjoin.

library(dplyr)
library(tidyr)

Clubes <- c('Santa Cruz Futebol_Clube', 'Sport C. do R.', 'C. Náutico Capibaribe', 'E. C. Vitória', 
            'América-MG F. C.', 'Central S. C.')
Estádios <- c('Arruda', 'Ilha do Retiro', 'Aflitos', 'Barradão', 'Independência', 'Lacerdão')
Cidade <- c('Recife', 'Recife', 'Recife', 'Salvador', 'Belo Horizonte', 'Caruaru')

Estádios_particulares <- data.frame(Clubes, Estádios, Cidade)


Clubes_Pernambuco <- c('Santa Cruz Futebol_Clube', 'Sport C. do R.', 'C. Náutico Capibaribe', 'Central S. C.')

EstádioPE <- Estádios_particulares %>% 
  mutate(tag_estado = ifelse(grepl(paste(Clubes_Pernambuco, collapse="|"), Clubes), 'Pernambuco', 'Resto do Brasil'))













