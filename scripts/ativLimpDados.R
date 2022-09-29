# Atividade de limpeza de dados

#Instalando o pacote funModeling
pacman::p_load(funModeling)

# Carregando pacotes que serão utilizados
library(funModeling)
library(data.table)
library(dplyr)
library(tidyverse)

# Carrega dados da covid no mundo
general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # Carrega a base de dados de covid19 no mundo

# Cria um vetor com dados de países da América Central
central_america_countries <- c("Belize", "Costa Rica", "El Salvador", "Guatemala", "Honduras", "Nicaragua", "Panama")

# Filtra apenas países definidos para o vetor América Central
central_america <- general_data %>% filter(location %in% central_america_countries)

# Seleciona apenas as variáveis location, new_cases e new_deaths
central_america <- central_america %>% select(location, new_cases, new_deaths)

# situação do casos, frequência dos casos, gráfico dos casos, perfil dos números
status(central_america) # Estrutura dos dados
freq(central_america) # Frequência das variáveis fator
plot_num(central_america) # Exploração das variáveis numéricas
profiling_num(central_america) # Estatística das variáveis numéricas

# Processo de limpeza para verificar se existe alguma imputação errada. Verificação através de um filtro de novos casos para ver se existem casos negativos.
central_america %>% filter(new_cases < 0)

# A base selecionada não identificou novos casos negativos. Todavia, caso tivesse ocorrido, para corrigir a solução seria:
central_america <- central_america %>% filter(new_cases>=0)

# Visualização dos dados demonstrou NA
view(central_america)

# Remoção dos NA (not available) utilizando a função na.omit
central_america_na <- na.omit(central_america)

# Visualização do novo vetor sem dados NA
view(central_america_na)

