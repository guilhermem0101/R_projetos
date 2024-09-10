# Criando dados fictícios
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 5, 4, 5)

# Criando um dataframe com esses dados
dados <- data.frame(x, y)


modelo <- lm(y ~ x, data = dados)


summary(modelo)


#PREVISÕES
novos_dados <- data.frame(x = c(6, 7, 8))
predicoes <- predict(modelo, novos_dados)
print(predicoes)

# MULTIDIMENSIONAL
modelo_mult <- lm(y ~ x1 + x2 + x3, data = dados)


# Plot dos dados
plot(dados$x, dados$y, main = "Regressão Linear", xlab = "x", ylab = "y")

# Adicionando a linha de regressão
abline(modelo, col = "blue")
