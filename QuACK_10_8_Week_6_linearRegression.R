# We will be using the Prestige dataset to explore linear regression in R. 
# Focus on how to construct a linear model that includes the relationships we want. 
# Interpret the output of that model. 

# load libraries 
library (tidyverse)
library(car)

# take a look at your data
summary(Prestige)

# I'm interested in what creates the perception of job prestige. I assume income will play a role. 

#lets visualize the relationship between income and prestige
ggplot(Prestige, aes(income, prestige)) + geom_point() + geom_smooth(method = lm)

# Construct a linear model to determine whether income affects job prestige
# What is the null hypothesis?
# What is the alternative hypothesis?

# Construct the linear model
mod.inc <- lm(prestige ~ income , data = Prestige)
summary(mod.inc)

# Does the profession you're in also affect the presetige of your job? 
# visualize the data separated by job type
ggplot(Prestige, aes(income, prestige, color = type)) + geom_point()  # maybe this describes the data better


# Construct a model that includes type as a factor in the model. 
mod.type <- lm(prestige ~ income +  type, data = Prestige)
summary(mod.type)

# Does the impact of income on prestige change as a result of job type? is it more relevant to prestige in some jobs than in others?
# Construct a linear model to investigate this
mod.incType <- lm(prestige ~ income * type, data = Prestige)
summary(mod.incType)

# Do we actually explain significantly more variance by adding in type? 
anova(mod.type, mod.incType)

# There are otherways to combine effects and variables to really model the relationships you are interested in. 
mod.incType <- lm(prestige ~ income:type, data = Prestige) #useful if you have more variables eg. also include a dif effect of ed

# now we've included an additional effect of education as a separate factor. 
mod.incType <- lm(prestige ~ income*type + education, data = Prestige) 


# 3 ways to compare models in R 
anova(mod.1, mod.2)  # compare two distributions 
Anova(mod.1) # remove one predictor at a time
anova(mod.1) # Add one predictor at a time

# What is an anova? Its just a regression with dif framing of the effects 
summary(aov(prestige ~ type, data = Prestige))

summary(lm(prestige ~ type, data = Prestige))
#Anova looks for a difference between groups. regression looks at the effect compared to zero or to the mean (a horizontal line)
