##############################################################
##BDA - AULA 11
##############################################################
##Exemplos 1,2 e 3    
##############################################################
k<-7
h<-500
L0<-1000
li.classes<-seq(L0,L0+(k-1)*h,h)
ls.classes<-seq(L0+h,L0+k*h,h)
fi<-c(8,10,11,16,13,5,2)
n<-sum(fi)
xi<-NULL
for (i in 1:k) xi[i] = (li.classes[i] + ls.classes[i])/2 
xbarra<-sum(xi*fi)/n
cat("xbarra  = ",round(xbarra,2), "\n")
DMA<-sum(fi*abs(xi - xbarra))/n
cat("DMA = ", round(DMA,2), " \n")
s2<-sum(fi*(xi - xbarra)^2)/(n - 1)
cat("s2 = ", round(s2,2), " \n")
s<-sqrt(s2)
cat("s = ", round(s,2), " \n")
AT<-max(xi) - min(xi)
cat("AT = ", round(AT,2), " \n")
CV<-(s/xbarra)*100
cat("CV = ", round(CV,2), "% \n")
salário<-rep(xi,fi)
hist(salário,main = "Histograma", xlab = "salário mensal (R$)", 
     ylab = "número de funcionários", col = "springgreen",
     ylim = c(0,18)) 
points(xbarra, 0, col = "red", pch = 20, cex = 1.5)
points(c(xbarra - s, xbarra + s), c(0,0), col = "black", pch = 4)

##############################################################
##Exemplo 4    
##############################################################
anorexia<-read.csv("anorexia.csv", header = TRUE, sep = ",", dec = "." )
str(anorexia)
head(anorexia)
View(anorexia)
which(is.na(anorexia))

anorexia$Prewt<-anorexia$Prewt*0.453592
anorexia$Postwt<-anorexia$Postwt*0.453592


média.pre<-mean(anorexia$Prewt)
média.pos<-mean(anorexia$Postwt)

DMA.pre<-sum(abs(anorexia$Prewt - média.pre))/length(anorexia$Prewt)
DMA.pos<-sum(abs(anorexia$Postwt - média.pos))/length(anorexia$Postwt)

s2.pre<-var(anorexia$Prewt)
s2.pos<-var(anorexia$Postwt)

s.pre<-sd(anorexia$Prewt)
s.pos<-sd(anorexia$Postwt)

AT.pre<-max(anorexia$Prewt) - min(anorexia$Prewt)
AT.pos<-max(anorexia$Postwt) - min(anorexia$Postwt)

CV.pre<-(s.pre/média.pre)*100
CV.pos<-(s.pos/média.pos)*100

tabela.res<-matrix(round(c(média.pre,DMA.pre,s2.pre,s.pre, AT.pre, CV.pre, 
                           média.pos,DMA.pos, s2.pos, s.pos, AT.pos, CV.pos),1),
                   byrow = TRUE, nrow = 2, ncol = 6) 

rownames(tabela.res)<-c("Antes do período de estudo",
                        "Após do período de estudo")
colnames(tabela.res)<-c("média", "DMA", "s2","s","AT","CV(%)")

tabela.res

tabela.res1<-t(tabela.res)

##mfrow: MultiFrame ROWwise layout
opar<-par(mfrow = c(1,2))

hist(anorexia$Prewt, col = "lightblue", main = "Histograma",  
     xlab = "peso (kg) antes o período de estudo", 
     ylab = "Número de pacientes do gênero feminino",
     xlim = c(30,50))
points(média.pre, 0, col = "red", pch = 20, cex = 1.5)
points(c(média.pre - s.pre, média.pre + s.pre), c(0,0), col = "black", pch = 4)


hist(anorexia$Postwt, col = "royalblue", main = "Histograma",  
     xlab = "peso (kg) após o período de estudo", 
     ylab = "Número de pacientes do gênero feminino",
     xlim = c(30,50))
points(média.pos, 0, col = "red", pch = 20, cex = 1.5)
points(c(média.pos - s.pos, média.pos + s.pos), c(0,0), col = "black", pch = 4)

par(opar)

p1<-length(which(anorexia$Prewt > (média.pre - s.pre) & 
                   anorexia$Prewt < (média.pre + s.pre)))
cat("~", round((p1/length(anorexia$Prewt)*100),1), 
    "% dos dados encontram-se no intervalo (média - s, média + s)\n")

p2<-length(which(anorexia$Postwt > (média.pos - s.pos) & 
                   anorexia$Postwt < (média.pos + s.pos)))
cat("~", round((p2/length(anorexia$Postwt)*100),1), 
    "% dos dados encontram-se no intervalo (média - s, média + s)\n")