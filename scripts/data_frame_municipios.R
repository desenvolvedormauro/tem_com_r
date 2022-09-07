Data frame municípios

install.packages('eeptools')

library('eeptools')

nomeMunicipio <- c("Recife", "Olinda", "Jaboatão", "Cabo", "Ipojuca", "Paulista")

# vetor com datas de emancipação dos municípios
emancipacaoMunicipio <- as.Date(c("1537-03-12", "1535-03-12", "1593-05-04", "1812-02-15", "1846-03-30", "1935-04-11"))

# vetor com tempo de emancipação dos municípios
tempoEmancipacao <- round( age_calc(emancipacaoMunicipio, units = 'years')) # Tempo de emancipação usando a funçao age_calc do pacote eeptools e a função round (arredondar)

# data.frame com base nos vetores
listaMunicipios <- data.frame(
  nome = nomeMunicipio, # Nome do município
  dataEmacipacao = emancipacaoMunicipio, # Data de emacipação
  tempo = tempoEmancipacao # Tempo de emancipação
)

View(listaMunicipios)



