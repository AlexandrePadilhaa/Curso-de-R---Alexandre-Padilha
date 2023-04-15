install.packages("dplyr")
library(dplyr)
#rm(list=ls())

#df1 <-data.frame(subset(tabela1, select = c("idade","sexo", "nota final")))


#1
#a)
# importar tabelas com import dataSet 
df1 <-data.frame(tabela1)
df2 <-data.frame(tabela2)

#b)
nomes1 <- c("René Calher", "Tito Silva", "Rosa Palacios", "Victor Cavalheiro", 
            "Marco Sifuentes", "Anuska BoaLuque")
nomes2 <- c("Glatzer M", "Richard Arce", "Betsy Chivo", "Alvaro Rodrich", 
            "Ruben Dario", "Paula Rosas")


df1 <- cbind(nomes1,df1)
df2 <- cbind(nomes2,df2)
#c)


rownames(df1) <- c("Aluno 1", "Aluno 2", "Aluno 3", "Aluno 4", "Aluno 5", 
                       "Aluno 6")
rownames(df2) <- c("Aluno 7", "Aluno 8", "Aluno 9", "Aluno 10", "Aluno 11", 
                       "Aluno 12")
colnames(df1) <- c("Nome", "Idade", "Sexo", "Nota Final")
colnames(df2) <- c("Nome", "Idade", "Sexo", "Nota Final")



#2
DadosAlunos <-rbind(df1, df2)
#a)
alunosMaiores <- DadosAlunos %>% filter(Idade > 18)

#b)
maioresNotas <- DadosAlunos %>% filter(`Nota Final` > 18)

#c)

alunosSexoMasculino <- DadosAlunos %>% filter(Sexo == 0)

#3
library(MASS)

dadosTemperatura <- matrix(nottem, nrow = 20, byrow = TRUE)
rownames(dadosTemperatura) <- 1920:1939
colnames(dadosTemperatura) <- cbind("Jan", "Fev", "Mar", "Abr", "Mai", "Jun", 
                                     "Jul", "Ago", "Set", "Out", "Nov", "Dez")


# a
menorTemperatura <- 300
ano <- 1000
for (i in 1:20) {
  for (j in 1:12) {
    if (dadosTemperatura[i,j] < menorTemperatura) {
      menorTemperatura <- as.numeric(dadosTemperatura[i,j])
      ano <- rownames(dadosTemperatura)[i]
    }
  }
}

sprintf("A menor temperatura foi: %s e aconteceu no ano: %s", menorTemperatura, ano)

# b
mediaAnos <- rowMeans(dadosTemperatura)

print("A média de cada ano foi de: ")
print(mediaAnos)

# c
mediaMeses <- colMeans(dadosTemperatura)
mediaGeral <- mean(dadosTemperatura)
print("A média de cada mês foi de: ")
print(mediaMeses)
sprintf("A média geral foi de: %s", mediaGeral)

# d
temp_em_c <- apply(dadosTemperatura, c(1,2), function(x) (5/9)*(x-32))

#4

dados_1920 <- dadosTemperatura[1,]
dados_1928 <- dadosTemperatura[9,]
dados_1935 <- dadosTemperatura[16,]

plot(dados_1920, type="l", xlab="Meses", ylab="Temperaturas", 
     main="Temperaturas nos anos de 1920, 1928 e 1935", col="dodgerblue",
     ylim=c(35,65), xlim=c(1,13), lwd=2)
points(dados_1928, type="l", col="green", lty="dashed", lwd=2)
points(dados_1935, type="l", col="red", lty="twodash", lwd=2)
text(x=12.5, y=c(dados_1920[12], dados_1928[12] + 0.5, dados_1935[12]),
     labels=c("1920", "1928", "1935"), col=c("dodgerblue", "green", 
                                                          "red"))


