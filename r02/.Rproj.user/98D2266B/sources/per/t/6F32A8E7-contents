library(readr)
data <- read_csv("C:/wyj/r_project/data/one_sample.csv")
data

head(data)

summary(data$survey)
length(data$survey)
table(data$gender)

install.packages('prettyR')
library(prettyR)
freq(data$survey) #prttyR의 freq함수 =빈도수 제공, 비율도 제공


#비율검정
binom.test(c(136,14), p=0.8, alternative = 'greater',conf.level = 0.95)
# 95% 신뢰구간
# alternative = 누가 더 큰가


#불만족 비율 기준 검정
binom.test(c(14,150),p=0.2, alternative = 'two.sided',conf.level = 0.95)
