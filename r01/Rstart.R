name <- 'hong'

age <- 100

#comments
age

#install.packages("ggplot2")
install.packages("corrplot") #상관도를 그려주는 라이브러리
install.packages('lattice')

# 파이썬의 import와 같은 역할을 한다.
library(corrplot)
library(lattice)

a=mtcars
a
 
# 변수중 gear와 carb의 상관계수를 산출
mcor2 = cor(mtcars$gear, mtcars$carb)
mcor2

# 상관정도를 파악하기 위해서 산점도를 그려줌
xyplot(gear~carb, data=mtcars)

# 산점도와 회귀선을 그려줌
lm = plot(mtcars$gear, mtcars$carb)
abline(lm((mtcars$gear~mtcars$carb)))

# mtcars 데ㅐ이터 전체 상관 분석
mcor = cor(mtcars)
mcor

# 전체 상관 분석의 소수점이 너무 길어서 소수점 2째 자리까지 정리
round(mcor,2)

# 상관계수를 도표로
corrplot(mcor)

# 여러 도표
plot(mtcars)

# wr와 mpg와의 상관 관계
# 무게와 마일의 상관계소, 그래프 그리기
library(ggplot2)
cor(mtcars$wt, mtcars$mpg)
qplot(wt, mpg, data=mtcars, color=factor(carb))

# 전체 항목 중에서 양의 상관계수가 가장 높은 것은? 배기량(disp)/실린더(cyl)
# 전체 항목 중에서 음의 상관계수가 가장 높은 것은? 무게(wt)/마일(mpg)