# Atividade estatística descritiva básica no R

# Apresenta a estrutura da base de dados nativa (data frame) do R USArrests.
str(USArrests) # Taxa de crimes violentos nos USA para cada 100.000 habitantes em 1973.

# Visualiza a base de dados nativa do R USArrests.
View(USArrests)

# Tabela de frequência absoluta da variável de assaltos da base nativa USArrests
table(USArrests$Assault)

# Tabela de frequência relativa da variável mortes da base de dados USArrests
prop.table(table(USArrests$Murder))

# Média da variável população urbana para cada 100.000 habitantes
mean(USArrests$UrbanPop)

# Mediana da variável população urbana para cada 100.000 habitantes
median(USArrests$UrbanPop)

# Variância da variável estupro
var(USArrests$Rape)

# Desvio padrão da variável estupro
sd(USArrests$Rape)

# Separatrizes da variável estupro
quantile(USArrests$Rape, probs = 0.75) # Quartil - pega a separatriz dos dados 25% maiores.
quantile(USArrests$Rape, probs = 0.10) # Decil - pega a separatriz dos dados 90% maiores.
quantile(USArrests$Rape, probs = 0.95) # Percentil - pega a separatriz dos dados 5% maiores.

# Gráfico resumindo as separatrizes
boxplot(USArrests$Rape)

# Listando os valores da base de dados da variável estupro
list(USArrests$Rape)

# Apresenta o valor mínimo da variável estupro
min(USArrests$Rape)

# Apresenta o valor máximo da variável estupro
max(USArrests$Rape)

# Apresenta os quartis da variável estupro
quantile(USArrests$Rape)

# Apresenta o sumário descritivo básico das variáveis da base de dados nativa
summary(USArrests)

# Instalando o pacote fBasics para obter um sumário mais completo
pacman::p_load(fBasics)
library(fBasics)

# Apresentando um sumário descritivo completo das variáveis usando o pacote fBasics (Estatísticas básicas apenas para variáveis numéricas. No exemplo selecionamos as variáveis morte e estupro)
basicStats(USArrests[ , c(1, 4)])


