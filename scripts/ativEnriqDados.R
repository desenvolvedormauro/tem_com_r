# Enriquecimento de dados

# Carregando pacotes que serão utilizados
library(tidyverse)
library(dplyr)

# Criando um data frame com RG, Nome e Matrícula

rgc <- c("01234567", "12345678", "23456789", "34567890")
nome <- c("Maria", "Jose", "Sara", "Joao")
idade <- c(27, 30, 45, 55)

cidadaos1 <- data.frame(rgc, nome, idade)
view(cidadaos1)

# Criando um data frame RG, Cidade e Bairro

cidade <- c("Cabo", "Ipojuca", "Igarassu", "Itapissuma")
bairros <- c("Calhetas", "Cupe", "Centro", "Boavista")

cidadaos2 <- data.frame(rgc, cidade, bairros)
view(cidadaos2)

# Criando um novo data frame juntando os dois anteriores através da função left_join (junção à esquerda)
cidadaos <- left_join(cidadaos1, cidadaos2, by= "rgc")

# Visualizando o novo data frame criado com o nome de cidadaos
view(cidadaos)

