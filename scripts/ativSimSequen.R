# Atividade Simulações e Sequências

# Seta uma semente aleatória de geração de dados
# Usando a função addTaskCallback deixamos a set.seed fixa, rodando no back

# atribui a tarefa à variável tarefaSemente
tarefaSemente <- addTaskCallback(function(...) {set.seed(123);TRUE})

# chama a tarefaSemente
tarefaSemente 

# Distribuição normal simulada # usa a função rnorm para criar uma distribuição normal, indicando o total de casos
distNormalTeste <- rnorm(600) 

# Sumário da distNormalTeste
summary(distNormalTeste)

# Distribuição binomial simulada # rbinom para criar distribuição binominal, indicando casos, tamanho e probabilidade
distBinominalTeste <- rbinom(600, 1, 0.8)

# Sumário da distBinomialTeste
summary(distBinominalTeste) 

# Visualiza 
view(distBinominalTeste)

# Funções de sequências
indexTeste <- seq(1, length(distNormalTeste)) # vetor com índex dos dados, usando a função length para pegar o total de casos
indexTeste2 <- seq(1 : 600)

# Para encerrar, podemos usar a função removeTaskCallback para remover a tarefa que criamos lá em cima
removeTaskCallback(tarefaSemente)

