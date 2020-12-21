install.packages("httr")
library(httr)
install.packages("raw")
library(raw)
install.packages("jpeg")
library(jpeg)

#포스터 가져오기
url <- "https://movie.naver.com/movie/running/current.nhn"
doc <- read_html(url)

images <- html_nodes(doc, ".thumb img")
src<- html_attr(images, 'src')
src<- html_attr(images, "src")
src