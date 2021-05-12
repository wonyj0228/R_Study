library(readr)
data <- read_csv("C:/wyj/r_project/data/two_sample.csv")
View(data)
head(data)

#method를 기준으로 그룹을 지어서 집단을 분류

x <- data$method 
y <- data$survey #만족도 결과 0:불만족, 1:만족

x;y

#빈도 분석표
table(x)
table(y)

#교차 분석표
table(x,y, useNA = "ifany") #x는 행, y는 열, useNA na값이 있으면 보여라 ifany 

#두 집단 이상의 명목척도의 비율 검정
#110이 135보다 크다 라는 귀무가설 설정

help("prop.test") #사용할 함수의 매개변수를 모를때
prop.test(
  c(110,135), # 만족도 정도
  c(150,150), # 두 집단의 표본은 둘다 150씩임
  alternative = "greater",
  conf.level = 0.95 #유의수준
  )
# 첫번째 집단이 더 크다는 것을 대립가설로 둠
# 대립가설에 대한 p-value 가 0.99
# 당연히 110이 135보다 작기때문에 p-value 0.99
# 0.05보다 크기때문에 귀무가설 기각 영가설 채택