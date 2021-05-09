vacinacao_covid <- read.csv2('http://dados.recife.pe.gov.br/dataset/72c94f87-1fcd-4145-9016-31dff794688a/resource/dbf660d2-1ee5-451a-94ca-7c316e50d0ad/download/locaisvacinacovid.csv', sep = ';', encoding = 'UTF-8')

vacinacao_covid <- vacinacao_covid[-4,]

vacinacao_covid_novo <- read.csv2('http://dados.recife.pe.gov.br/dataset/72c94f87-1fcd-4145-9016-31dff794688a/resource/dbf660d2-1ee5-451a-94ca-7c316e50d0ad/download/locaisvacinacovid.csv', sep = ';', encoding = 'UTF-8')

vacinacao_covid_incremento <- (!vacinacao_covid_novo$Local %in% vacinacao_covid$Local)

vacinacao_covid$chaveSubstituta = apply(vacinacao_covid[, c(1,2,3,5)], MARGIN = 1, FUN = function(i) paste(i, collapse = ""))

vacinacao_covid_novo$chaveSubstituta = apply(vacinacao_covid_novo[, c(1,2,3,5)], MARGIN = 1, FUN = function(i) paste(i, collapse = ""))

setdiff(vacinacao_covid_novo, vacinacao_covid)
