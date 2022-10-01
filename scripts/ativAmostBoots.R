# Atividade Amostragem e Bootstrapping
# A finalidade da utilização é para não inviesar o modelo quando se está usando amostras em parte da população
# Ou quando não se quer inviesar o modelo

# Amostragem sem reposição usando a função sample e o objeto distNormalTeste criado na atividade anterior
distNormalTeste <- rnorm(600) #Total de casos indicado

# Tamanho da amosta igual a 30. Neste caso não se quer reposição (repetição)
sample(distNormalTeste, 30, replace = FALSE)

# Tamanho da amosta igual a 30. Neste caso se quer reposição (repetição)
sample(distNormalTeste, 30, replace = TRUE)

# Utilizando a função raiz aleatória (semente aleatória). Bootstraping com a função replicate. Com reposição.
set.seed(450) # Agora não vamos mais utilizar como tarefa mas como função ponto a ponto.

# Replicando 10 vezes a amostra de tamanho 30, criando assim um bootstrapping
bootsDistNormal10 <- replicate(10, sample(distNormalTeste, 30, replace = TRUE))
bootsDistNormal10 # Verificando as amostras criadas

# Calculando uma estatística com bootstrapping (30 casos) # com reposição

# Calculando a média de 10 amostras de 30 casos
mediaBootsNormal10 <- replicate(10, mean(sample(distNormalTeste, 30, replace = TRUE)))

# Calculando a média de 50 amostras de 30 casos
mediaBootsNormal50 <- replicate(50, mean(sample(distNormalTeste, 30, replace = TRUE)))

# Calculando a média de 100 amostras de 30 casos
mediaBootsNormal100 <- replicate(100, mean(sample(distNormalTeste, 30, replace = TRUE)))

# Comparando a média das amostras
# Média do bootstraping 10
mean(mediaBootsNormal10)
# Média do bootstraping 50
mean(mediaBootsNormal50)
# Média do bootstraping 100
mean(mediaBootsNormal100)
# Média dos dados originais usados para teste
mean(distNormalTeste)

# Comparando os histogramas das amostras
# Dividindo o espaço de visualização de graficos em quatro áreas de gráficos
par(mfrow = c(2,2))
# Apresentando o histograma dos dados originais de teste
hist(distBinominalTeste, main = "Histograma Simulação Teste")
# Apresentando o histograma da Média de 10 amostras
hist(mediaBootsNormal10, main = "Histograma Média 10 Amostras")
# Apresentando o histograma da Média de 50 amostras
hist(mediaBootsNormal50, main = "Histograma Média 50 Amostras")
# Apresentando o histograma da Média de 100 amostras
hist(mediaBootsNormal100, main = "Histograma Média 100 Amostras")

# Criando partições de dados (tipo especifico de amostragem)
# Instalando o pacote caret
pacman::p_load(caret)
library(caret)

# Criando as partições de dados. Informando o tamanho do vetor e o parâmetro de divisão (80 x 20)
particaoDistNormal <- createDataPartition(1:length(distBinominalTeste), p=.8)

# Criando uma partição para treinar os dados, usando a partição anterior. Atenção: o comando unlist é muito utilizado para transformar uma lista em um vetor
treinoDistNormal <- distNormalTeste[unlist(particaoDistNormal)]

# Criando uma partição para testar os dados, usando a partição anterior. Utilizando o comando ( - ) unlist 
testeDistNormal <- distNormalTeste[- unlist(particaoDistNormal)]
