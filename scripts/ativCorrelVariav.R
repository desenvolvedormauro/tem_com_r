# Atividade Correlação - Variáveis numéricas

# Carregando os pacotes (bibliotecas) que serão utilizados (as)
pacman::p_load(corrplot, dplyr, ggplot2)
library(corrplot)
library(dplyr)
library(ggplot2)

# Carregando dados do pacote mtcars existente na base nativa do R e utilizando o mesmo dataframe do exercício anterior
mtcarsTesteHip <- mtcars

# Analisando a estrutura de dados do vetor mtcarsTesteHip. São dados numéricos. Então é possível utilizar a função cor.
str(mtcarsTesteHip)

# Apresenta a tabela de correlação com todas as variáveis. Ou seja, verificando se os valores mudam juntos e qual o comportamento e a relação entre eles.
cor(mtcarsTesteHip) # Na diagonal fica a correlação da variável com ela mesma. 

# Apresentando o plot dos gráficos de dispersão pareados das variáveis.
pairs(mtcarsTesteHip)

# Apresentado o correlograma das variáveis - corrplot. Apresenta gráficos de correlações entre variáveis noutro padrão.
# É necessário inicialmente atribuir a tabela a um objeto.
mtcarsTesteCor <- cor(mtcarsTesteHip)

#Utilizando a função Corrplot
corrplot(mtcarsTesteCor, method = "number", order = 'alphabet') # Gráfico com parâmetro numérico por ordem alfabética

# Utilizando a função Corrplot com visualização através de círculos ao invés de números.
corrplot(mtcarsTesteCor, order = 'alphabet')
