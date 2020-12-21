x<-c(2,4,6,8) 
x
y<-5+4
y
z=4-6
XX<-c(1,3,6,9)
YY<-XX+1
YY
xx<-3**5
x
xxx<-c("hong",1,'kim')
xxx
a<-5>3
a
b<-c(10,3,9)
c<-b<=10
c<-TRUE
d=10
e<-TRUE
d&e
isTRUE(c)
c<-FALSE

x1<-seq(1,10)
x1
x2<-1:10
x3<-seq(1,10,by=4)
x3
x4<-seq(1,10,length.out = 6)
x4
rep(x4, times=3)
rep(x,each=4)
x4
x4[3]
x4[c(1.3)]
x4[-c(1,3)]
x4[c(2,4)]<-12
x4
sum(x4)
var(x4)
sd(x4)
sqrt(x4)
length(x4)
y1<-NULL
is.null(y1)
y2<-c(1,2,3,NA,5)
y2
z1<-array(1:3, dim=3)
z1
z2<-array(1:6, dim=c(3,2))
z2
z2[1,2]
z2[,2]
z2[-1,]
names<-list(c("1행","2행","3행"), c("1col,","2col"))
z3<-array(z2,dim=c(3,2),dimnames=names)
z3
z3["1행",]
z3[,"1col"]
zz<-array(1:24,dim=c(2,3,4))
zz
zz
s<-matrix(1:6, nrow = 2)
names<-list(c("1행","2행","3행"), c("1col,","2col"))
matrix(1:6,nrow = 3, byrow = TRUE, dimnames = names)

v1<-c(1,2,3,4)
v2<-c(0,9,7,8)
v3<-c(6,7,8,9)
v<-cbind(v1, v2, v3)
v
vv<-rbind(v1, v2, v3)
v
rownames(vv)<-c("1r", "2r", "3r")
vv
colnames(vv)<-c("1열", "2열", "3열", "4열")
vv
 