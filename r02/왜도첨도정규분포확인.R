
data <- read_csv("C:/wyj/r_project/data/descriptive.csv")
data

dim(data)  #300*8. python의 shape
length(data)  #컬럼의 개수 8개 확인
length(data$survey) # 행이 300개임을 확인
head(data)
str(data) 

summary(data) #파이썬에서 describe

# 젠더의 max가 5라서 1,2인 경우만 추출
#조건을 주어 데이터프레임의 일부만 가져옴 
data <- subset(data, gender == 1 | gender == 2)
summary(data) #최소/최대값

x <- table(data$gender) #count해줌. 빈도수

barplot(x) # 막대 그래프 그려주기 

# 비율을 구하고 싶은 경우에는 table말고 porp.table
prop.table(x)


###########################################

#학력수준으로 요약/빈도/비율/그래프
#level

summary(data$level)

level_count <- table(data$level)
level_count

barplot(level_count)

level_portion <- prop.table(data$level)

###########################################

#만족도로 요약/빈도/비율/그래프
#survey : hist(),pie()

summary(data$survey) #요약

table(data$survey) #빈도

prop.table(table(data$survey)) #비율

hist(table(data$survey)) #hist

pie(table(data$survey)) #pie

###########################################

#생활비 cost

summary(data$cost)

#생활비가 마이너스인 것이 이상하기 때문에 조건을 주어 추출
#cost가 2이상, 10이하를 추출
data <- subset(data , cost >= 2 & cost <= 10)
data

x <-data$cost
mean(x) #평균
median(x) #최소값

sort(x) #오름차순으로 정리됨
sort(x, decreasing = T)

data$cost2[data$cost >= 1 & data$cost <=3] <- 1
data$cost2[data$cost >= 4 & data$cost <=6] <- 2
data$cost2[data$cost >= 7] <- 3

data <- subset(data, data$cost2 ==1 | data$cost2 ==2 | data$cost2 ==3)
data


cost.tot = table(data$cost2)
barplot(cost.tot)
pie(cost.tot)

install.packages('moments')
library(moments)
cost <- data$cost

skewness(cost) #왜도는 0이 나와야 하지만 0.2
# 전체적으로 봤을 때 작은 수라 크게 문제는 없지만 0이 아님

kurtosis(cost) #첨도 3.9
par(mfrow = c(1,1)) #히스토그램 위에 선을 얹기 위해 c함수 사용 
# 1,1 = 한줄에 그래프를 두개를 넣을 수 있음. 2,2는 한줄에 4개를 넣을 수 있음
hist(cost, freq = F)

lines(density(cost), col='blue')

x <- seq(0,8,0.1)
curve(dnorm(x,mean(cost), sd(cost)), cor='red', add=T)

qqnorm(x)
qqline(x,col='red',lwd=2)
