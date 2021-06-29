
vacinaBR <- read.csv('https://github.com/owid/covid-19-data/raw/master/public/data/vaccinations/country_data/Brazil.csv')

str(vacinaBR)

vacinaBR$date <- as.Date(vacinaBR$date, format = "%Y-%m-%d")

vacinaBR$dia <- seq(1:length(vacinaBR$date))

library(zoo) 
library(dplyr)

vacina_media <- vacinaBR %>% mutate(vacinados_1dose_MM7 = round(rollmean(x = people_vaccinated, 7, align = "right", fill = NA), 2))

vacina_media <- vacina_media %>% mutate(vacinados_1dose_L7 = dplyr::lag(people_vaccinated, 7)) # valor defasado em 7 dias

install.packages('xts')
library(xts)

(vacinaTS <- xts(vacina_media$people_vaccinated, vacina_media$date)) 
str(vacinaTS)


