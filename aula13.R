##############################################################
##BDA - AULA 14
##############################################################
##Exemplo 1    
##############################################################
K<-function(x){
  return((quantile(x,0.75, type = 2) - quantile(x,0.25, type = 2))/
           (2*(quantile(x,0.90, type = 2) - quantile(x,0.10, type = 2))))
}

ação<-c(2.50,2.52,2.53,2.54,2.59,2.60,2.61,2.62,2.64,2.65)
K.ação<-K(ação)

qqnorm(ação, main = "Gráfico Q - Q", 
       xlab = "quantis teóricos", ylab = "quantis amostrais", 
       col = "purple",pch = 16)
qqline(ação, col = "purple", lwd = 2)
text(-1.2, 2.60, "K ~ ", cex = 0.8)
text(-1.0, 2.60, round(K.ação,3), cex = 0.8)

##############################################################
##Exemplo 2    
##############################################################
medida<-function(x,i){
  return(boxplot.stats(x)$stats[i])
}

As<-function(x){
  return((3*(mean(x) - median(x)))/sd(x))
}

fivenum(ação)

LI<-medida(ação,1)
cat("LI  = ",round(LI,4), "\n")
Q1<-medida(ação,2)
cat("Q1  = ",round(Q1,4), "\n")
Md<-medida(ação,3)
cat("Md  = ",round(Md,4), "\n")
Q3<-medida(ação,4)
cat("Q3  = ",round(Q3,4), "\n")
LS<-medida(ação,5)
cat("LS  = ",round(LS,4), "\n")
dQ<-Q3 - Q1
cat("dQ  = ",round(dQ,4), "\n")

boxplot(ação, horizontal = TRUE, main = "Box plot",
        col = "violet", xlab = "taxas de juros (%)")
stripchart(c(Q1,Md,Q3), vertical = FALSE, add = TRUE, 
           method = "stack", col = "red", pch = 20)
stripchart(c(LI, LS), vertical = FALSE, add = TRUE, 
           method = "stack", col = "blue", pch = 18)

As.ação<-As(ação)
cat("As = ", round(As.ação,2),"\n")
K.ação<-K(ação)
cat("K = ", round(K.ação,3),"\n")

opar<-par(mfrow = c(2,2))

plot(density(ação), xlab = "taxas de juros (%)", 
     ylab = "densidade", col = "darkblue", main = "Assimetria")
text(2.42, 5, "As ~ ", cex = 0.8)
text(2.45, 5, round(As.ação,2), cex = 0.8)
points(mean(ação), 0, col = "red", pch = 20)
arrows(mean(ação), 0, mean(ação), 6, code = 1, length = 0.15,
       col = "red", lty = 2)
points(median(ação), 0, col = "orange", pch = 17)
arrows(median(ação), 0, median(ação), 6, code = 1, length = 0.15,
       col = "orange", lty = 2)

boxplot(ação, col = "violet", horizontal = TRUE, 
        xlab = "taxa de juros (%)", main = "Box plot")

qqnorm(ação, main = "Gráfico Q - Q (Curtose)", 
       xlab = "quantis teóricos", ylab = "quantis amostrais", 
       col = "purple",pch = 16)
qqline(ação, col = "black", lwd = 2)
text(-1.2, 2.60, "K ~ ", cex = 0.8)
text(-1.0, 2.60, round(K.ação,3), cex = 0.8)

hist(ação, col = "violet",xlab = "taxa de juros (%)", 
     ylab = "Frequência absoluta", main = "Histograma",
     breaks = "Sturges")

par(opar)

##############################################################
##Exemplo 3    
##############################################################
pub<-read.csv("Publicidade.csv", header = TRUE, sep = ";", dec = "," )
str(pub)
head(pub)
View(pub)
which(is.na(pub))

fivenum(pub$vendas)

LI<-medida(pub$vendas,1)
cat("LI  = ",round(LI,4), "\n")
Q1<-medida(pub$vendas,2)
cat("Q1  = ",round(Q1,4), "\n")
Md<-medida(pub$vendas,3)
cat("Md  = ",round(Md,4), "\n")
Q3<-medida(pub$vendas,4)
cat("Q3  = ",round(Q3,4), "\n")
LS<-medida(pub$vendas,5)
cat("LS  = ",round(LS,4), "\n")
dQ<-Q3 - Q1
cat("dQ  = ",round(dQ,4), "\n")

boxplot(pub$vendas, horizontal = TRUE, main = "Box plot",
        col = "slateblue4", xlab = "Vendas (em milhares de unidades)")
stripchart(c(Q1,Md,Q3), vertical = FALSE, add = TRUE, 
           method = "stack", col = "red", pch = 20)
stripchart(c(LI, LS), vertical = FALSE, add = TRUE, 
           method = "stack", col = "blue", pch = 18)

As.vendas<-As(pub$vendas)
cat("As = ", round(As.vendas,2),"\n")
K.vendas<-K(pub$vendas)
cat("K = ", round(K.vendas,3),"\n")

opar<-par(mfrow = c(2,2))

plot(density(pub$vendas), xlab = "Vendas (em milhares de unidades)", 
     ylab = "densidade", col = "slateblue1", main = "Assimetria")
text(2.0, 0.08, "As ~ ", cex = 0.8)
text(4.0, 0.08, round(As.vendas,2), cex = 0.8)
points(mean(pub$vendas), 0, col = "red", pch = 20)
arrows(mean(pub$vendas), 0, mean(pub$vendas), 0.08, code = 1, length = 0.15,
       col = "red", lty = 2)
points(median(pub$vendas), 0, col = "orange", pch = 17)
arrows(median(pub$vendas), 0, median(pub$vendas), 0.08, code = 1, length = 0.15,
       col = "orange", lty = 2)

boxplot(pub$vendas, col = "slateblue4", horizontal = TRUE, 
        xlab = "Vendas (em milhares de unidades)", main = "Box plot")

qqnorm(pub$vendas, main = "Gráfico Q - Q (Curtose)", 
       xlab = "quantis teóricos", ylab = "quantis amostrais", 
       col = "slateblue1",pch = 16)
qqline(pub$vendas, col = "black", lwd = 2)
text(-2, 25, "K ~ ", cex = 0.8)
text(-1.5, 25, round(K.vendas,3), cex = 0.8)

hist(pub$vendas, col = "slateblue4",xlab = "Vendas (em milhares de unidades)", 
     ylab = "Frequência absoluta", main = "Histograma",
     breaks = "Sturges")

par(opar)