library(XML)
library(stringr)

all_reviews <- NULL
#CODE 136900 어벤져스, 등
urlSearch <- "http://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=136900&type=after&onlyActualPointYn=N&order=newest&page="

for (i in 1:2) { #1:2첫번째 리뷰페이지 10건, 두번째 리뷰페이지 10건,2를 100으로 늘리면 100*10건
  temp <- NULL
  url <- paste(urlSearch, i, sep='')
  txt <- readLines(url, encoding="UTF-8")
  
  points <- txt[which(str_detect(txt, "class=\"star_score\""))+2]
  points <- gsub("<.+?>|\t","", points)
  points <- points[c(2:11)]  #한 리뷰 페이지당 데이터가 11건이 나옴 (첫번째의 불필요한행 존재. 때문에 2번째 행부터 11번째 행의 값만 가져옴)
  
  reviews <- txt[which(str_detect(txt, "class=\"score_reple\""))+1]
 
  reviews <- gsub("<.+?>|\t","", reviews)
  reviews <- gsub("관람객","", reviews)
 
   #각 페이지의 10건 리뷰를 temp 변수에 담습니다.
  temp <- cbind(points, reviews)
  # 각 페이지의 10건의 리뷰(temp)를 누적하여 쌓아줍니다.  temp를 계속 이어붙여 주는거죠!
  all_reviews <- rbind(all_reviews, temp)
}

write.table(all_reviews, "C:\\Temp\\movie_review.txt")

