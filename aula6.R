##############################################################
##BDA - AULA 7
##############################################################
##Exemplo 1    
##############################################################
k<-7
h<-500
L0<-1000
li.classes<-seq(L0,L0+(k-1)*h,h)
ls.classes<-seq(L0+h,L0+k*h,h)
fi<-c(8,10,11,16,13,5,2)
n<-sum(fi)
fac<-cumsum(fi)
tab<-data.frame(li.classes,ls.classes, fi, fac)
pos<-n/2
linha<-which(pos<=tab[,4])[1]
Md<-tab[linha,1] + (((pos - tab[linha - 1, 4]))/tab[linha,3])*h
cat("Mediana  = ",round(Md,2), "\n")

##############################################################
##Exemplo 2    
##############################################################
k<-6
h<-4
L0<-150
li.classes<-seq(L0,L0+(k-1)*h,h)
ls.classes<-seq(L0+h,L0+k*h,h)
fi<-c(4,9,11,8,5,3)
n<-sum(fi)
fac<-cumsum(fi)
tab<-data.frame(li.classes,ls.classes, fi, fac)
pos<-n/2
linha<-which(pos<=tab[,4])[1]
Md<-tab[linha,1] + (((pos - tab[linha - 1, 4]))/tab[linha,3])*h
cat("Mediana  = ",round(Md/100,2), "\n")

##############################################################
##Exemplo 3    
##############################################################
k<-7
h<-500
L0<-1000
li.classes<-seq(L0,L0+(k-1)*h,h)
ls.classes<-seq(L0+h,L0+k*h,h)
fi<-c(8,10,11,16,13,5,2)
n<-sum(fi)

tab<-data.frame(li.classes,ls.classes, fi)

linha<-which(tab[,3]==max(tab[,3]))
if (length(linha) == 1){
  
  delta1<- tab[linha, 3] - tab[linha - 1, 3]
  delta2<- tab[linha, 3] - tab[linha + 1, 3]
  
  Mo<-tab[linha,1] + (delta1/(delta1 +delta2))*h
  cat("Moda  = ",round(Mo,2), "\n")
} else {cat("Não há moda \n")}

##############################################################
##Exemplo 4    
##############################################################
k<-6
h<-4
L0<-150
li.classes<-seq(L0,L0+(k-1)*h,h)
ls.classes<-seq(L0+h,L0+k*h,h)
fi<-c(4,9,11,8,5,3)
n<-sum(fi)

tab<-data.frame(li.classes,ls.classes, fi)

linha<-which(tab[,3]==max(tab[,3]))
if (length(linha) == 1){
  
  delta1<- tab[linha, 3] - tab[linha - 1, 3]
  delta2<- tab[linha, 3] - tab[linha + 1, 3]
  
  Mo<-tab[linha,1] + (delta1/(delta1 +delta2))*h
  cat("Moda  = ",round(Mo/100,2), "\n")
} else {cat("Não há moda \n")}