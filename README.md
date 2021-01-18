# corona_regression

2020 7월 코로나 확진자수 예측을 위한 회귀분석 모델을 제작을 목표로 했습니다.

1~6월 아이폰 이용자의 이동성 데이터와 교통카드 이용내역을 활용하였고

새로운 파라미터를 생성하여 설명량을 30% 증가시켰습니다.

# 1. 데이터셋(2020.1~6월)

### 1) 애플 이동성 데이터
출처 : https://covid19.apple.com/mobility \
추출데이터 : Driving, walking

### 2) 서울시 교통량 데이터
출처 : https://topis.seoul.go.kr/refRoom/openRefRoom_2.do \
추출데이터 : 시간대 별 유입량, 유출량


### 3) 교통카드이용내역
출처 : 버스 https://data.seoul.go.kr/dataList/OA-12913/S/1/datasetView.do \
지하철 : https://data.seoul.go.kr/dataList/OA-12252/S/1/datasetView.do \
추출데이터 : 시간대별 버스승차량, 버스하차량, 지하철 승차량, 지하철 하차량

### 4) 열지수 데이터
출처 : https://data.kma.go.kr/climate/heatIndex/selectHeatIndexChart.do?pgmNo=101 \
추출데이터 : 기온 데이터, 습도 데이터, 열지수

### 5) 미세먼지
출처 : https://data.seoul.go.kr/dataList/OA-2218/S/1/datasetView.do \
추출데이터 : 미세먼지, 초미세먼지

### 6) 모기 지수
출처 : https://data.seoul.go.kr/dataList/16/literacyView.do \
추출데이터 : 모기 지수(수변부, 주거지, 공원)

### 7) 강수량
출처 : https://data.kma.go.kr/stcs/grnd/grndRnList.do?pgmNo=69 \
추출데이터 : 강수량(mm)


# 2. 데이터 전처리




