# 교육방법에 따라 시험성적에 차이가 있는지 검정

library(readr)
data <- read_csv("C:/wyj/r_project/data/twomethod.csv")
data
head(data)

summary(data) # score의 na값 6개 확인

method <-  data$method
score <-  data$score


# 두 집단 subset 작성(데이터 정제, 전처리)
result <- subset(data, !is.na(score), c(method,score))
result #53 -> 47개


# 교육방법에 따른 데이터 분리
a <- subset(result, method == 1)
a
b <- subset(result, method == 2)
b

a1 <- a$score
b1 <- b$score

length(a1) #22
length(b1) #35

# 두 그룹의 동질성 비교 : 동일하게 분포되어 있는 정도(정규분포를 따르고 있는지)

var.test(a1,b1)
#data:  a1 and b1
#F = 1.0648, num df = 21, denom df = 34, p-value = 0.8494  **0.84 -> 정규분포를 따른다**
#alternative hypothesis: true ratio of variances is not equal to 1
#95 percent confidence interval:
#  0.502791 2.427170
#sample estimates:
#  ratio of variances 
#1.06479 

#연구가설 : a그룹이 b그룹보다 점수가 높다
#귀무가설 : a그룹이 b그룹보다 점수가 낮다

# 동질성이 확보되었으므로, 가설검증은 t.test()를 사용한다.
t.test(a1, b1, alternative = "greater", conf.level = 0.95)

#data:  a1 and b1
#t = -5.6056, df = 43.705, p-value = 1
#alternative hypothesis: true difference in means is greater than 0
#95 percent confidence interval:
#  -16.66255       Inf
#sample estimates:
#  mean of x mean of y 
#16.40909  29.22857 

# pvalue가 1로 귀무가설 기각 연구가설 채택

# 따라서 교육방법에 따라 시험성적에 차이가 있음.