library(dplyr)
install.packages('pdftools')
library(pdftools)
install.packages('textreadr')
library(textreadr)
library(tidyverse)


documento <- read_pdf('C:/Users/uliss_000/Documents/analise_de_dados/bases_originais/analise_de_dados_2/datas.pdf')

( datas <- str_extract_all(documento$all_text, "\\d{2}/\\d{2}/\\d{4}") )

documento2 <-str_replace_all(string = documento, pattern = "/", replacement = "-")


( datas2 <- str_extract_all(documento2, "\\d{2}-\\d{2}-\\d{4}") )
