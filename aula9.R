##############################################################
##BDA - AULA 10
##############################################################
##Exemplo 1    
##############################################################
xi<-c(41,38,39,45,47,41,44,41,37,42)
AT<-max(xi) - min(xi)
cat("AT = ", AT*100, "\n")

xbarra<-mean(xi)
n<-length(xi)
DMA<-sum(abs(xi - xbarra))/n
cat("DMA = ", round(DMA*100,2), "\n")

s2<-var(xi)
cat("s2 = ", round(s2*100,2), "\n")
s<-sd(xi)
cat("s = ", round(s*100,2), "\n")

CV<-(s/xbarra)*100
cat("CV = ", round(CV,1), "% \n")

##############################################################
##Exemplo 2    
##############################################################
xi<-c(40,23,41,50,49,32,41,29,52,58)
AT<-max(xi) - min(xi)
cat("AT = ", AT*100, "\n")

xbarra<-mean(xi)
n<-length(xi)
DMA<-sum(abs(xi - xbarra))/n
cat("DMA = ", round(DMA*100,2), "\n")

s2<-var(xi)
cat("s2 = ", round(s2*100,2), "\n")
s<-sd(xi)
cat("s = ", round(s*100,2), "\n")

CV<-(s/xbarra)*100
cat("CV = ", round(CV,1), "% \n")

##############################################################
##Exemplos 3, 4 e 5    
##############################################################
xi<-c(1,2,3,4,5,6,7)
fi<-c(6,8,7,5,5,4,2)
n<-sum(fi)

xbarra<-sum(xi*fi)/n
cat("xbarra = ", round(xbarra,2), " \n")

DMA<-sum(fi*abs(xi - xbarra))/n
cat("DMA = ", round(DMA,2), " \n")

s2<-sum(fi*(xi - xbarra)^2)/(n - 1)
cat("s2 = ", round(s2,2), " \n")
s<-sqrt(s2)
cat("s = ", round(s,2), " \n")

AT<-max(xi) - min(xi)
cat("AT = ", round(AT,2), " \n")
CV<-(s/xbarra)*100
cat("CV = ", round(CV,2), " % \n")

plot(xi,fi, type = "h", main = "Histograma",
     xlab = "número de exigências descumpridas",
     ylab = "número de propostas",lwd = 5, col = "forestgreen",
     ylim = c(0,8))
points(xbarra, 0, col = "red", pch = 20)
points(c(xbarra - s, xbarra + s), c(0,0), col = "black", pch = 4)

##############################################################
##Exemplos 6, 7 e 8    
##############################################################
xi<-c(1,2,3,4,5,6,7)
fi<-c(3,2,4,6,8,1,4)
n<-sum(fi)

xbarra<-sum(xi*fi)/n
cat("xbarra = ", round(xbarra,2), " \n")

DMA<-sum(fi*abs(xi - xbarra))/n
cat("DMA = ", round(DMA,2), " \n")

s2<-sum(fi*(xi - xbarra)^2)/(n - 1)
cat("s2 = ", round(s2,2), " \n")
s<-sqrt(s2)
cat("s = ", round(s,2), " \n")

AT<-max(xi) - min(xi)
cat("AT = ", round(AT,2), " \n")
CV<-(s/xbarra)*100
cat("CV = ", round(CV,2), " % \n")

plot(xi,fi, type = "h", main = "Histograma",
     xlab = "número de exigências descumpridas",
     ylab = "número de propostas",lwd = 5, col = "palegreen",
     ylim = c(0,8))
points(xbarra, 0, col = "red", pch = 20)
points(c(xbarra - s, xbarra + s), c(0,0), col = "black", pch = 4)