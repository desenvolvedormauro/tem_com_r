# Atividade Dplyr

# Instala o pacote tidyverse - coleção de pacotes que inclui o pacote tidyr
pacman:: p_load(tidyverse)

# Carrega o pacote tidyverse
library(tidyverse)

# Carrega o pacote dplyr utilizado para manipulação de dados
library(dplyr)

municipio <- c("Recife", "Jaboatao", "Olinda", "Paulista")
bairro <- c("Pina", "Piedade", "BairroNovo", "Janga")
coleta <- c(950, 800, 600, 500)
varricao <- c(90, 75, 50, 45)

#Cria o data frame residuos por município, bairro, apresentando quantidades recolhidas na coleta e varrição
residuos <- data.frame(municipio, bairro, coleta, varricao)

#Visualiza o data frame resíduos
view(residuos)

#Apresenta a estrutura do data frame residuos
str(residuos)

#Apresenta informações sobre os dados da coleta
count(residuos, coleta)

#Seleciona os dados da varrição
select(residuos, varricao)

#Ordena os casos por ordem crescente de acordo com a coleta
arrange(residuos, coleta)

#Ordena os casos de acordo com a ordem descendente de varrição
arrange(residuos, desc(varricao))

#Utilização do operador pipe %>% para manipular dados selecionando apenas duas colunas, escolhendo a de varrição
residuos %>% select(coleta, varricao) %>% arrange(varricao)

#Modificando dados e apresentado uma nova coluna para resíduos sólidos urbanos
residuos %>% mutate(resurbanos = coleta + varricao)


