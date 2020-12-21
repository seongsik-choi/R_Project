# �ܼ��� ��Ʈ
height <- c(9, 15, 20, 6, 7)
name <- c("����1��", "����2��", "���� 3��", "���� 4��", "���� 5��")
barplot(height, names.arg=name, main="�μ��� ��������", col=rainbow(length(height)), xlab="�μ�", ylab="��������(���)")

### barplot �ڵ��ض� ����
height <- c(19, 15, 20, 6, 7)
name <- c("�����", "���", "����", "�ӽý�", "ä��")
barplot(height, names.arg=name, main="2019�� 2�б� ����", col=rainbow(length(height)), xlab="������", ylab="����")


# �ܼ����� ��Ʈ
x<- c(9, 15, 20, 6)
label <-c("����", "�ݶ�", "����", "�Ǹ�")
pct<-round(x/sum(x)*100)
label<-paste(label ,pct)
pie(x,labels=label,main = "�Դ¾�")

# 106 ���� ��� : ī��Ʈ �ٿ� (10 ���� 1, 99���� 1����)
install.packages("animation") 
library(animation)
ani.options(interval=1)
plot.new()
for(i in 10:0){
  rect(0, 0, 1, 1, col = "yellow")
  text(0.5, 0.5, i, cex=5, col=rgb(.2,.2,.2,.7))
  ani.pause()
}
num <- seq(99, 0, by= -1)
ani.options(interval = 1)
plot.new()
for(i in num){
  rect(0, 0, 1, 1, col = "yellow")
  text(0.5, 0.5, i, cex=5, col=rgb(.2,.2,.2,.7))
  ani.pause()
}

# 110 Ű����� �󵵼��� ���� ���� Ŭ���� ���
install.packages("wordcloud")
install.packages("RColorBrewer")

library(wordcloud)
library(RColorBrewer)

pal2<- brewer.pal(7, "Dark2")

x<- c("����", "����", "��������", "�ؿ�", "�� �̸�")
y<- c(7, 5, 3, 3, 3)
wordcloud(x, y, colors=pal2)

# 112 ����
interation <- 5000
plot(0, 0, xlab="��������Ƚ��", ylab= "�ո��� ������ ����", xlim=c(0,interation), ylim=c(0,1))
abline(a=0.5, b=0, col="red")

count<- 0

for(x in 1: interation){
  y <-sample(c("�ո�", "�޸�"), 1, replace=T)
  if(y == "�ո�")
    count = count + 1
  prob <- count / x
  points(x, prob)
}