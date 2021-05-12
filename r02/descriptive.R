data <- read_csv("C:/wyj/r_project/data/descriptive.csv")
data

# 조건 1 - 학교유형
type <- data$type
type
table(type)
barplot(table(type))
pie(table(type))

#조건 2 - 합격여부
pass <- data$pass
pass
table(pass)
barplot(table(pass))
pie(table(pass))


#나이변수에 대해 요약치, 비대칭도 통계량
age <- data$age
mean(age)
sd(age)

hist(age)
library(moments)
skewness(age)  #왜도 0.3
# histogram상으로도 0이 아니고 왼쪽으로 치우쳐져있다.
kurtosis(age)  #첨도 1.8

#3번
par(mfrow = c(1,1)) #히스토그램 위에 선을 얹기 위해 c함수 사용
hist(age, freq = F)
lines(density(age), col = 'blue')
x <- seq(35,80,0.1) #x축 시작, 끝, 편차
curve(dnorm(x,mean(age), sd(age)), col='red', add=T)
