# Atividade Testes de hipóteses

# Carregando os pacotes que serão utilizados
pacman::p_load(funModeling, tidyverse)
library(data.table)
library(funModeling)
library(tidyverse)

# Carregando dados do pacote mtcars existente na base nativa do R
mtcarsTesteHip <- mtcars

# list os dados do vetor mtcarsTesteHip
list(mtcarsTesteHip)

# Apresenta a estrutura dos dados
status(mtcarsTesteHip)

# Teste de correlação
# H0: variáveis são independentes / não têm associação. p-valor (p-value) > 0.05
# H1: variáveis são dependentes / há associação. p-valor (p-value) <= 0.05
cor.test(mtcarsTesteHip$mpg, mtcarsTesteHip$hp) # O resultado mostrou que há associação entre as variáveis. Aceitando-se a hipótese alternativa.

# Console - p-value = 1.788e-07, com valor muito inferior a zero.

# Teste qui quadrado para as variáveis categóricas motor e transmissão
chisq.test(mtcarsTesteHip$vs , mtcarsTesteHip$am)
# Resultado do console = p-value = 0.5555 acima de 0,05 não rejeita a hipótese nula. Aceita a hipótese nula e entende que não há associação entre as variáveis.

# Verificação se a distribuição dos parâmetros de pesos do veículos formam uma distribuição normal através a função shapiro.test
shapiro.test(mtcarsTesteHip$wt) # O resultado do console apresentou p-value = 0.09265. Superior a 0.05.

# Verificação do histograma do gráfico da variável pesos dos veículos
hist(mtcarsTesteHip$wt)

# Apresenta a correlação entre as variáveis da base de dados nativa mtcars
cor(mtcars)

# Apresenta o gráfico de dispersão pareado das variáveis da base nativa mtcars
pairs(mtcars)
