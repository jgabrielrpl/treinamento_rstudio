# Pacotes Utilizados -----
###

library(gt)
library(tidyverse)
library(glue)
library(car)

# Bibliografia -----
###

# https://gt.rstudio.com/
# https://rstudio.cloud/project/779965
# https://www.youtube.com/watch?v=h1KAjSfSbmk&ab_channel=RStudio
# https://www.youtube.com/watch?v=aPRVzk9pvno&ab_channel=RStudio
# E os PDFs que estao na outra pagina

# Baixar o pacote Gt -----
###
install.packages('gt')
library('gt')

# Por para rodar o banco de Cars  -----
###

# Neste banco de dados que serao construidos os exemplos 

carro <- gtcars

# Ferramentas   ----- 
###

#  O GT tranforma o banco em uma tabela ----- 
### A.1

ex_1 <- carro %>% select(mfr, model, year) %>% gt()
ex_1 # Banco ja tranformado em tabela 

# A funcao: "groupname_col"   ----- 
### A.1

# A funcao: "groupname_col" transforma uma variavel base como um grupo para sair 
# na tabela. Pergunta a ser respondida: Quero saber os carros lançados por cada
# marca:
# A.1

ex_2 <- carro %>% select(mfr, model, year) %>% gt(groupname_col = "mfr")
ex_2

# A funcao: "tab_header" tem o objetivo de por o titulo e o subtitulo    ----- 
### A.1

# Seguindo com o mesmo exemplo, depois de sabermos os carros lançados por cada
# marca, agora por um enunciado nesta tabela:
# A.1

ex_3 <- carro %>% select(mfr, model, year) %>% 
                  gt(groupname_col = "mfr") %>% 
                  tab_header(title = "Table Title" ) # Titulo

ex_3
ex_3.1 <- carro %>% select(mfr, model, year) %>% 
  gt(groupname_col = "mfr") %>% 
  tab_header(title = "Table Title", subtitle = "Subtitulo" ) # Titulo e Subtitulo

# Pondo em negrito o enunciado do titulo. Para rodar e necesssario por o codigo dentro do "md"
ex_3.2 <- carro %>% select(mfr, model, year) %>% 
  gt(groupname_col = "mfr") %>% 
  tab_header(title = md ("**Tabela 1.** Table Title"), subtitle = md("Subtitulo") ) # Titulo e Subtitulo

ex_3.2

# Perguntas a serem respondidas sobre o título: Como desloca-lo para direita ou
# para a esquerda?
# A.1

# Funcao para por a fonte: tab_source_note   ----- 
### A.1

ex_4 <- carro %>% select(mfr, model, year) %>% 
  gt(groupname_col = "mfr") %>% 
  tab_header(title = md ("**Tabela 1.** Table Title")) %>% 
  tab_source_note(source_note = md("**Fonte:** Pacote Cars")) # Com este comendo colocamos a fonte dos dados na tabela. Como tambem o negrito na fonte.

ex_4


# Como Salvar a tabela   ----- 
### A.1

# A tabela é salva pela função: gtsave()
# Funcao que funciona como ggsave
# Estrutura do gtsave: gtsave(data - o objeto que voce criou, filename - O nome do arquivo, path = NULL - opcao de por o caminho)
# Informações detalahdas: https://gt.rstudio.com/reference/gtsave.html

ex_4 %>% gtsave("ex_4.png")

# Descricao das variaveis:"tab_spanner"  ----- 
### A.2

# Informaçoes que resumem as informações infoarmada sobre o assunto: "tab_spanner" 
# Fazer uma tabela com as caractersiticas do carro que estao no banco:
# de forma a destacar a sua origem, tipo, ano e marca
# Na linha estara o modelo, nnas colunas as informacoes, enquanto que que no 
# "tab_spanner" uma informacao que resume a variável

ex_5 <- carro %>% gt (rowname_col = "model") %>% # Indicacao da variavel da linha 
  tab_spanner(label = "Descricao dos carros", # Descricao agrupamento 1 
              columns = vars( year, bdy_style , ctry_origin, mfr)) %>% # Descricao agrupamento 1 
  tab_header(title = md ("**Tabela 1.** Caracteristicas do carros ")) %>% # Título
  tab_source_note(source_note = md("**Fonte:** Pacote Cars")) # Com este comendo colocamos a fonte dos dados na tabela. Como tambem o negrito na fonte.

# OBS: Se eu nao por "rowname_col = "model"" a linha sera formada pela primeira 
# variavel do banco. Porem, se essa variavel estiver dentro do tab_spanner a segunda
# variavel que sera a primeira linha
# O exemplo a seguir nao tem a "rowname_col" dai o nome da coluna aparece.
# O exemplo a seguir porssui a descricao de dois agrupamentos

ex_6 <- carro %>% gt () %>% 
  tab_spanner(label = "Descricao dos carros", # Descricao agrupamento 1
              columns = vars( year, bdy_style , ctry_origin, mfr, trim)) %>% # Descricao agrupamento 1 
  tab_spanner(label = "Performace dos carros", # Descricao agrupamento 2
              columns = vars(hp,hp_rpm,trq,trq_rpm,mpg_c,mpg_h,drivetrain,trsmn,msrp)) %>% # Descricao agrupamento 2
    tab_header(title = md ("**Tabela 1.** Caracteristicas do carros ")) %>% # Título
  tab_source_note(source_note = md("**Fonte:** Pacote Cars")) # Com este comendo colocamos a fonte dos dados na tabela. Como tambem o negrito na fonte.

ex_6                   


############################## Por quando chegar a hora 
###
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


# Perguntas a serem respondidas   ----- 
###

# Perguntas a serem respondidas sobre o título: Como desloca-lo para direita ou
# para a esquerda? Tentar ver da oformaque muda no ggplot

# Como mudo o tamanho da fonte das letras na tabela?

# Como que eu separado a lina do titulo para por em negrito das demais linhas da tabela?

# Como fazer notas de roda pe?


