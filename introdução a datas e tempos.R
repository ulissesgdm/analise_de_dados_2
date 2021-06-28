
#Criação da base de dados
data <- c('2020-09-10 12:00', '2015-11-08 13:00', '2011-01-04 09:00', 
          '2000-02-09 22:00', '2011-05-10 10:00')


(str(data1 <- as.Date(c(data)) ) )

#formato original (segundos)
(str(data2 <- as.POSIXct(c(data)) ) )
unclass(data2)

#formato original (componentes de tempo)
(str(data3 <- as.POSIXlt(c(data)) ) )
unclass(data2)

#Extrações
install.packages('lubridate')

library(lubridate)

year(data3)

month(data3)

isoweek(data3) # semana ISO 8601





