library(MASS)

data(Animals)
head(Animals)

dim(Animals)#shape
summary(Animals$brain) #요약
table(Animals$brain) #빈도수
mean(Animals$brain) #평균
sd(Animals$brain)#표준편차
var(Animals$brain) #분산
max(Animals$brain) #최대
min(Animals$brain) #최소

install.packages("psych")
library(psych)
describe(Animals)



# 빈도수 그래프
install.packages("descr")
library(descr)
freq(Animals)
#라이브러리 사용 
freq(Animals$brain)
#라이브러리 사용 X
barplot(table(Animals$brain))

