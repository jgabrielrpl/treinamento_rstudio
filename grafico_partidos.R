# Pacotes Utilizados -----
###
library(tidyverse)

# Banco -----
###

library(readxl)
partidos <- read_excel("C:/Users/Larissa/Desktop/partidos.xlsx")

# Grafico -----
###


partido <- ggplot(partidos) +
  aes(x = reorder(Década, o), weight = `Número total de Partidos`) +
  geom_bar(fill = "#8E9094") +
  theme_bw() +
  #theme_minimal()+
  labs(x = "Década", y = "Número total de partidos políticos")


ggsave("partido.png", width = 20, height = 15, units = "cm")

