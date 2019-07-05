
# Instala as bibliotecas necessárias para a atividade caso não estejam instaladas
if (!all(c("tidyverse", "httr", "jsonlite") %in% installed.packages()))
  install.packages(c("tidyverse", "httr", "jsonlite"))

# Carrega as bibliotecas no script
library(tidyverse)
library(jsonlite)
library(httr)

# Url da API Post Rows
api <- "https://api.powerbi.com/beta/5154b1dd-30a1-4982-a26c-2c9893387316/datasets/a3c2290a-bdc2-4509-a6e5-a1b2516d97e0/rows?key=VWuwKnnStdG%2FdO0Fz8aZIRZSowf%2BqSweUlogi93YdbXM1qDsNvDhCm%2BCEWsBBOiBN5NYHBwTUcEVZxH0JGTuow%3D%3D"


while (TRUE) {
  # Cria uma linha de informação para push
  linha <- data.frame(tempo = format(Sys.time(), "%Y-%m-%dT%H:%M:%OS3Z"), 
                      aparelho = paste0("aparelho ", sample(1:3, 1)),
                      valor = sample(8:40, 1))
  
  # serializa no formato JSON para o request de push no Power BI
  reqs <- toJSON(linha)
  
  # Executa ação POST ROWs no dataset da API e printa os resultados
  acao <- POST(api, encode = "json", body = reqs)
  print(reqs)
  
  # Aguarda 1/3 de segundo e tenta novamente
  Sys.sleep(.3)
}




