# Atividade Qui-quadrado - Variáveis categóricas

# Carregando os pacotes que serão utilizados
pacman::p_load(data.table, ggplot2)
library(data.table)
library(ggplot2)

# Carregando base de dados cancer de mama
cancer_mama <- fread('bases_tratadas/cancer_mama.csv' , stringsAsFactors = T)

# Tabela de contingência
tabela_cancer_mama <- table(cancer_mama$idade, cancer_mama$tumor_tamanho)
tabela_cancer_mama

# Gráficos de dispersão pareados das variáveis
ggplot(cancer_mama) + aes(x = tumor_tamanho, fill = idade) + geom_bar(position = "fill")

# Teste Qui Quadrado
test_carcer_mama <- chisq.test(tabela_cancer_mama)
test_carcer_mama # O p-value = 0.4368 foi muito acima de 5% então não rejeita a hipótese nula. Não há associação entre as variáveis.

# Observando e recuperando os valores da base de dados
test_carcer_mama$observed # Equivale a tabela de contingência já vista

# Frequência esperada
test_carcer_mama$expected

# Plotando a correlação entre os resíduos - Corrplot das variáveis
corrplot(test_carcer_mama$residuals, is.corr = FALSE)
# O gráfico vai permitir observar associações mais fortes, positivas e negativas.
