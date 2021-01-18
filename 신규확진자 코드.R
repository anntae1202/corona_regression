
setwd("c:\\data")
df <- read.csv("dataset(raw)1.csv",  header = T, stringsAsFactors = FALSE)
df
# 걍 일자 삭제함

#colSums(is.na(df))
names(df)[7] <- c("기온")
names(df)[8] <- c("습도")
names(df)[12] <- c("강수량")


install.packages('car')
library(car)

install.packages("prediction")
library(prediction)

install.packages("ggplot2")



reg_func <- function(){
  fname <- file.choose() # 윈도우 탐색기 열리게 하는 코드
  df1 <- read.csv(fname,  header = T, stringsAsFactors = FALSE)
  
  library(car)
  library(prediction)
  
  names(df1)[7] <- c("기온")
  names(df1)[8] <- c("습도")
  names(df1)[12] <- c("강수량")
  df <- df1
 

  
  driving<-as.numeric(readline('아이폰 유저의 차량 이동성지수는 몇인가요? (100기준) '))
   walking<-as.numeric(readline('아이폰 유저의 도보 이동성지수는 몇인가요? (100기준) '))
   
   강수량<-as.numeric(readline('강수량이 얼마나 되나요? (0~) '))
   
   통합먼지지수<-as.numeric(readline('미세먼지와 초미세먼지의 평균값은 몇인가요? '))
   
   습도 <-as.numeric(readline('습도는 몇인가요? (0 ~)'))
   통합모기지수 <-as.numeric(readline(' 평균모기지수는 몇인가요?(0~)'))
   
   열지수 <-as.numeric(readline('열지수는 몇인가요?'))
   기온 <-as.numeric(readline('기온은 몇 도인가요?'))
   유입량평균 <-as.numeric(readline('서울시의 하루평균 교통유입량은 몇인가요?(500~900)'))
   유출량평균 <-as.numeric(readline('서울시의 하루평균 교통유출량은 몇인가요?(500~900)'))
   버스승차량평균 <-as.numeric(readline('서울시의 하루평균 버스승차량은 몇인가요?(40~160)'))
   버스하차량평균 <-as.numeric(readline('서울시의 하루평균 버스하차량은 몇인가요?(40~160)'))
   지하철승차량평균 <-as.numeric(readline('서울시의 하루평균 지하철승차량은 몇인가요?(4400~19000)'))
   지하철하차량평균 <-as.numeric(readline('서울시의 하루평균 지하철하차량은 몇인가요?(4400~19000)'))
   
                   
  
  test <- data.frame(driving=driving, walking=walking, 강수량=강수량,
                     통합먼지지수=통합먼지지수,통합모기지수=통합모기지수, 습도 = 습도, 열지수 = 열지수,
                     기온=기온, 유입량평균=유입량평균, 유출량평균=유출량평균,
                     버스승차량평균=버스승차량평균, 버스하차량평균=버스하차량평균,
                     지하철승차량평균=지하철승차량평균, 지하철하차량평균=지하철하차량평균)
  
  
  df$driving2=ifelse(df$driving<=60,1,0)
  df$rain <- ifelse(df$강수량>10,1,0)
  
  df$intt <- (df$지하철승차량평균 + df$버스승차량평균)
  df$outt <- (df$지하철하차량평균 + df$버스하차량평균)
  
  df$traf <- ifelse(df$intt>13000&df$intt<15000&df$outt<15000&df$outt>13000,1,0)
  df$car <- ifelse(df$유입량평균>700&df$유출량평균<750,1,0)
  df$hot <- ifelse(df$열지수>7&df$walking<80&df$기온>11&df$기온<19,1,0)
  df$불쾌지수<- 1.8*df$기온 -0.55*(1-(df$습도/100))*(1.8*df$기온-26)+32
  df$불쾌지수2 <- ifelse(df$불쾌지수>40&df$불쾌지수<50,1,0)
  df$swarmp2 <- ifelse(df$습도>50&df$습도<78&df$강수량<15,1,0)
  df$mogi<- ifelse(df$통합모기지수>10,1,0)
  df$dust <- ifelse(df$통합먼지지수>30&df$통합먼지지수<40,1,0)
  df$driving1 <- ifelse(df$driving>67 & df$불쾌지수 > 48,1,0)
  df$bus=df$버스승차량평균 + df$버스하차량평균
  df$sub=df$지하철승차량평균 + df$지하철하차량평균
  df$bus1=ifelse(df$bus>200,1,0)
  df$sub1=ifelse(df$sub>15000&df$sub<35000,1,0)
  
  
  test$driving2=ifelse(test$driving<=60,1,0)
  test$rain <- ifelse(test$강수량>10,1,0)
  
  test$intt <- (test$지하철승차량평균 + test$버스승차량평균)
  test$outt <- (test$지하철하차량평균 + test$버스하차량평균)
  
  test$traf <- ifelse(test$intt>13000&test$intt<15000&test$outt<15000&test$outt>13000,1,0)
  test$car <- ifelse(test$유입량평균>700&test$유출량평균<750,1,0)
  test$hot <- ifelse(test$열지수>7&test$walking<80&test$기온>11&test$기온<19,1,0)
  test$불쾌지수<- 1.8*test$기온 -0.55*(1-(test$습도/100))*(1.8*test$기온-26)+32
  test$불쾌지수2 <- ifelse(test$불쾌지수>40&test$불쾌지수<50,1,0)
  test$swarmp2 <- ifelse(test$습도>50&test$습도<78&test$강수량<15,1,0)
  test$mogi<- ifelse(test$통합모기지수>10,1,0)
  test$dust <- ifelse(test$통합먼지지수>30&test$통합먼지지수<40,1,0)
  test$driving1 <- ifelse(test$driving>67 & test$불쾌지수 > 48,1,0)
  test$bus=test$버스승차량평균 + test$버스하차량평균
  test$sub=test$지하철승차량평균 + test$지하철하차량평균
  test$bus1=ifelse(test$bus>200,1,0)
  test$sub1=ifelse(test$sub>15000&test$sub<35000,1,0)
  
  
  
  
  m2 <-lm( 신규확진자수 ~ traf+bus1*불쾌지수2+sub1+driving1+car*불쾌지수2+mogi+강수량*불쾌지수2+dust+습도+swarmp2+driving+swarmp2*hot+rain+hot+기온+불쾌지수2+swarmp2*불쾌지수2, data=df)
  print(summary(m2))
  
  m2_p <- predict(m2, test)
  
  print(paste('신규 확진자는 ',round(m2_p),'명으로 예상됩니다.'))
  
}



reg_func()


summary(df)
