install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)

install.packages("dplyr")
library(dplyr)


con <- dbConnect(MySQL(),
                 user = "root",
                 password = "@Manya27",
                 dbname = "Ezy",host = "localhost")

sql_query <- "SELECT * FROM movies "
data <- dbGetQuery(con, sql_query)

movies=data.frame(data)
movies

movies%>%select(movie_name,rating)

movies%>%select(starts_with("m"))

movies%>%select(ends_with("e"))

movies%>%rename(mid=movie_id)

movies%>%select(matches("(.t.)|(c.)"))

movies%>%filter(rating>=9)

movies%>%slice(1:7)

movies%>%arrange(desc(total_views))

movies%>%top_n(3,likes)

movies%>%summarise(total_collection=sum(total_collection))

movies%>%summarise(Average_Rating=mean(rating))

movies%>%summarise(Dislike=median(dislikes))

movies%>%group_by(categories)%>%summarise(n=n())


# data visualization 

#Scatter plot
plot(movies$rating,movies$total_collection,xlab = "rating",ylab = "Collection_$",col='orange')

#Bar plot
barplot(movies$rating,xlab = "names",ylab = "Rating",col='red')


#Histogram
hist(movies$likes,xlab = "histplot",col = 'blue',border = 'black')

#Pie Chart
df2=movies%>%group_by(categories)%>%summarise(n=n())
df2
v=c("red","pink","yellow","gray")
pie(df2$n,labels=df2$categories,col=v)


#Line chart
plot(movies$rating,type = "o",col='green')


#Box plot
boxplot(movies$rating,main='boxplot')
