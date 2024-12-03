##############################################################
##BDA - AULA 12
##############################################################
##Exemplo 1    
##############################################################
ação<-c(2.50,2.52,2.53,2.54,2.59,2.60,2.61,2.62,2.64,2.65)
xbarra<-mean(ação)
Md<-median(ação)
s<-sd(ação)
As<-(3*(xbarra - Md))/s
cat("As = ", round(As,2),"\n")

plot(density(ação), xlab = "ação", 
     ylab = "densidade", col = "green", main = c("As",round(As,2)))
arrows(xbarra, 0, xbarra, 6, code = 1, length = 0.15,
       col = "red", lty = 2)
arrows(Md, 0, Md, 6, code = 1, length = 0.15,
       col = "orange", lty = 2)
points(xbarra, 0, col = "red", pch = 20, cex = 1.5)
points(Md, 0, col = "orange", pch = 17, cex = 1.5)

##############################################################
##Exemplo 2    
##############################################################
notas<-c(169,169,170,172,174,175,176)
xbarra<-mean(notas)
Md<-median(notas)
s<-sd(notas)
As<-(3*(xbarra - Md))/s
cat("As = ", round(As,2),"\n")

plot(density(notas), xlab = "notas", 
     ylab = "densidade", col = "blue", main = c("As",round(As,2)))
arrows(xbarra, 0, xbarra, 0.12, code = 1, length = 0.15,
       col = "red", lty = 2)
arrows(Md, 0, Md, 0.12, code = 1, length = 0.15,
       col = "orange", lty = 2)
points(xbarra, 0, col = "red", pch = 20, cex = 1.5)
points(Md, 0, col = "orange", pch = 17, cex = 1.5)

##############################################################
##Exemplo 3    
##############################################################
xi<-c(0,1,2,3,4,5)
fi<-c(5,6,7,12,2,3)

filhos<-rep(xi,fi)
Md <-median(filhos)

xbarra<-mean(filhos)
s<-sd(filhos)
As<-(3*(xbarra - Md))/s
cat("As = ", round(As,2),"\n")

plot(density(filhos), xlab = "filhos", 
     ylab = "densidade", col = "purple", main = c("As",round(As,2)))
arrows(xbarra, 0, xbarra, 0.30, code = 1, length = 0.15,
       col = "red", lty = 2)
arrows(Md, 0, Md, 0.30, code = 1, length = 0.15,
       col = "orange", lty = 2)
points(xbarra, 0, col = "red", pch = 20, cex = 1.5)
points(Md, 0, col = "orange", pch = 17, cex = 1.5)

##############################################################
##Exemplo 4    
##############################################################
xi<-c(1,2,3,4,5,6)
fi<-c(1,3,3,10,15,8)

pedidos<-rep(xi,fi)
Md<-median(pedidos)

xbarra<-mean(pedidos)
s<-sd(pedidos)
As<-(3*(xbarra - Md))/s
cat("As = ", round(As,2),"\n")

plot(density(pedidos), xlab = "pedidos", 
     ylab = "densidade", col = "brown", main = c("As",round(As,2)))
arrows(xbarra, 0, xbarra, 0.50, code = 1, length = 0.15,
       col = "red", lty = 2)
arrows(Md, 0, Md, 0.50, code = 1, length = 0.15,
       col = "orange", lty = 2)
points(xbarra, 0, col = "red", pch = 20, cex = 1.5)
points(Md, 0, col = "orange", pch = 17, cex = 1.5)

##############################################################
##Exemplo 5    
##############################################################
cred<-read.csv("Credit.csv", header = TRUE, sep = ";", dec = "," )
str(cred)
head(cred)
View(cred)
which(is.na(cred))

Md.l<-median(cred$limite)
xbarra.l<-mean(cred$limite)
s.l<-sd(cred$limite)
As.l<-(3*(xbarra.l - Md.l))/s.l
cat("As = ", round(As.l,2),"\n")

Md.smd<-median(cred$div_med)
xbarra.smd<-mean(cred$div_med)
s.smd<-sd(cred$div_med)
As.smd<-(3*(xbarra.smd - Md.smd))/s.smd
cat("As = ", round(As.smd,2),"\n")

opar<-par(mfrow = c(1,2))

plot(density(cred$limite), xlab = "Limite no cartão de crédito (U$)", 
     ylab = "densidade", col = "brown", main = c("As",round(As.l,2)))
arrows(xbarra.l, 0, xbarra.l, 0.020, code = 1, length = 0.15,
       col = "red", lty = 2)
arrows(Md.l, 0, Md.l, 0.020, code = 1, length = 0.15,
       col = "orange", lty = 2)
points(xbarra.l, 0, col = "red", pch = 20, cex = 1.5)
points(Md.l, 0, col = "orange", pch = 17, cex = 1.5)

plot(density(cred$div_med), xlab = "Saldo médio devedor no cartão de 
     crédito (U$)", ylab = "densidade", col = "chocolate", 
     main = c("As",round(As.smd,2)))
arrows(xbarra.smd, 0, xbarra.smd, 0.020, code = 1, length = 0.15,
       col = "red", lty = 2)
arrows(Md.smd, 0, Md.smd, 0.020, code = 1, length = 0.15,
       col = "orange", lty = 2)
points(xbarra.smd, 0, col = "red", pch = 20, cex = 1.5)
points(Md.smd, 0, col = "orange", pch = 17, cex = 1.5)

box()
par(opar)


plot(cred$div_med,cred$limite, xlab = "Saldo médio devedor no 
     cartão de crédito (US$)", ylab = "Limite no cartão de crédito (US$)",
     main = "Diagrama de dispersão", col = "royalblue", pch = 19)