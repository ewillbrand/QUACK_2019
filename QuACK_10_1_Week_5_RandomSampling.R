#### Playing with distributions in R ####
# The goal of this is to get comfortable with seeing your measure as a random variable with a distribution
# To learn about sampling 
# To test the central limit theorem

# You're running a study on gambling and addiction. You've built a fake slot machine for mturk that randomly generates wins
# Every time you play your randomly win 70-130 cents. 
# This random variable is normally distributed with a built in mean win of 100 and an stdev of 10

# Each participant completes 100 trials of the task. 


#### 1.  Generate data for one subject who completed 100 trials of this task. 
# Understanding check: how many data points in this sample? What should their mean win be across trials? 
wins <- rnorm(100, mean = 100, sd =10)

# plot their winnings on a histogram
hist(wins)

# Get the mean winning for their trial
# Understanding check: What do you expect the mean to be.
mean(wins)


# Understanding check: What happens if you run the random win generator again
wins <- rnorm(100, mean = 100, sd =10)
hist(wins)
mean(wins)
#### Central limit tests ####
#### 2. Generate data for 100 subjects that participate in this task. Each participant plays the slot machine 100 times (100 trials) ####
subMeans <- array(dim = 100) #create an empty vector we will fill with means for each subject

for (sub in 1:100){
 # generate a distribution
  wins <- rnorm(100, mean = 100, sd = 10)
 # get the mean + store the mean
  subMeans[sub] <- mean(wins)

}
# Plot the distribution of the mean winnings across subjects 
# Understanding check: How many datapoints are you plotting? 

hist(subMeans)
mean(subMeans)


#### 3. What happens to the distribution if we look at : ####

# a) 20 subjects 


# b) 5 subjects

# c) 20,000 subjects


#### 4. Your subjects are getting so bored doing 100 trials. ####
# You decide to  sample another 100 subjects but only have them play the slot machine 5 times each
subMeans <- array(dim = 100) #create an empty vector we will fill with means for each subject

for (sub in 1:100){
  # generate a distribution
  wins <- rnorm(5000, mean = 100, sd = 10)
  # get the mean + store the mean
  subMeans[sub] <- mean(wins)
}

# what happens to the variance?
hist(subMeans)

# what happens to the mean?


#### 5. what happens if each subject plays the slot machine 5000 times ####


#### 6. For one subject, record their mean wins  for 10, 20, 50, 100, 200, 500, 1000 trials
trialN <- c(10,20,50,100,200,500,1000)
trialMeans <- array(dim = length(trialN))

for(i in 1:length(trialN)){
  trialMeans[i] <- mean(rnorm(trialN[i], mean = 100, sd = 10))
}



plot(trialN, trialMeans, xlim=c(-30, 1000), ylim =c(95.5, 105.5), type = 'b')
abline(v=100)


sum <- 0
for(trials in trialN) {
  print(paste("trials", trials))
  sum <- sum + trials
  print(paste("sum = ", sum))
}