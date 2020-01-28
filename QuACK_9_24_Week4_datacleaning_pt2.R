
### QuACK 9/24/19

#### Set global options ###
options(stringsAsFactors=FALSE)


#### Warm up ####

# Using the built-in dataset PlantGrowth, do the following:
# Remember, you can look back at your notes from last week, but try to do each one before looking!
# Or at least think through the logic before looking!

# A) Examine the structure of the data frame: 

# What is the structure of the data? (e.g., what are the data types of each column?)
str(PlantGrowth)

# How many rows? 
nrow(PlantGrowth)

# How many columns? 
length(PlantGrowth)
ncol(PlantGrowth)

# How many plants are in each group? (column 2 is group)
table(PlantGrowth$group)
summary(PlantGrowth)

# B) Make a new data frame that has data only for the control group 
# (Bonus: can you do this two different ways?)
with()
ctrl.data <- subset(PlantGrowth, group == "ctrl")
ctrl.data2 <- PlantGrowth[PlantGrowth$group == "ctrl",]


#### Class ####
# Let's learn about an important package in R!
# First need to install the package (only do this once!)
# Import the package:
library(tidyverse)


# Load the data and make Species a factor (as before) [Adapt this to be for your computer!]
#Iris <- read.csv('iris.csv') %>% drop_na()
#Iris$Species<- as.factor(Iris$Species)

Iris <- iris

## Subsetting with dyplr ##

## Select only the veriscolor species

Iris.Versi <- subset(Iris, Species=="versicolor")
summary(Iris.Versi$Species)
table(Iris.Versi$Species)

# Now with dplyr
Iris.Versi_dplyr <- Iris %>% 
  filter(Species == "versicolor")

# Select both setosa and versicolor
Iris.noVir <- subset(Iris, Species=="versicolor" | Species == "setosa")

Iris.noVir <- subset(Iris, Species %in% c("versicolor","setosa"))

Iris.noVir <- subset(Iris, Species!="virginica")

# Now with dplyr
Iris.noVir_dplyr <- Iris %>% 
  filter(Species %in% c("versicolor","setosa"))


# Select only the versicolor species with a Sepal.Length  =/> 5.5 
Iris.Versi <- subset(Iris, Species == "versicolor" & Sepal.Length >= 5.5)

# Now with dplyr
Iris.Versi_dplyr2 <- Iris %>% 
  filter(Species == "versicolor", Sepal.Length >= 5.5)


# Same as above, select only versicolor specieis with a Sepal.Length = or > 5.5. This time ONLY store the Sepal.Length colomn.

Iris.Versi <- subset(Iris, Species == "versicolor" & Sepal.Length >= 5.5, select = c(Sepal.Length, Sepal.Width))
summary(Iris.Versi)

# Now with dplyr
Iris.Versi_dplyr3 <- Iris %>% 
  filter(Species == "versicolor", Sepal.Length >= 5.5) %>% 
  select(Species, Length = Sepal.Length)
  




# What is the mean Petal.Width of the setosa species? Pro tip: Try using the "with" function
# Introducing group_by() and summarise()

mean(Iris$Petal.Width[Iris$Species == "setosa"])

PetalWidth <- with(Iris, mean(Petal.Width[Species == "setosa"]))

Iris.meanPetalWidth <- Iris %>% 
  summarise(mean.PetalWidth = mean(Petal.Width))

Iris.meanPetalWidths_bySpecies <- Iris %>% 
  group_by(Species) %>% 
  summarise(mean.PetalWidth = mean(Petal.Width))

Iris.means <- Iris %>% 
  group_by(Species) %>% 
  summarise_each(funs(mean, sd, sum))



# Creating new columns with dplyr
# Create a new column that increases petal width by a factor of 10
Iris$PetalWidth10 <- Iris$Petal.Width * 10

Iris.sums <- Iris %>% 
  mutate(sum.Sepal = Sepal.Length + Sepal.Width,
         sum.Petal = Petal.Length + Petal.Width,
         PetalWidth10 = Petal.Width * 10)
  
  

Iris.means_fullData <- Iris %>% 
  group_by(Species) %>% 
  mutate(mean.Species_Petal.Width = mean(Petal.Width),
         Petal.Width_normed = Petal.Width / mean.Species_Petal.Width) %>% 
  ungroup()


# case_when
summary(Iris)
Iris.recodeSpecies <- Iris %>% 
  mutate(Species.abrv = case_when(Species == "setosa" ~ "s",
                                  Species == "versicolor" ~ "ve",
                                  Species == "virginica" ~ "vi"),
         Petal.Length_long = case_when(Petal.Length >= 3.8 ~ 1,
                                       Petal.Length < 3.8 ~ 0))





