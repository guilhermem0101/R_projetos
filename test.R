# Definindo os pontos médios das classes
pontos_medios <- c((10 + 20)/2, (20 + 30)/2, (30 + 40)/2, (40 + 50)/2, (50 + 60)/2)

# Definindo as frequências das classes
frequencias <- c(10, 15, 5, 12, 8)

# Total de observações
n_total <- sum(frequencias)

# 1. Média Aritmética
media_aritmetica <- sum(pontos_medios * frequencias) / n_total

# 2. Média Harmônica
media_harmonica <- n_total / sum(frequencias / pontos_medios)

# 3. Média Geométrica
media_geometrica <- prod(pontos_medios^frequencias)^(1/n_total)

# Exibindo os resultados
cat("Média Aritmética:", media_aritmetica, "\n")
cat("Média Harmônica:", media_harmonica, "\n")
cat("Média Geométrica:", media_geometrica, "\n")





# Definindo os limites das classes
classes <- c(10, 20, 30, 40, 50, 60)

# Definindo as frequências das classes
frequencias <- c(10, 15, 5, 12, 8)

# Total de observações
n_total <- sum(frequencias)

# 1. Calcular a frequência acumulada
freq_acumulada <- cumsum(frequencias)

# 2. Encontrar a classe mediana
n_metade <- n_total / 2
classe_mediana <- which(freq_acumulada >= n_metade)[1]
limite_inferior_mediana <- classes[classe_mediana]
freq_acum_antes_mediana <- ifelse(classe_mediana > 1, freq_acumulada[classe_mediana - 1], 0)
frequencia_mediana <- frequencias[classe_mediana]
amplitude_classe <- diff(classes)[1]

# Fórmula da mediana
mediana <- limite_inferior_mediana + ((n_metade - freq_acum_antes_mediana) / frequencia_mediana) * amplitude_classe

# 3. Encontrar a classe modal
classe_modal <- which.max(frequencias)
limite_inferior_modal <- classes[classe_modal]
frequencia_modal <- frequencias[classe_modal]
frequencia_anterior <- ifelse(classe_modal > 1, frequencias[classe_modal - 1], 0)
frequencia_seguinte <- ifelse(classe_modal < length(frequencias), frequencias[classe_modal + 1], 0)

# Fórmula da moda
moda <- limite_inferior_modal + ((frequencia_modal - frequencia_anterior) / 
                                   ((frequencia_modal - frequencia_anterior) + (frequencia_modal - frequencia_seguinte))) * amplitude_classe

# Exibindo os resultados
cat("Mediana:", mediana, "\n")
cat("Moda:", moda, "\n")
