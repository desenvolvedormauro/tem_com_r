# Atividade Regressão Linear - Implementação

# Instalando pacotes e carregando pacotes
pacman::p_load(car, gvlma, lm.beta, lmtest, mass, sandwich)
library(car)
library(gvlma)
library(lm.beta)
library(lmtest)
library(MASS)
library(sandwich)

# Observando a base de dados USArrest que trata da estatística de crime violentos nos EUA em 1973
help("USArrests")
str(USArrests)
View(USArrests)

# Regressão crimes violentos na base USArrests. Criando inicialmente um objeto a partir da base de dados USArrests.
regUSArrests <- lm(Assault ~ ., data = USArrests) # Estimando a regressão.

# Realizando um detalhamento mais preciso da regressão através do sumário
summary(regUSArrests)

# Gerando os coeficientes padronizados. Leva as variáveis para uma mesma escala de modo a permitir a comparação dos efeitos.
lm.beta(regUSArrests)

# Variáveis sem * não explicam ou não tem interferência no modelo. Precisam ser removidas. Neste caso, o sumário mostrou que a variável UrbanPop deve ser retirada.

# Utilizando um método que segue alguns passo - Stepwise
# O R verifica qual a variável que não se explica e que precisa ser retirada. Existem três simulações:

# De trás para frente
regUSArrestsBack <- step(lm(Assault ~ ., data = USArrests), direction = 'backward')
summary(regUSArrestsBack)

# Do início para o fim
regUSArrestsForw <- step(lm(Assault ~ ., data = USArrests), direction = 'forward')
summary(regUSArrestsForw)

# Nos dois sentidos
regUSArrestsBoth <- step(lm(Assault ~ ., data = USArrests), direction = 'both')
summary(regUSArrestsBoth)

# Verificando os pressupostos
# Normalidade dos resíduos. Verificação através de um teste de hipótese. Verifica se são maiores do que 0.05. Se forem, são normais.
shapiro.test(residuals(regUSArrests)) # Os resíduos são normais pois o p-value = 0.2915, foi maior que 0.05.

# Plot de resíduos x ajsute
plot(regUSArrests, which = 1, col=c("blue"))

# Q-Q Plot
plot(regUSArrests, which = 2, col=c("red")) # Estado mais distantes do ajuste no gráfico: North Carolina, Delaware, Hawaii

# Gráfico de observações influentes. Permite observar outlier que estejam distorcendo a regressão.
plot(regUSArrests, which = 5, col=c("blue")) # As observações no gráfico ficaram entre as retas de 0.5 e 0.5.

# = Correção seria retirar as observações influentes = #

# Inflação da variância / multicolinearidade / variáveis correlacionadas / pode desbalancear a regressão
vif(regUSArrests) # forma numérica de interpretação

# Forma visual de interpretação através de gráfico
barplot(vif(regUSArrests), main = "VIF Values", horiz = FALSE, col = "steelblue", ylim = c(0,5))

# linha do limite aceitável de inflação. O que passa da linha de cinco é preocupante. O que passa de dez é alarmante.
abline(h = 5, lwd = 3, lty = 2) # No gráfico, nenhuma variável ficou acima de cinco.

# Correção seria usar apenas uma das variáveis correlacionadas #

# homocedasticidade (H0 = homocedasticidade)
bptest(regUSArrests) # Teste de homocedasticidade. Como o p-value = 0.2021 foi maior do que 0.05, há uniformidade. 

# Criando um gráfico da regressão
plot(regUSArrests, which = 3, col=c("blue")) # Scale-Location Plot

# Correção seria utilizar estimativas robustas
regUSArrests$robse <- vcovHC(regUSArrests, type = "HC1")
coeftest(regUSArrests, regUSArrests$robse)

# Regressão mais robusta que consegue dar uma precisão maior

regRUSArrests <- rlm(Assault ~ . -UrbanPop, data = USArrests)
summary(regRUSArrests)
summary(regUSArrests)


