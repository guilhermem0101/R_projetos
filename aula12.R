##############################################################
##BDA - AULA 13
##############################################################
##Exemplo 1    
##############################################################
#função que calcula as medidas separatrizes: Q1, Q2, (MD), Q3, P10 e P90:
m.s<-function(i,m){
  pos <- (i*n)/m
  linha<-which(pos<=tab[,4])[1]
  if (linha == 1 || linha == n){ 
    return (tab[linha,1] + (pos/tab[linha,3])*h)
  }
  else  
    return(tab[linha,1] + (((pos - tab[linha - 1, 4]))/tab[linha,3])*h)
}

#função que calcula a medida de assimetria
m.As<-function(xbarra,Md,s){
  return((3*(xbarra - Md))/s)
}

k<-6
h<-20
L0<-960
li.classes<-seq(L0,L0+(k-1)*h,h)
ls.classes<-seq(L0+h,L0+k*h,h)
fi<-c(60,160,280,260,160,80)
n<-sum(fi)
fac<-cumsum(fi)
tab<-data.frame(li.classes,ls.classes, fi, fac)

#A mediana é o segundo quartil, ou seja, i = 2 e m = 4
Md<-m.s(2,4)
cat("Md  = ",round(Md,4), "\n")

xi<-NULL
for (i in 1:k) xi[i] = (li.classes[i] + ls.classes[i])/2 
xbarra<-sum(xi*fi)/n
cat("xbarra  = ",round(xbarra,4), "\n")

s2<-sum(fi*(xi - xbarra)^2)/(n - 1)
s<-sqrt(s2)
cat("s = ", round(s,4), " \n")

As<-m.As(xbarra,Md,s)
cat("As = ", round(As,2),"\n")

peso<-rep(xi,fi)
plot(density(peso), xlab = "peso", 
     ylab = "densidade", col = "navyblue", main = c("As",round(As,2)))
arrows(xbarra, 0, xbarra, 0.035, code = 1, length = 0.15,
       col = "red", lty = 2)
arrows(Md, 0, Md, 0.035, code = 1, length = 0.15,
       col = "orange", lty = 2)
points(xbarra, 0, col = "red", pch = 20, cex = 1.5)
points(Md, 0, col = "orange", pch = 17, cex = 1.5)

##############################################################
##Exemplo 2    
##############################################################
k<-6
h<-10
L0<-10
li.classes<-seq(L0,L0+(k-1)*h,h)
ls.classes<-seq(L0+h,L0+k*h,h)
fi<-c(35,26,17,6,9,2)
n<-sum(fi)
fac<-cumsum(fi)
tab<-data.frame(li.classes,ls.classes, fi, fac)

#A mediana é o segundo quartil, ou seja, i = 2 e m = 4
Md<-m.s(2,4)
cat("Md  = ",round(Md,4), "\n")

xi<-NULL
for (i in 1:k) xi[i] = (li.classes[i] + ls.classes[i])/2 
xbarra<-sum(xi*fi)/n
cat("xbarra  = ",round(xbarra,4), "\n")
s2<-sum(fi*(xi - xbarra)^2)/(n - 1)
s<-sqrt(s2)
cat("s = ", round(s,4), " \n")

As<-m.As(xbarra,Md,s)
cat("As = ", round(As,2),"\n")


tempo<-rep(xi,fi)
plot(density(tempo), xlab = "tempo", 
     ylab = "densidade", col = "olivedrab", main = c("As",round(As,2)))
arrows(xbarra, 0, xbarra, 0.035, code = 1, length = 0.15,
       col = "red", lty = 2)
arrows(Md, 0, Md, 0.035, code = 1, length = 0.15,
       col = "orange", lty = 2)
points(xbarra, 0, col = "red", pch = 20, cex = 1.5)
points(Md, 0, col = "orange", pch = 17, cex = 1.5)