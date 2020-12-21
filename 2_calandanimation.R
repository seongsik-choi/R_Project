#문자벡터 생성 후 숫자값 넣기
a<-c("hong",'kim',"lee")
a
hong<-c(80,75,85)
hong
print(hong)
c(70,75,79)->kim
kim
lee<-c(100)
lee
lee<-100
lee

## 사칙연산
5+4
10-3
7*3
8/3
11%%3
11%/%3
2^4
2**4

## 요거 시험 
a<-5%%3+7**2-9%/%4
a

# 값 더하기(hong, kim은 각각 국,영,수 점수 3개보유, lee는 국어 보유)
hong
kim <- c(70, 40, 30)
lee
## 평균 구하기(같은 값)
hong+kim
s<-hong+kim
s
s/2
## lee는 점수가 하나인겨우, 배수가 맞으면(3:1) 나머지값은 lee값 더함
lee
s1<-hong+lee
s1

## oding의 점수가 2개인경우, hong과 더하기
hong
oding <-c(50, 50)
oding
hong+oding

## 전체값 하나씩 다 더해줌
kim<-kim+10
kim+10

## 벡터에 문자열이 섞여있을 때 숫자더하면 에러
a<-c("hong",10,'k')
a+1

### 홍에 태그 만들기 names
names(hong)<-c("국어","영어","수학")
hong

## hong, kim 더해서 평균구하기(names 태그는 남아있음)
kim
avg <-c(hong+kim)/2
avg

## true false
3<5
aa<-c(10,16,30,7)
aa<16
x=TRUE; y=FALSE
x&y
!x
isTRUE(y)

### 문제 : 벡터에 1부터 10까지 수, 두번반복, 3인값들을 7로
## 태어난 달 부분(12) 2배, 짝수인 수들 전부 +1, 
## 12보다 큰값 전부 13으로, 3보다 작은수 5로, 마지막 벡터의 합
a<-c(1:10); a
a<-rep(a, times=2); a
a[a==3]<-7; a
a[12]=a[12]*2;  a
a[a%%2<1]<-a[a%%2<1]+1; a
a[a>12]<-13; a
a[a<3]<-5; a
sum(a)


#### 9월 18일 배열~데이타 프레임

x<-seq(1:10)
sum(x)

x<- 1:10
x

x<-seq(10,1)
x

y<- 10 : 1
y

x<- seq(1, 10, by=3)
x

y<- seq(1, 10, length.out = 5)
y

##### rep(x, times or each) / 반복함수
x<-c(1, 2, 3); x
rep(x, times=2)
rep(x, each=2)

x<-c(1,2,3,4,5)
x[2]

x[c(1,3,5)]

# 평균, 분산, 표준편차, 제곱근, 원소개수, 절대값
x<-seq(1:10); sum(x)
mean(x)
var(x)
sd(x)
sqrt(x)
length(x)
x<-c(1,2,-3)
abs(x)


## X가 null인경우 true 반환
x<-NULL;  is.null(x) 
y<-c(1, 2, 3, NA, 5);  y
z<-10/0; z
w<-0/0; w

# 배열 array(data, dim(차원), [dimnames])
x<-array(1:3, dim=c(3)); x
x<- array(c(2,4,6,8,10,12), dim = c(2,3)); x
names <- list(c("1행", "2행"), c("1열","2열","3열"))
x<- array(c(2,4,6,8,10,12), dim = c(2,3), dimnames = names); x

#배열의 값 뽑기(2행이라는 이름을 갖는 행의 모든 값, 1행 3열 값,
# 3열값 제외 배열, 3열의 모든값, 1행 2열의 값을 20으로 바꾸기)
x["2행",] 
x[1,3]
x[,-3]
x[,3]
x[1,2]<-20; x

### 행열 이름 주석## names
names<-list(c("1행","2행","3행"), c("1col,","2col"))
x<-array(1:6,dim=c(3,2,10),dimnames=names)
x



## 행렬matrix(datam, nrow(행개수), ncol(열), byrow(data의)


##문제 홍길동의 손오공의 데이터 프레임

x<- data.frame(성명=c("홍길동", "손오공"), 나이=c(20,30), 주소=c("서울", "부산"))
x
x<-cbind(x,학점=c("B","A+"))
x

x<-rbind(x, data.frame(성명="최성식", 나이=24, 주소="일산", 학점="C+"))
x

x<-rbind(x, data.frame(성명="김진아", 나이=24, 주소="파주", 학점="A+"))
x
x["성명"]
x$성명
x[["성명"]]
x[[1]][2]
# df의 factor 값 수정(주소의 유형이 default인 facotr로
# 인식 -> 이것을 문자형으로 변환하여 변환/ 3열의 값)
str(x)
x[3] <- lapply(x[3], as.character); str(x)

##p94

quakes
Nile
head(quakes, n =10)


tail(quakes, n=9)


names(quakes)
#구조
str(quakes)

dim(quakes)
summary(quakes)
# 지진의 강도만 출력 
summary(quakes$mag)


#파일 만들기
a<-head(quakes, 20)
a
write.table(a, "C:/Temp/a.csv", sep = ",")
x<-read.csv("C:Temp/quakes.csv", header = T)


url<- "https://vincentarabundock.github.io/Rdatasets/csv/datasets/Titanic.csv"
x<-read.csv(url)
x


## 엑셀파일 다운 패키지 + quakes 엑셀로 저장

install.packages("xlsx"); library(xlsx)
install.packages("readxl") ;library(readxl)
write.xlsx(quakes, "C:/Temp/quakes.xlsx")




# ####4장

#기본 파이차트
windows()
x <- c(9, 15, 20, 6)
label <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
pie(x, labels=label, main="부서별 영업 실적")

# p.120
# 기준선 변경
pie (x, init.angle=90, clockwise=T,labels=label, main="부서별 영업 실적")

# 색과 라벨 수정
pct <- round(x/sum(x)*100)
label <- paste(label, pct)
label <- paste(label,"%",sep="a")
pie(x,labels=label, init.angle=90, col=rainbow(length(x)), main="부서별 영업 실적")

# p.122
# 3D 파이 차트
install.packages("plotrix")
library(plotrix)
pie3D(x,labels=label, explode=0.1, labelcex=0.8, main="부서별 영업 실적")

# p.124
# 기본 바 차트 출력
height <- c(9, 15, 20, 6)
name <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
barplot(height, names.arg=name, main="부서별 영업 실적")

# p.125
# 막대의 색 지정
barplot(height, names.arg=name, main="부서별 영업 실적", col=rainbow(length(height)))

# p.126
# x, y축의 라벨과 크기
barplot(height, names.arg=name, main="부서별 영업 실적", 
        col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)")
barplot(height, names.arg=name, main="부서별 영업 실적", 
        col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)", ylim=c(0,25))

# p.127
# 데이터 라벨 출력
bp <- barplot(height, names.arg=name, main="부서별 영업 실적",
              col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)", ylim=c(0,25))
text(x=bp, y=height, labels=round(height,0), pos=3)   

bp <- barplot(height, names.arg=name, main="부서별 영업 실적",
              col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)", ylim=c(0,25))
text(x=bp, y=height, labels=round(height,0), pos=4)

# p.128
# 바 차트의 수평 회전(가로 막대)
barplot(height, names.arg=name, main="부서별 영업 실적",
        col=rainbow(length(height)),
        xlab="영업 실적(억 원)", ylab="부서", verti=TRUE, width=50)

# p.130
# 스택형 바 차트(Stacked Bar Chart)        
height1 <- c(4, 18, 5, 8)
height2 <- c(9, 15, 20, 6)
height <- rbind(height1, height2)
height

name <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
legend_lbl <- c("2014년", "2015년")

barplot(height, main="부서별 영업 실적",
        names.arg=name,
        xlab="부서", ylab="영업 실적(억 원)",
        col=c("darkblue","red"),
        legend.text=legend_lbl,
        ylim=c(0, 35))

# p.131        
# 그룹형 바 차트(Grouped Bar Chart)
barplot(height, main="부서별 영업 실적",
        names.arg=name,
        xlab="부서", ylab="영업 실적(억 원)",
        col=c("darkblue","red"),
        legend.text=legend_lbl,
        ylim=c(0, 30),
        up=TRUE,
        args.legend=list(x='bottom'))

# p.133        
# 일반적인 X-Y 플로팅
women
weight <- women$weight
plot(weight)

# p.134
height <- women$height
plot(height, weight, xlab="키", ylab="몸무게")

# p.137
# 
# 플로팅 문자의 출력 
#plot(height, weight, xlab="키", ylab="몸무게",type="b")
plot(height, weight, xlab="키", ylab="몸무게", pch=22,
     col="blue", bg="yellow", cex=1.5)

# p.139
# 지진의 강도에 대한 히스토그램
tail(quakes)
mag <- quakes$mag
mag
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수")

# p.141
# 계급 구간과 색 
colors <- c("red", "orange", "yellow", "green", "blue", "navy", "violet")
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수",
     col=colors, breaks=seq(4, 6.5, by=0.5))

# p.142
# 확률밀도
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="확률밀도",
     col=colors, breaks=seq(4, 6.5, by=0.5), freq=FALSE)     
lines(density(mag)) 

# p.144
# 계급의 수
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="확률밀도",
     col=colors, breaks="Sturges", freq=FALSE)

# p.146
# 박스 플롯     
mag - quakes$mag
min(mag)
max(mag)
median(mag)
quantile(mag, c(0.25, 0.5, 0.75))
boxplot(mag, main="지진 발생 강도의 분포", xlab="지진", ylab="발생 건수",col="red")

#################################### 


# 6장
# p.159
# 숫자 출력: 카운트 다운(10에서 1까지)
install.packages("animation")
library(animation)
ani.options(interval = 1)

plot.new()
for (i in 10:0) {
  rect(0, 0, 1, 1, col="yellow")
  size = 11-i
  text(0.5, 0.5, i, cex=size, col=rgb(0,0,1,1)) 
  ani.pause()
}

# p.165
# 1초 간격으로 그래프 그리기
#library(animation)
#ani.options(interval = 1)
#####애니메이션 중지는 빨간공 클릭해야 중지됨#####
while(TRUE) {
  y <- runif(5, 0, 1)
  barplot(y, ylim = c(0, 1), col=rainbow(5))
  ani.pause()
}

# p.168
# 굴러가는 공
library(animation)
library(png)
ani.options(interval = 0.5)
plot.new()
rect(0, 0, 1, 1, col="yellow")
for (i in 1:6) {
  img <- paste("C://temp//ball", i, ".png", sep="")
  #img <- paste("C://[0] Lecture//temp//ball", i, ".png", sep="")
  img <- readPNG(img)
  rasterImage(img, 0, 0, 1, 1)
  ani.pause()
}
dev.off()

########### end #############


