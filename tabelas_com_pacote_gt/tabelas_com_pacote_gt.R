# Pacotes Utilizados -----
###

library(gt)
library(tidyverse)
library(glue)
library(car)

# Bibliografia -----
###

# https://gt.rstudio.com/
# https://www.youtube.com/watch?v=h1KAjSfSbmk&ab_channel=RStudio  / Parei nos 5 minutos.
#


# Objetivo: transformar um banco de dados (data.frame) em uma tabela com o pacote GT -----
###
## O ponto e nao precisar mais fazer tabelas no Excell

# Baixar o pacote Gt -----
###
install.packages('gt')
library('gt')

# Por para rodar o banco de Cars  -----
###
## Neste banco de dados que serão construidos os exemplos 

carro <- gtcars

# PRIMEIRO:  Forma simples de tranformar um banco de dados em tabela  -----
###

tabela_carro <- carro %>% gt ()
tabela_carro # Agora o banco está em formato de tabela 
tabela_carro # Agora da para vivualisa-lo como tabela 

# Como Salvar a tabela   ----- 
###

# A tabela é salva pela função: gtsave()
# Funcao que funciona como ggsave
# Estrutura do gtsave: gtsave(data - o objeto que voce criou, filename - O nome do arquivo, path = NULL - opcao de por o caminho)
# Informações detalahdas: https://gt.rstudio.com/reference/gtsave.html


# Exemplo com a tabela carro (linha 35)

tabela_carro %>% gtsave("tabela_carro_salva.png")


# Estrutura   ----- 
###

##  Hearder (Titulo) 
# Sobre esse assunto existe duas funções:

tab_header(
  title =   ,
  subtitle = )

##  Hearder (Titulo) 
# Sobre esse assunto existe duas funções:

## tabel body (As variáveis)
## Sobre esse assunto existe ao menos, tres possibilidades 

# Para datas

fmt_date(
  columns = date,
  date_style = 3)

# Para cedulas sobre valores financeiros 

  fmt_currency(
    columns = c(open, high, low, close),
    currency = "USD")
    
# Para cedulas sobre que são valores 
  
  fmt_number(
    columns = volume,
    suffixing = TRUE)

  
# Curso de como fazer a tabela
# https://rstudio.cloud/project/779965

