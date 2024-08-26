##############################################################
##BDA - AULA 4
##############################################################
##Exemplos 1, 2 e 3    
##############################################################
altura<-c(1.98,1.97,2.10,2.05,2.00,1.85)
xbarra<-round(mean(altura),2)
cat("Média aritmética = ",xbarra, "\n")

inv.altura<-1/altura
n<-length(altura)
Mh<-n/sum(inv.altura)
cat("Média harmônica = ",round(Mh,2),"\n")

Soma.log<-sum(log10(altura))
n<-length(altura)
A<-1/n *Soma.log
Mg<-10^(A)
cat("Média geométrica = ",round(Mg,2),"\n")

##############################################################
##Exemplos 4, 5 e 6    
##############################################################
xi<-c(1,2,3,4,5,6)
fi<-c(1,3,3,10,15,8)
n<-sum(fi)
fi.xi<-fi*xi
xbarra<-round(sum(fi.xi)/n,1)
cat("Média aritmética = ",xbarra, "\n")

fi.div.xi<-fi/xi
Mh<-round(n/sum(fi.div.xi),1)
cat("Média harmônica = ", Mh,"\n")

logs<-fi*log10(xi)
A<-1/n * sum(logs)
Mg<-round(10^A,1)
cat("Média geométrica = ", Mg,"\n")

##############################################################
##Exemplo 7    
##############################################################
library(MASS)

class(ships)
head(ships)
View(ships)
str(ships)
which(is.na(ships))

xbarra<-mean(ships$incidents)
cat("Média aritmética = ",xbarra, "\n")

s.tipo<-subset(ships, type == "A")
s.tipo

class(s.tipo)
cat("Média aritmética para tipo A = ",mean(s.tipo$incidents), "\n")