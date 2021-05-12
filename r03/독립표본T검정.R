library(readr)
data <- read_csv("C:/wyj/r_project/data/two_sample.csv")
View(data)

head(data)
summary(data) # score에 na 73개 있음

# 연구가설(H1)대립가설 : 교육방법에 따른 두 집단 간 실기시험의 평균에 차이가 있다.
# 귀무가설(H0)영가설 : 교육방법에 따른 두 집단 간 실기시험의 평균에 차이가 없다.

#method = 교육방법
#score = 실기시험점수
class(data) # type()과 같은 것

result <- subset(data, !is.na(score), c(method, score))
# score가 na가 아닌 항목 추출 (subset=조건)
# method, score 항목만 가져오기 (select)
result

length(result$score) #290개 -> 227됨

#교육방법 분리
#method 1 = pt / mothod 2 = 코딩
a <- subset(result, method == 1)
a #pt교육(방법,점수)
b <- subset(result, method == 2)
b #코딩교육(방법,점수)

# 교육방법에 따른 점수를 추출해보자.
a1 <- a$score
b1 <- b$score

length(a1) #109
length(b1) #118

# 두 그룹의 동질성 비교 : 동일하게 분포되어 있는 정도(정규분포를 따르고 있는지)
var.test(a1,b1)
# p-value = 0.30
# 정규분포를 따른다. (정규성/등분산성)

# 동질성이 확보되었으므로, 가설검증은 t.test()를 사용한다.
t.test(a1, b1, alternative = "greater", conf.level = 0.95)

#Welch Two Sample t-test

#data:  a1 and b1
#t = -2.0547, df = 218.19, p-value = 0.9794   **귀무가설 기각! 대립가설 채택 a1<b1**
#alternative hypothesis: true difference in means is greater than 0
#95 percent confidence interval:
#  -0.4446915        Inf
#sample estimates:
#  mean of x mean of y 
#5.556881  5.803390 

