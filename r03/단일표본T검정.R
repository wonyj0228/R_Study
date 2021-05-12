#########단일표본 T검정#############
library(readr)
data <- read_csv("C:/wyj/r_project/data/one_sample.csv")
head(data)
x <- data$time # A회사 노트북 사용 시간
x
#방법 1
summary(x) #결측치 41개 존재
mean(x, na.rm = T) #결측치 제거하고 평균
#방법 2
x1 <- na.omit(x)
x1

shapiro.test(x1) #정규분포인지 아닌지 파악
#p-value = 0.7242 > 0.05 따라서 정규분포를 따름(P-value가 0.05보다 크다 = 정규분포를 따른다)

hist(x1)
#정규분포를 따르기 때문에 t검정
#평균사용시간이 5.2시간 차이가 난다 => 양측검증증
t.test(x1, mu = 5.2, alternative = 'two.sided', conf.level = 0.95) # x1 : 표본집단 평균 , mu : 모집단의 평균
#p-value : 0.0001417 ~> A사 노트북의 평균 사용시간은 5.2시간보다 차이가 있다