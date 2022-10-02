# Atividade validação de dados

# Instalando os pacotes necessários
pacman::p_load(data.table, dplyr, tidyverse, validate)
library(data.table)
library(dplyr)
library(tidyverse)
library(validate)

# Carrega dados da covid no mundo
general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # Carrega a base de dados de covid19 no mundo

# Cria um vetor com dados de países da América Central
central_america_countries <- c("Belize", "Costa Rica", "El Salvador", "Guatemala", "Honduras", "Nicaragua", "Panama")

# Filtra apenas países definidos para o vetor América Central
central_america <- general_data %>% filter(location %in% central_america_countries)

# Seleciona apenas as variáveis location, new_cases e new_deaths
central_america <- central_america %>% select(location, new_cases, new_deaths)

# Criação do validador (não admite novos casos negativos e nem novas mortes negativas)
regras_central_america <- validator(new_cases >=0, new_deaths >=0)

# Validação com uma função de confronto comparando a base de dados com as regras criadas
validacao_central_america <- confront(central_america,regras_central_america)

# Chamando o objeto (que é uma lista)
list(validacao_central_america)

# Apresentando o sumário dos dados
summary(validacao_central_america)

# Fazendo um gráfico dos dados (verificando missing e falhas através do gráfico)
plot(validacao_central_america)
