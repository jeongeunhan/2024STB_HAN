#table()함수/구분 1개의 인자를 가지고 도수분포표 작성
table(survey_80 $Gender)

#  상대도수 계산
ECN <- table(survey_80 $Gender)
prop.table(ECN)#상대 도수로 표시

# table()함수/2개의 인자를 가지고 교차표를 작성
table(survey_80 $Gender, survey_80 $`Grade`)

#막대그래프
barplot(table(survey_80 $Nationality))

install.packages("RColorBrewer")
library(RColorBrewer)#패키지를 라이브러리에 등록

display.brewer.all()#패키지 확인

pal1 <- brewer.pal(5, 'Set3')

#가로막대그래프
barplot(table(survey_80 $`residential area`),col=pal1, xlim=c(0,60), horiz=TRUE)
text(x=entry, y=bp, labels=entry, pos=4)

#2개의 인자로 막대그래프
install.packages("ggplot2")
library(ggplot2)
ggplot(survey_80, aes(x = Gender, fill = Grade)) +
  geom_bar(position = "dodge") +  # 성별로 나누어 학점 분포를 나란히 표시
  labs(title = "성별에 따른 학년 분포", x = "성별",) +
  theme_minimal()

#파이차트
pie(table(survey_80 $Grade))

#히스토그램 작성
hist(survey_80$Age, main="나이 측정분포", col=terrain.colors(12))

#박스플롯

library(ggplot2)
ggplot(survey_80, aes(x = Grade, y = Age)) +
  geom_boxplot() +
  labs(title = "학년별 나이 분포 (Boxplot)", x = "학년", y = "나이") +
  theme_minimal()

# 기술통계 분석
summary(survey_80$Age ~ survey_80$Grade)

boxplot(Age ~ Grade, data = survey_80,
        main = "학년별 나이 분포 (Boxplot)",
        xlab = "학년", ylab = "나이",
        col = "lightblue")

#산점도 만들기 
# 결측값 확인 혹시나해서..
sum(is.na(survey_80$Grade))  
sum(is.na(survey_80$Age)) 
class(survey_80$Grade)
# Grade 변수를 범주형으로 변환
survey_80$Grade <- as.factor(survey_80$Grade)
plot(x=survey_80$Grade, y=survey_80$Age, xlab="학년", ylab="나이", main="학년에 따른 나이 변화")

library(ggplot2)  # 패키지 로드

# ggplot2를 사용하여 산점도 생성
ggplot(survey_80, aes(x = Grade, y = Age)) +
  geom_point(color = "blue") +
  labs(title = "학년별 나이 분포", x = "학년", y = "나이")

