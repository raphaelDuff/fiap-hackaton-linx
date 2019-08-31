library(httr)
library(data.table)
library(dplyr)
library(utils)
library(tidyverse)


#setwd("C:/Users/duffzord/Documents/R-DEV/hackathon/fiap-hackathon/r-codes/dados_linx/")

list.files('dados_linx/')

df <- data.frame(
  encrypted_domain = as.character(),
  encrypted_cnpj = as.character(),
  encrypted_saleid = as.character(),
  dateTime = as.character(),
  productTotal = as.character(),
  prod_fullname = as.character(),
  encrypted_buyer_cpf = as.character(),
  encrypted_buyer_cnpj = as.character(),
  stringsAsFactors = FALSE
)

data_files <- list.files()

for (file in data_files) {
  df_interim <- fread(file)
  df <- rbind(df, df_interim)
  print(count)
  count <- count + 1
}

write.csv2(df, "linx_all_transactions.csv")
save(df, file = "linx_all_transactions.RData")
