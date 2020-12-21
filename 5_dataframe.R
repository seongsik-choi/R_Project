x <- list("홍길동", "2016001", 20, c("IT융합", "데이터 관리"))
x
y <- list("성명"="홍길동", "학번"="2016001", 
          "나이"=20, "수강과목"=c("IT융합", "데이터관리"))
y
x <- data.frame(성명=c("홍길동", "손오공"), 나이=c(20, 30)
                  ,주소=c("서울","부산"))

x <-cbind(x.학과=c("전산학","경영학"))

x <- data.frame(성명=c("홍길동", "손오공"), 나이=c(20, 30)
                  ,주소=c("서울","부산"))
x <-cbind(x,학과=c("전산학", "경영학"))
x <-rbind(x,data.frame(성명="최성식", 나이=24, 주소="일산", 학과="정통과"))
x
x[3, 2]
x[2, 2]
x[3,]
x[,2]
x[-2,]
x["학과"]
x["나이"]
x$학과
x$학과[2]
quakes
head(quakes, n = 10)
tail(quakes ,n = 6)
head(quakes, )
names(quakes)
str(quakes)
dim(quakes)
summary(quakes)
summary(quakes$mag)
write.table(quakes, "c:/temp/quakes.txt", sep=";")
xx<- read.csv("c:/temp/quakes.txt", header=T)
x
str(x)
url <-"https://vincentarelbundock.github.io/Rdatasets/csv/datasets/Titanic.csv"
z<-read.csv(url)
z
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/Titanic.csv"
y <-read.csv(url)
y
str(y)
# p 101원의 면적을 구하는 함수의 정의와 호출
getCircleArea <- function(r){
  area <- 3.14 * r^2
  return(area)
}
getCircleArea(3)

getRectangleArea <- function(a,b){
  recarea <-  a*b
  return(recarea)
}
getRectangleArea(2, 3)

x<-c(1:10)
x
getSumBec <-function(a){
  s1 <-sum(a)
  m1<-mean(a)
  result<-c(s1, m1)
  return (result)
}
getSumBec(x)
