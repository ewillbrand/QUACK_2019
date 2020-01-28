
### QuACK 9/17/19
# Practice with a real dataset
options(stringsAsFactors=FALSE)
# Load the data
Iris <- read.csv('~/Desktop/iris.csv')


# Look at the first few rows
 head(Iris)

# What are the datatypes in the df?

str(Iris)

# Is there missing data? 

Iris[is.na(Iris)]

Iris[!complete.cases(Iris),]

#remove the missing data

Iris <- na.omit(Iris)

# How many rows?

nrow(Iris)

# How many columns are there? 

ncol(Iris)

length(Iris)

# What are the column names

colnames(Iris)
names(Iris)

#View the dataframe in a new window 




# What are the datatypes 
str(Iris)

# Make a table

table(Iris$Species)

levels(Iris$Species)

# Should we change them? 

Iris$Species<- as.factor(Iris$Species)

# Get a summary of the columns
summary(Iris$Petal.Width)

##### Lets get some summary stats about these flower species ####

# What is the mean Petal.Width across all species? 

mean(Iris$Petal.Width)

# What is the mean Petal.Width of the setosa species? Pro tip: Try using the "with" function

mean(Iris$Petal.Width[Iris$Species == "setosa"])

PetalWidth <- with(Iris, mean(Petal.Width[Species == "setosa"]))

Iris$NewCol <- (Iris$Sepal.Length + Iris$Sepal.Width)/Iris$Petal.Length

Iris$NewCol <- with(Iris, Sepal.Length + Petal.Length)
### Lets play around with the columns ###

# Select all rows in the Petal.Width column using indexing
IrisPetalWidth <- Iris[,4]

# Select all rows of  Petal.Width , Petal.Length  and species using indexing
IrisPetal <- Iris[,c(3,4,5)]

# Select the petal.width and Petal.Length and species for  ONLY the first flower in the list
IrisPetal <- Iris[1:10 ,c(3,4,5)]


# Create a new column that increases petal width by a factor of 10
Iris$PetalWidth10 <- IrisPetalWidth * 10


# Make sure it worked
head(Iris)

# Rearrange your columns so that the two metrics of Petal.Width are next to each other 
Iris <- Iris[, c(1:4,7, 5, 6 )]

# Now again select pPetal.Width (unadjusted), Petal.Length and Species for all rows using indexing
IrisPetal <- Iris[1:10 ,c(3,4,6)]


### A good way to avoid the indexing issues is to use colnames ###


# Get Sepal.Width and petal width using names of columns instead of indexing


###Lets try using the subset function###

# Select only the veriscolor species

Iris.Versi <- subset(Iris, Species=="versicolor")
summary(Iris.Versi$Species)
table(Iris.Versi$Species)

# Select both setosa and versicolor


Iris.noVir <- subset(Iris, Species=="versicolor" | Species == "setosa")

Iris.noVir <- subset(Iris, Species %in% c("versicolor","setosa"))

Iris.noVir <- subset(Iris, Species!="virginica")


# Select only the versicolor species with a Sepal.Length  =/> 5.5 


Iris.Versi <- subset(Iris, Species == "versicolor" & Sepal.Length >= 5.5)

summary(Iris.Versi)
# Same as above, select only versicolor specieis with a Sepal.Length = or > 5.5. This time ONLY store the Sepal.Length colomn.


Iris.Versi <- subset(Iris, Species == "versicolor" & Sepal.Length >= 5.5, select = c(Sepal.Length, Sepal.Width))
summary(Iris.Versi)

### Lets ask some questions about our data now using logic and if statements ### 

# Use ifelse to see if the Sepal.Length is  greater than the Peal.Length for each flower. Pro tip: use the "with" function

Sepal.v.Petal <- with(Iris.Versi,ifelse(Sepal.Length > Petal.Length, TRUE, FALSE))

# This is useful info. Lets add this to our into our dataframe.

Iris$Sepal.v.Petal <- with(Iris.Versi,ifelse(Sepal.Length > Petal.Length, TRUE, FALSE)) # we can resave this as a variable
#OR use cbind
Iris.versi.compare <- cbind(Iris.Versi, Sepal.v.Petal)

View(Iris.Versi)


### While we've been messing around with our data, hard working RAs have collected more info for us. ###

# Lets read in the new data

Iris_aphid<- read.csv("~/Desktop/Aphid_count.csv")


# This is new data on the same flowers! Lets merge the two dataframes together. 

Iris_full <- merge(Iris, Iris_aphid, by = "Species")

View(Iris_full)

