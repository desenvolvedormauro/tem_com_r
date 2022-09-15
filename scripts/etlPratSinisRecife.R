# Atividade ETL na prática - Base de dados do site da Prefeitura do Recife - http://dados.recife.pe.gov.br/dataset/acidentes-de-transito-com-e-sem-vitimas

# Instalar pacote 
pacman :: p_load( dplyr )

# Importação de dados da base de sinistros do site da Prefeitura do Recife - 

# Dados sinistros PCR exercício de 2019 - atribuição a um vetor
sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv' , sep = ';' , encoding = 'UTF-8')


# Dados sinistros PCR exercício de 2020 - atribuição a um vetor
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv' , sep = ';' , encoding = 'UTF-8')

# Dados sinistros PCR exercício de 2021 - atribuição a um vetor
sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes2021.csv' , sep = ';' , encoding = 'UTF-8')

# Variáveis não conincidem. Correção com remoção de colunas
sinistrosRecife2020Raw2 <- subset(sinistrosRecife2020Raw, select = -c(descricao)) #remove coluna ausente em 2021

sinistrosRecife2019Raw2 <- subset(sinistrosRecife2019Raw, select = -c(endereco_cruzamento , numero_cruzamento , referencia_cruzamento , descricao)) # remove colunas

# Necessidade de uniformizar variáveis que não coincidem
sinistrosRecife2019Raw2 <- rename (sinistrosRecife2019Raw2 , data = DATA)

# Juntar as bases de dados com o comando rbind (por linhas)
sinistrosRecifeRaw <- rbind( sinistrosRecife2019Raw2, sinistrosRecife2020Raw2, sinistrosRecife2021Raw)

# Modifica a data para o formato Ano mês e dia
sinistrosRecifeRaw$data <-as.Date(sinistrosRecifeRaw$data, format = "%Y-%m-%d")

# Modifica a natureza do acidente para se comportar como fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

# Cria a função naPorZero para substituir not avaliable por zero
naPorZero <- function(x) { x <- ifelse(is.na(x), 0, x)}

# Utiliza a função naPorZero nas colunas de 14 até 26
sinistrosRecifeRaw[ , 14:26] <- sapply(sinistrosRecifeRaw[ , 14:26], naPorZero)

# Lista a estrutura dos dados
list(sinistrosRecifeRaw)

# Exporta os dados em formato nativo do R
saveRDS(sinistrosRecifeRaw , "bases_tratadas/sinistrosRecife.rds")

# Exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

