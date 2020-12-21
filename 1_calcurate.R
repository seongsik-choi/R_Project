
x<-c(80, 85, 70)
x
c(80,85,70) ->x
x
y <-c("최성식","최성싣2", "최성식3")
y
choi1<-c(80, 75, 75)
choi1
print(choi1)
choi2<-c(80,80,80)
choi3<-c(110)

##사칙연산
10%%2
10%/%2
5%%3+7**2-9%/%4

choi1+choi2
s<-choi1+choi2
s/2

#choi3이 점수가 하나면 그 점수로 다 더해준다
#배수가 안맞으면 연산 no (Ex.7과 )
choi2+choi3

#배수 안맞는거 확인
kim<-c(1,2,3,4,5,6,7)
kim
kang<-c(1,2,3)
kang
kim+kang

# type 다른거에 더하면 계산이 아예 안됨
aa<-c("hong", 10, 'k')
aa+1

#태그만들기 names 함수
names(choi1)<-c("kor","eng","math")
choi1

names(choi2)<-c("아","메","리")
choi2

#평균값 계산하기
average<-c(choi1, choi2)
average<-c(choi1+choi2)
average
average/2


# true,false
3<5
aa<-c(10, 23, 45, 66)
aa<=14

#하나가 참, 하나가 거짓 두개합하면 거짓
x=TRUE
y=FALSE
x&y
!x

isTRUE(x)
aa<-1:100
aa

# seq 함수 사용! 매개변수 사용
bb<-seq(10,1,by=-3)
bb
cc<-seq(96,10,by=-4)
cc
sum(cc)

dd<-seq(10,100,length.out = 8)
dd

# rep 함수
x<-c(1,2,3)

y<-rep(x, times=2)
y
z<-rep(x, each=2)
z
z[1]
# y벡터의 1, 3, 5번째 값출력
y[c(1, 3, 5)]
# y벡터의 1, 2번째 값 제외출력
y[-c(1,2)]
#y의 값중 1보다 큰값 뽑기
y[y>1]
y[y>1&y<3]
y[2]<-100
y

# y의 값중 2보다 작으면 전부 11로 만들기
y[y<2]<-11
y

#문제
x<-c(1:10)
x
x<-rep(x,times=2)
x
x[x>2&x<4]<-7
x
x[5]=x[5]*2
x  
