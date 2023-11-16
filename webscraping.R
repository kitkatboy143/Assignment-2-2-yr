#importing library
library(rvest)
library(dplyr)
library(robotstxt)

#scarping website
url<- "https://www.imdb.com/list/ls076828102/"
#path= paths_allowed(url)

web <- read_html (url)
View(web)
names<- web %>%html_nodes(".lister-item-header a") %>% html_text()
View(names)

type<- web %>%html_nodes(".text-muted a") %>% html_text()
View(type)

model<- web %>%html_nodes(".list-description p") %>% html_text()
View(model)

#create data frame 
movie = data.frame(names,model,type)
View(movie)

write.csv(movie,"imdb_movies.csv")

str(movie)


