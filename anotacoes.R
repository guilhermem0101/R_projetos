##############################################################
##TIPOS DE DADOS EM R
##############################################################

vetor <- c(1, 2, 3, 4, 5)

textos <- c("a", "b", "c")

logicos <- c(TRUE, FALSE, TRUE)

#MATRIZ
matriz <- matrix(1:6, nrow = 2, ncol = 3)
matriz

#TENSOR
array_3d <- array(1:12, dim = c(2, 3, 2))

#DATAFRAME
# Criando um DataFrame com três colunas (nome, idade, cidade)
dados <- data.frame(
  nome = c("Ana", "Beto", "Carlos"),
  idade = c(25, 30, 22),
  cidade = c("São Paulo", "Rio de Janeiro", "Brasília")
)

# Visualizando o DataFrame
print(dados)

# Acessando a coluna "nome"
dados$nome

# Acessando o elemento da primeira linha, segunda coluna
dados[1, 2]

# Acessando a primeira linha inteira
dados[1, ]

# Selecionando linhas onde a idade é maior que 25
subset(dados, idade > 25)

# Fornece um resumo estatístico dos dados.
summary(dados)


#FUNÇÃO
funcao <- function(x) {
  return(x^2)
}





















































