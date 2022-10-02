# Atividade Descoberta de Dados - Utilizando a Análise Eploratória de Dados para conhecê_los

# Instalando os pacotes funModeling e tidyverse que permitem formas automáticas e/ou simplificadas para o processo
pacman::p_load(funModeling, tidyverse)
library(funModeling)
library(tidyverse)

# Serão utilizados nesta atividade os dados do pacote nativo mtcars - conjunto de dados da revista motor trend de 1974
help("mtcars")

# Realizando a análise exploratória dos dados a fim de identificar o padrão e o perfil deles

# Olhada nos dados, verificando a caracterização, padrão, etc.
glimpse(mtcars)

# Verificando a estrutura dos dados (missing, etc)
status(mtcars)

# Verificando a frequência das variáveis e dos fator. Nesta base de dados, porém, não existem varáveis fatores.
freq(mtcars)

# Explorando as variáveis numéricas
plot_num(mtcars)

# Verificando a estatística das variáveis numéricas, média, desvio padrão, coeficientes, curtose, valores interquartis, etc.
profiling_num(mtcars)


