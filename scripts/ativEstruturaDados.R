# Atividade de estruturação de dados num formato desejado 

#Instalando o pacote data.table
pacman::p_load(data.table)

# Carregando pacotes que serão utilizados
library(data.table)
library(dplyr)
library(tidyverse)

# Carrega dados da covid no mundo
general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # Carrega a base de dados de covid19 no mundo

# Cria um vetor com dados de países da América Central
central_america_countries <- c("Belize", "Costa Rica", "El Salvador", "Guatemala", "Honduras", "Nicaragua", "Panama")

# Filtra apenas países definidos para o vetor América Central
central_america <- general_data %>% filter(location %in% central_america_countries)

# Cria uma nova matriz dos países, agrupando por local, criando uma nova linha com index e selecionado algumas variáveis definidas, como o países, novos casos e uma variável de interesse 
camerica <- central_america %>% group_by(location) %>% mutate(row=row_number()) %>% select(location, new_cases, row)

# Cria uma variável de resultado que seleciona o maior número possível, agrupando a tabela por localização e maior data. Faz um filtro para pegar o menor dos maiores casos.
result <- camerica %>% group_by(location) %>% filter(row == max(row))
camerica <- camerica %>% filter(row<=min(result$row))

# Visualiza o data frame
view(camerica)

# Pivota o data frame (Passa as variáveis da tabela) da linha para a coluna. Os nomes das linhas são removidos transformando-se a partir da coluna com o nome do país.
camericaw <- camerica %>% pivot_wider(names_from = row, values_from = new_cases) %>% remove_rownames %>% column_to_rownames(var = "location")

# Visualiza
view(camericaw)


