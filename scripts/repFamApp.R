# Atividade Funçoes de Repetição - Família Apply

# Informações sobre a base de dados nativa do R - mtcars extraída da revista Motor Trend US de 1974
help("mtcars")

# Estrutura da base de dados nativa do R mtcars
str(mtcars)

# Classe da base de dados nativa do R mtcars
class(mtcars)

# Apresenta os dados existentes na base de dados nativa do R mtcars extraída da revista Motor Trend US de 1974
list(mtcars)

# Apresenta a complexidade da base de dados nativa do R mtcars
str(mtcars)

# Apresenta a soma das colunas da base de dados mtcars
apply( mtcars , 2, sum)

# Apresenta a média das colunas da base de dados mtcars
apply(mtcars, 2, mean)

# Apresenta a média das colunas da base de dados mtcar
lapply( mtcars ,  mean)

# Seleciona os dados da segunda linha do veículo Mazda Rx4 Wag
lapply(mtcars, "[", 2)

# Apresenta o resumo estatístico da base de dados mtcar
summary(mtcars)

# apresenta o histograma da base mtcar das variáveis de 3 a 7
sapply( mtcars [ , 3:7] , hist)


