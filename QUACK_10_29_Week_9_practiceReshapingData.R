# Practice Reshaping Data
# #### ADD YOUR NAME ####

# Description: Practice reshaping data using dplyr functions gather and spread.

#### Set global options ####
options(stringsAsFactors = FALSE)

##### Import Packages #####
library(tidyverse)
library(tidylog)


#### Read in data ####

# Read in these three CSV files.

# This is the data file that we were given by our collaborators.
# It has all the data we need, but the format is not particularly friendly to work with.
ef.data_wide <- read.csv("ef_data_wide.csv")

# Here are the data in another format.
ef.data_long <- read.csv("ef_data_long.csv")

# Here is the format we want to end up with.
ef.data <- read.csv("ef_data.csv")



# We are going to build an understanding of how to go from ef.data_wide to the format we want in ef.data.


############
## Part 1 ##
############

# 1) Examine ef.data_wide and answer the following questions:
#   How many total rows are there? 1263 rows
#   How many rows per participant are there? 1 row per participant
#   How many total columns are there (not including subject information)? 40 columns
#   How many columns per time point? 10 columns per time point, one for each task
#   How many columns per task are there? 4 columns per task, one for each time point



# 2) Examine ef.data_long and answer the following questions:
#   How many total rows are there? 50,520 rows
#   For a given time point, how many rows per participant are there? 10 rows per timepoint (# of tasks at a tp)
#   How many total rows per participant are there (across all time points)? 40 rows! (10 tasks * 4 tps)
#   How many total columns are there (not including subject and time point information)? 1 slash 2
#   How many columns per task are there? ~1?


# 3) Examine ef.data and answer the following questions:
#   How many total rows are there? 5052
#   For a given time point, how many rows per participant are there? 1 row
#   How many total rows per participant are there (across all time points)? 4 rows, one per time point 
#   How many total columns are there (not including subject and time point information)? 10 (one per task)
#   How many columns per task are there? 1 column per task


############
## Part 2 ##
############

# Play around with the function "gather" using the ef.data_wide data frame. [Hint: Enter ?gather below and select the second link to get more information about how to use this function!]
test.df_gather <- ef.data_wide %>% 
  gather(key = "task", value = "score")

test.df_gather2 <- ef.data_wide %>% 
  gather(key = "task", value = "score", -c(pid:Cohort))


# What does gather do? What happens to your data frame when you use it?




# Play around with the function "spread" using the ef.data_long data frame. [Hint: Enter ?spread below and select the second link to get more information about how to use this function!]

# This gets us to our desired format!
test.df_spread <- ef.data_long %>% 
  spread(task, score)


# What does spread do? What happens to your data frame when you use it?


############
## Part 3 ##
############

# Do you have any ideas for how to get our data from wide format in ef.data_wide into the format of ef.data?
# I encourage you to play around with your different ideas using code. It is okay if you don't solve it exactly, the point is for you to practice thinking about these kinds of problems that come up all the time!



############
## Part 4 ##
############

# Try to get ef.data_wide into the format we want (i.e., ef.data)