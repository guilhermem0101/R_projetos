#####################################################################
# MODELO AR                                                         #
#####################################################################
# Definindo o lag da série
lag_series <- function(x, p) {
  n <- length(x)
  X <- matrix(NA, n - p, p)
  
  for (i in 1:p) {
    X[, i] <- x[(p - i + 1):(n - i)]
  }
  
  return(X)
}

# Exemplo de uma série temporal simulada
set.seed(123)
serie_temporal <- arima.sim(list(order = c(1, 0, 0), ar = 0.7), n = 100)

# Definindo a ordem p do modelo AR
p <- 1

# Definindo a matriz de lags
X <- lag_series(serie_temporal, p)
y <- serie_temporal[(p + 1):length(serie_temporal)]

# Regressão linear para estimar os coeficientes
modelo_ar <- lm(y ~ X - 1)

# Visualizando os coeficientes estimados
summary(modelo_ar)


#####################################################################
# MODELO MA                                                         #
#####################################################################

# Simulando uma série MA(1)
set.seed(123)
serie_ma <- arima.sim(list(order = c(0, 0, 1), ma = 0.5), n = 100)

# Função para calcular as autocorrelações
acf_vals <- acf(serie_ma, plot = FALSE)$acf

# Estimando o parâmetro MA(1) a partir da função de autocorrelação
theta_1 <- acf_vals[2] / (1 - acf_vals[2]^2)
theta_1

#####################################################################
# MODELO ARMA                                                       #
#####################################################################

# Simulando uma série ARMA(1, 1)
set.seed(123)
serie_arma <- arima.sim(list(order = c(1, 0, 1), ar = 0.5, ma = 0.5), n = 100)

# Função para ajustar ARMA(1,1) - de forma simplificada
arma_fit <- function(y, p, q) {
  n <- length(y)
  
  # Estimar parâmetros AR usando lags
  X_ar <- lag_series(y, p)
  y_ar <- y[(p + 1):n]
  
  # Estimar parâmetros MA usando autocorrelações
  acf_vals <- acf(y_ar, plot = FALSE)$acf
  theta_1 <- acf_vals[2] / (1 - acf_vals[2]^2)
  
  # Regressão para estimar os parâmetros AR
  modelo_ar <- lm(y_ar ~ X_ar - 1)
  
  return(list(ar_coef = coef(modelo_ar), ma_coef = theta_1))
}

# Ajustando o modelo ARMA(1,1)
modelo_arma <- arma_fit(serie_arma, p = 1, q = 1)
modelo_arma


#####################################################################
# MODELO ARIMA                                                      #
#####################################################################
# Diferenciar a série para torná-la estacionária
diff_series <- function(x, d) {
  for (i in 1:d) {
    x <- diff(x)
  }
  return(x)
}

# Simulando uma série ARIMA(1, 1, 1)
set.seed(123)
serie_arima <- arima.sim(list(order = c(1, 1, 1), ar = 0.5, ma = 0.5), n = 100)

# Diferenciar a série (d = 1)
serie_diferenciada <- diff_series(serie_arima, d = 1)

# Ajustar o modelo ARMA na série diferenciada
modelo_arima <- arma_fit(serie_diferenciada, p = 1, q = 1)
modelo_arima




























