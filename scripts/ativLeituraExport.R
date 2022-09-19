# Atividade 

# Instala pacote
pacman:: p_load(microbenchmark)

library(microbenchmark)

# Importa a lista das obras da Rede Federal de EPCT - PRONATEC - 2019
obrasPronatec2019 <- read.csv2('https://dadosabertos.mec.gov.br/images/conteudo/pronatec/2019/dados_abertos_2019_obras_setec.csv' , sep = ';' , encoding =  'UTF-8')

# Apresenta estrutura da base de dados das obras da Rede Federal de EPCT - PRONATEC - 2019
str(obrasPronatec2019)

# Apresenta a classe da base de dados das obras da Rede Federal de EPCT - PRONATEC - 2019
class(obrasPronatec2019)

# Apresenta os dados da base de dados das obras da Rede Federal de EPCT - PRONATEC - 2019
list(obrasPronatec2019)

# Apresenta a complexidade da base de dados das obras da Rede Federal de EPCT - PRONATEC - 2019
str(obrasPronatec2019)

# Exporta os dados em formato nativo do R
saveRDS(obrasPronatec2019, "bases_originais/obrasPronatec2019.rds")

# Exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(obrasPronatec2019, "bases_originais/obrasPronatec2019.csv")

# Carrega a base de dados em formato nativo do R
obrasPronatec2019 <- readRDS('bases_originais/obrasPronatec2019.rds')

# Carrega a base de dados em formato tabular (.csv) - padrão para interoperabilidade
obrasPronatec2019 <- read.csv2('bases_originais/obrasPronatec2019.csv' , sep = ';')

# OBS: De acordo com o site www.gov.br/governodigital/ a interopelabilidade pode ser definida como:
# uma característica que se refer à capacidade de diversos sistemas e organizações trabalharem 
# em conjunto (interoperar) de modo a garantir que pessoas, organizações e sistemas computacionais
# interajam para trocar informações de maneira eficaz e eficiente.

# Compara os dois processos de exportação usando a função microbenchmark

library(microbenchmark)

microbenchmark( a <- saveRDS(obrasPronatec2019, "bases_originais/obrasPronatec2019.rds"), b <- write.csv2(obrasPronatec2019, "bases_originais/obrasPronatec2019.csv"), times = 30L)

microbenchmark( a <- readRDS('bases_originais/obrasPronatec2019.rds'), b <- read.csv2('bases_originais/obrasPronatec2019.csv' , sep = ';'), times =  10L)





