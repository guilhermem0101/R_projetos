
###########################################################################################################################
##BDA - AULA 9
##############################################################
##Exemplos 1 e 2    
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
quartil.i<-1 
pos<-(quartil.i*n)/4
linha<-which(pos<=tab[,4])[1]

if (linha == 1){
  Q1<-tab[linha,1] + (pos/tab[linha,3])*h
}else{
  Q1<-tab[linha,1] + (((pos - tab[linha - 1, 4]))/tab[linha,3])*h
}
cat("Q1  = ",round(Q1,2), "\n")

decil.i<-9 
pos<-(decil.i*n)/10
linha<-which(pos<=tab[,4])[1]
if (linha == 1){
  D9<-tab[linha,1] + (pos/tab[linha,3])*h
}else{
  D9<-tab[linha,1] + (((pos - tab[linha - 1, 4]))/tab[linha,3])*h
}
cat("D9  = ",round(D9,2), "\n")

##############################################################
##Exemplo 3    
##############################################################
k<-6
h<-20
L0<-960
li.classes<-seq(L0,L0+(k-1)*h,h)
ls.classes<-seq(L0+h,L0+k*h,h)
fi<-c(60,160,280,260,160,80)
n<-sum(fi)
fac<-cumsum(fi)

tab<-data.frame(li.classes,ls.classes, fi, fac)

percentil.i<-20
pos<-(percentil.i*n)/100
linha<-which(pos<=tab[,4])[1]

if (linha == 1){
  P20<-tab[linha,1] + (pos/tab[linha,3])*h
}else{
  P20<-tab[linha,1] + (((pos - tab[linha - 1, 4]))/tab[linha,3])*h
}
cat("P20  = ",round(P20,2), "\n")

percentil.i<-50
pos<-(percentil.i*n)/100
linha<-which(pos<=tab[,4])[1]

if (linha == 1){
  P50<-tab[linha,1] + (pos/tab[linha,3])*h
}else {
  P50<-tab[linha,1] + (((pos - tab[linha - 1, 4]))/tab[linha,3])*h
}
cat("P50  = ",round(P50,2), "\n")

percentil.i<-80
pos<-(percentil.i*n)/100
linha<-which(pos<=tab[,4])[1]

if (linha == 1){
  P80<-tab[linha,1] + (pos/tab[linha,3])*h
}else{
  P80<-tab[linha,1] + (((pos - tab[linha - 1, 4]))/tab[linha,3])*h
}
cat("P80  = ",round(P80,2), "\n")
