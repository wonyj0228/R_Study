library(readr)
data <- read_csv("C:/wyj/r_project/data/two_sample.csv")
head(data)


#subset1 <-  subset(data, select = c(gender, survey))
#subset1

x <- data$gender
x

y <-  data$survey
y

table(x)
table(y)

table(x,y, useNA = "ifany")
prop.test(
  c(138, 107),
  c(174, 126),
  conf.level = 0.95
)
# p-value : 0.27
# 차이가 거의 없다!
# two.sided : 대립가설에 대한 p-value로 귀무가설 채택을 결정함
# 귀무가설 : 두 모집단의 만족도는 차이가 없다.
# 대립가설 : 두 모집단은 만족도는 차이가 있다.
# 대립가설에 대한 p-value가 0.05보다 크기때문에 만족도 차이가 있다는 대립가설 기각
# 따라서 귀무가설 채택!
