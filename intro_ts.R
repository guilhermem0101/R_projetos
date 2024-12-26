data(Nile)
plot(Nile)

View(Nile) #visualiza o objeto 
class(Nile) # mostra a classe do objeto
summary(Nile) # resumo estatistico


#----------------------------------------- TS-> DATAFRAME-------------------------
# Converter para um data frame
serie_df <- data.frame(
  ano = floor(time(Nile)),           # Extrai o ano
  valor = as.numeric(Nile)          # Valores da série temporal
)
View(serie_df)

# Criar uma série temporal multivariada
multivar_ts <- ts(
  matrix(c(10, 20, 30, 40, 15, 25, 35, 45), ncol = 2), 
  start = c(2020, 1), 
  frequency = 4
)

# Converter para um data frame
multivar_df <- data.frame(
  ano = floor(time(multivar_ts)),           # Extrai o ano
  trimestre = cycle(multivar_ts),          # Extrai o ciclo (trimestre)
  serie1 = multivar_ts[, 1],               # Primeira variável
  serie2 = multivar_ts[, 2]                # Segunda variável
)

# Visualizar o data frame
print(multivar_df)

#----------------------------------------- TS-> DATAFRAME-------------------------




#-----------------------------------------DATAFRAME -> TS-------------------------
df <- data.frame(
  ano = rep(2020, 12), # repete o mesmo valor para cado linha
  mes = 1:12, # sequencia numérica 
  valor = c(10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65)
)

# Converter a coluna `valor` em série temporal
serie_ts <- ts(df$valor, start = c(2020, 1), frequency = 12)

attributes(serie_ts) 

# Visualizar a série
plot(serie_ts, main = "Série Temporal Mensal", ylab = "Valor", xlab = "Tempo")


# Data frame multivariado
df <- data.frame(
  ano = rep(2021, 12),
  mes = 1:12,
  serie1 = c(10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32),
  serie2 = c(5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
)

# Converter para uma série multivariada
multivar_ts <- ts(df[, c("serie1", "serie2")], start = c(2021, 1), frequency = 12)

# Plotar
plot(multivar_ts, main = "Séries Temporais Multivariadas", plot.type = "single", col = 1:2)
legend("topright", legend = c("Serie 1", "Serie 2"), col = 1:2, lty = 1)

#-----------------------------------------DATAFRAME -> TS-------------------------
