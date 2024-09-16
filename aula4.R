##############################################################
##BDA - AULA 5
##############################################################
##Exemplos 1, 2 e 3    
##############################################################
k<-5
h<-5
L0<-29
cons<-seq(L0,L0+h*k,h)
fi<-c(11,12,2,3,2)
n<-sum(fi)
xi<-NULL
#calcula os valores de xi
for(i in 1:k) xi[i]<-(cons[i] + cons[i+1])/2
fi.xi<-fi*xi
xbarra<-sum(fi.xi)/n
cat("Média aritmética = ",xbarra, "\n")

fi.div.xi<-fi/xi
Mh<-round(n/sum(fi.div.xi),1)
cat("Média harmônica = ", Mh,"\n")

logs<-fi*log10(xi)
A<-1/n * sum(logs)
Mg<-round(10^A,1)
cat("Média geométrica = ", Mg,"\n")

##############################################################
##Exemplos 4, 5 e 6    
##############################################################
k<-6
h<-4
L0<-150
estatura<-seq(L0,L0+h*k,h)
fi<-c(4,9,11,8,5,3)
n<-sum(fi)
xi<-NULL
#calcula os valores de xi
for(i in 1:k) xi[i]<-(estatura[i] + estatura[i+1])/2
fi.xi<-fi*xi
xbarra<-sum(fi.xi)/n
#calcula em metros
xbarra<-round(xbarra/100,2)
cat("Média aritmética = ",xbarra, "\n")

fi.div.xi<-fi/xi
Mh<-n/sum(fi.div.xi)
#calcula em metros
Mh<-round(Mh/100,2)
cat("Média harmônica = ", Mh,"\n")

logs<-fi*log10(xi)
A<-1/n * sum(logs)
Mg<-10^A
#calcula em metros
Mg<-round(Mg/100,2)
cat("Média geométrica = ", Mg,"\n")

##############################################################
##Exemplo 7    
##############################################################
class(pressure) #exibe a classe do objeto
head(pressure)
View(pressure) #abre o conjunto de dados
str(pressure) #transforma a linhas em colunas como string
which(is.na(pressure))

names(pressure)<-c("t","p") #renomeia as colunas 
View(pressure)

xbarra<-round(mean(pressure$t),2)
cat("Média aritmética = ",xbarra, "\n")

s.temp<-subset(pressure, t >= 23 & t <= 72)
class(s.temp)

cat("Média aritmética da pressão para 23°C <= t <= 72°C =",mean(s.temp$p),"mmHg\n")