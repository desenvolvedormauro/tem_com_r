# Centralizando uma base de dados

#  Centralização de uma base de dados

binomialnegSimulacao <- rnbinom(450, mu = 3, size = 10)

poissonSimulacao <- rpois(450, 3)

hist(binomialnegSimulacao)

hist(poissonSimulacao)

binomialnegSimulacao + poissonSimulacao # soma das distribuições

poissonSimulacao + 50 # soma 50 a cada elemento

# média
mean(poissonSimulacao)
mean(binomialnegSimulacao)

# mediana
median(poissonSimulacao)
median(binomialnegSimulacao)

# desvio padrão 
sd(poissonSimulacao)
sd(binomialnegSimulacao)

# variância
var(poissonSimulacao)
var(binomialnegSimulacao)
