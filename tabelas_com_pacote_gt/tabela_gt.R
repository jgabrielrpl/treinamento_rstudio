###
##
# ---- Livraria utilizada 

library(gt)
library(tidyverse)

###
##
# ----

tabela_gt <- read.csv("C:/Users/Larissa/treinamento_rstudio/tabelas_com_pacote_gt/tabela_gt.csv", sep=";") %>% 
             rename( `Variaveis Independentes`= Variaveis.Independentes)

tabela_gt._com_especial <- read.csv("C:/Users/Larissa/treinamento_rstudio/tabelas_com_pacote_gt/tabela_gt _com_especial.csv", sep=";")%>% 
  rename( `Variaveis Independentes`= Variáveis.Independentes)

y <- tabela_gt._com_especial %>%  gt(rowname_col = "`Variaveis Independentes`", groupname_col = "Dimensão") %>%
  opt_table_outline() %>% # Modificacao linhas  aula 9
  opt_table_font(font = "Serif") %>%  # mudar fonte 
  opt_all_caps() %>% # Por as variaveis indicativas em negrito e maiusculas aula 9 
  tab_style(locations = cells_column_labels(columns = everything()),
            style = list(cell_borders(sides = "bottom", weight = px(1)))) # por a linha em negrito
        # Para centralizar/cols_align(align = "center", columns = `Variaveis Independentes`) 
  
y %>% gtsave("y.png") # Salvar 

###
##
# ----


###
##
# ----