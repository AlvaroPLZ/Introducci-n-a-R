###### Class 2
#### Author: Álvaro Pérez (Based on Nick C. Huntington-Klein notes)
#### Date: September 10, 2024

rm(list=ls()) #delete everything in memory
library(stargazer)
library(tidyverse)
library(ggplot2)

#create a dataframe
df <- data.frame(
  RacePosition = 1:5,
  WayTheySayHi = as.factor(c('Hi','Hello','Hey','Yo','Hi')),
  NumberofKids = c(3,5,1,0,2))
#view the data frame
df
#view the data like a spreadhseet using the Rstudio viewer
View(df)

#check out the structure of the data
str(df)

#You can call a column with "$" and you get a vector, which you can treat like any vector
df$NumberofKids
df$NumberofKids[2]
df$NumberofKids >= 3

#Many ways to call a column 
df$NumberofKids >= 3
df[,3] >= 3 
df[,'NumberofKids']>=3

#Run some calculations on different vectors
mean(df$RacePosition)
df$WayTheySayHi[4]
sum(df$NumberofKids <= 1)

#Some practice
df2 <- data.frame(a = 1:20,
                  b = 0:19*2,
                  c = sample(101:200,20,replace=TRUE))

mean(df2$c)
sum(df2$a*df2$b)
sum(df2$c <= 103) > 0
df2$b[8]
sum(df2$b > 10 & df2$c < 150)


#Creating a new variable
df$State <- c('Alaska','California',
              'California','Maine',
              'Florida')
df


#Install tidiverse
#install.packages('tidyverse')
library(tidyverse)

#Creating a new variable with mutate/tidiverse, two different ways

df1 <- df %>% mutate(State = c('Alaska','California',
                               'California','Maine','Florida'))

df2 <- mutate(df,State = c('Alaska','California',
                           'California','Maine','Florida'))

#check they are indeed the same
identical(df1,df2)

#keep one of them, doesnt matter which one
df <- df1

#creating more variables
df <- df %>% mutate(
  MoreThanTwoKids = NumberofKids > 2,
  One = 1,
  KidsPlusPosition = NumberofKids + RacePosition)

df



#manipulating some variables
df <- df %>% 
  select(-KidsPlusPosition,-WayTheySayHi,-One) %>%
  mutate(State = as.factor(State),
         RacePosition = RacePosition - 1)
df$State[3] <- 'Alaska'
str(df)

#Renaming variaables
names(df)
#two ways of renaming

#names(df) <- c('Pos','Num.Kids','State','mt2Kids')

df <- df %>% rename(Pos = RacePosition, Num.Kids=NumberofKids,
                    mt2Kids = MoreThanTwoKids)

names(df)


#Some practice
data <- data.frame(a = 1:10*2,
                   b = c(0,1),
                   c = sample(1:100,10,replace=FALSE)) %>%
  rename(EvenNumbers = a, Treatment = b, Outcome = c)

data <- data %>%
  mutate(Big = EvenNumbers > 15,
         Outcome = Outcome + Treatment,
         AboveMean = Outcome > mean(Outcome))

#Download US elections data