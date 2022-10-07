# Atividade Objetos e Funções no R

vetor <- c(2,4,6,8, 10, 12, 14, 16) # criação de um vetor

# Verificação da estrutura do vetor
str(vetor)

regCarros <- lm(mpg ~ ., mtcars) #criação de um modelo de regressão

# Visualiza o sumário do modelo de regressão
summary(regCarros)

# apresentação da complexidade do objeto - criado no modelo de regressão
str(regCarros) 

# Visualiza a base de dados do modelo
View(regCarros)

# Regressão crimes violentos na base USArrests. Criando inicialmente um objeto a partir da base de dados USArrests.
regUSArrests <- lm(Assault ~ ., data = USArrests) # Estimando a regressão.

# Realizando um detalhamento mais preciso da regressão através do sumário
summary(regUSArrests)

# Verificando a estrutura do modelo de regressão
str(regUSArrests)

# visualizando o objeto de regressão
View(regUSArrests)

# Visualizando o gráfico do objeto criado
plot(regUSArrests)
