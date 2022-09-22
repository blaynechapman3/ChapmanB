#task #4

#Practice using dplyr
library(tidyverse)

#look at our iris data 
str(iris)
head(iris)
tail(iris)

#Now Make the iris data Set a tible 
iris_data <- as_tibble(iris)
arrange(iris_data, Sepal.Length)
#This shows the data in smallest sepal Length to Largets 
#If WE wanted it to be descending it would look like this
arrange(iris_data,desc(Sepal.Length))

#Make a new data frame by selecting only species and petal.Width
testdat <- select(iris, Petal.Length, Species)
head(testdat)
tail(testdat)

#Create a new table called species_mean that has the mean for each variable for each Species.
Group_species <- group_by(iris, Species)
species_mean <- summarise( Group_species,
  Sepal.Length = mean(Sepal.Length, na.rm = TRUE),
  Sepal.Width = mean(Sepal.Width, na.rm = TRUE),
  Petal.Length = mean(Petal.Length, na.rm = TRUE),
  Petal.Width = mean(Petal.Width, na.rm = TRUE)
)

head(species_mean)

#Create a data frame called iris_min with only the observations with at least 3 for Sepal.Width and not 2.5 for Petal.Width.
iris_min <- filter(iris, Sepal.Width >= 3, Petal.Width != 2.5)
head(iris_min)
#I THoought we might be using a mutate but we actauly just filtering the data to pull everything that doesnt meet the criteria.

#*****HELP ON THIS QUESTION
#Create a data frame called iris_size with a column Sepal.Size which is
iris_size <- transmute(iris,
                       Species,
                       Sepal.Length,
                       Sepal.Width,
                       Petal.Length,
                       Petal.Width,
                       Sepal.Size = c(small==Sepal.Length<5, medium==between(Sepal.Length,5,6.5),Large==Sepal.Length<6.5))

# Create a data frame called iris_rank which ranks all of the data by Petal.Length, where a ranking of 1 is the largest Petal.Length and order by ranking.
iris.rank <- arrange(iris, desc(Petal.Length))
head(iris.rank)
tail(iris.rank)
#From this ranking we can see that the Virginica species has the biggest Petal Lengths and Setosa has the smallest.


#Read about the ?summarize_all() function and get a new table with the means and standard deviations for each species
?summarise_all(iris, mean)
#how to make a table.
