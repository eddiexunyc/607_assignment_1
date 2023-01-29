### Data 607 Assignment 1
### Eddie Xu
### January 29, 2023
---

---
###Load Libraries
library(ggplot2)
library(tidyverse)

---
###read the CSV file
readfile <- data.frame(read.csv("C:/Users/eddie/Data Science Project/607_assignment_1/poll-quiz-guns/guns-polls.csv"))
dim(readfile)
  
head(readfile)
---
###remove a column
poll_df <- readfile %>% select(-c(URL))
head(poll_df)
  
---
###What is the poll support that are greater than 50?
Support_50 <- subset(poll_df, Support > 50)
Support_50

summary(Support_50)

---
###Bar plot
###what is the poll average in gun control by Population?
poll_average_df <- subset(poll_df, select = -c(Start, End, Pollster))
head(poll_average_df)

poll_average_df <- poll_average_df %>%
  select(Population, Support) %>%
  group_by(Population) %>%
  mutate(
    pop_avg = mean(Support)
  )

ggplot(poll_average_df, aes(Population, pop_avg, fill = Population)) + 
         geom_bar(stat = "identity", position = "dodge") +
         labs(title = "Poll Average in Population")
