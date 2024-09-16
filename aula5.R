##############################################################
##BDA - AULA 6
##############################################################
##Exemplos 1 e 2    
##############################################################
notas<-c(174,172,169,176,169,170,175)
Md.notas<-median(notas)
cat("Mediana das notas = ",Md.notas, "\n\n")

altura<-c(1.98,1.97,2.10,2.05,2.00,1.85)
Md.altura<-median(altura)
cat("Mediana das alturas = ",Md.altura, "\n")

##############################################################
##Exemplo 3    
##############################################################
xi<-c(0,1,2,3,4,5)
fi<-c(5,6,7,12,2,3)
filhos<-rep(xi,fi)

Md.filhos<-median(filhos)
cat("Mediana  = ",Md.filhos, "\n")

##############################################################
##Exemplo 4    
##############################################################
xi<-c(1,2,3,4,5,6)
fi<-c(1,3,3,10,15,8)
pedidos<-rep(xi,fi)
Md.pedidos<-median(pedidos)
cat("Mediana  = ",Md.pedidos, "\n")

##############################################################
##Exemplo 5    
##############################################################
proj<-c(6, 6, 6, 9, 9, 9, 12, 12, 12, 12, 15, 15)
tab.único<-unique(proj)
tab.comb<-match(proj,tab.único)
tab.cont<-tabulate(tab.comb)
Mo.proj<-tab.único[which(tab.cont==max(tab.cont))]
if (length(Mo.proj) > 1){
  cat("Não há moda \n")
} else {
  cat("Moda  = ", Mo.proj, "\n")
}

##############################################################
##Exemplo 6    
##############################################################
xi<-c(0,1,2,3,4,5,6)
fi<-c(12,15,10,10,20,18,15)
n.vezes<-rep(xi,fi)
tab.único<-unique(n.vezes)
tab.comb<-match(n.vezes,tab.único)
tab.cont<-tabulate(tab.comb)
Mo.n.vezes<-tab.único[which(tab.cont==max(tab.cont))]
if (length(Mo.n.vezes) > 1){
  cat("Não há moda \n")
} else {
  cat("Moda  = ", Mo.n.vezes, "\n")
}