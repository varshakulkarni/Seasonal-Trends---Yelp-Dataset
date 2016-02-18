
review <- data.frame()
location_review <- data.frame()
x <- data.frame()
y <- c()

initializeData <- function(.progress='text'){
  review <- read.csv("D:/UTDallasStudy/Coursework/Fall_15/Big_Data/project/data/category-output-1.csv")
  location_review <- read.csv("D:/UTDallasStudy/Coursework/Fall_15/Big_Data/project/data/output-merged.csv")
  review <- na.omit(review)
  location_review <- na.omit(location_review)
  colnames(review) <- c('category', 'category_id', 'count', 'season','month','year')
  colnames(location_review) <- c('count',	'date',	'year',	'zipcode',	'primary_city',	'state',	'county')
  assign('review',review,envir=.GlobalEnv)
  assign('location_review',location_review,envir=.GlobalEnv)
}

process <- function(y = 'restaurants'){
  y <- assign('y',y,envir=.GlobalEnv)
  rest_review <- review[which(review$category == y ),]
  x1 <- aggregate(rest_review$count, by=list(rest_review$month), FUN = mean)
  png("one.png", width=500, height=400)
  colnames(x1) <- c('month', 'review_count')
  plot(x1$month, x1$review_count,type = "o",
       xlab = "month", ylab = "review count",  main = paste("Seasonal Trend for ", y), pch = 16, 
       col = "dark blue", lwd = 3, cex = 2)
  lines(x1$month, x1$review_count)
  #title(main=y, sub="month", ylab="review count")
  dev.off()
  assign('x',x1,envir=.GlobalEnv)
  x1
}

getImage <- function(x1){
  png("one.png", width=500, height=400)
  plot(x1$month, x1$review_count,type = "o",
       xlab = "month", ylab = "review count",  main = paste("Seasonal Trend for ", y), pch = 16, 
       col = "dark blue", lwd = 3, cex = 2)
  lines(x1$month, x1$review_count)
  #title(main=y, sub="month", ylab="review count")
  dev.off()
}
