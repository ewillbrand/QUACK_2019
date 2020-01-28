# QuACK 10/15/2019
# For Loops, While Loops and Logic


#### For Loops ####
# I'm having a party on 10/26 to celebrate Halloween and submitting my NSF GRF! I want to send text messages to some friends that I'm inviting.

guest_list <- c("Willa", "Roya", "Gold", "Sam", "Stephanie", "Eliza")

message <- "I'm having a party on 10/26 to celebrate Halloween and being done with NSF! Party starts at 9, hope to see you there!"


# Write a for loop to do this!
for(guest in guest_list) {
  print(message)
}

# How many times do you expect the message to print?


# Maybe I want to make it a little more personal:
for(guest in guest_list) {
  print(paste0("Hi ", guest, "! ", message))
}
# Note that paste0 is a function that pastes strings together with no spaces in between.
# Try using the function past e instead of paste0. What happens?


# Ok, that is nice, but I realized two things.
# First, what good is "sending" these messages if I don't have my friends' phone numbers to send them to?!
# Second, I don't really ever say "Hi" and then someone's name... that's weird. I want to make the message more personal (and normal)

numbers <- c(5127360544, 1234567890, 7894582245, 8107846922, 4126085104, 2668438200)
personalization <- c("Guess what?!", "Yoooooo.", "Hey girl!", "Sup man.", "Steph, I miss you!", "Hey, Eliza!")

# Ok, let's try this again!

for(guest in guest_list) {
  print(paste0("Preparing message for ", guest, "..."))
  print(paste("TO:", numbers[guest], "SEND:", personalization[guest], message))
}

# Hmmmm.... that's problematic... as my for loop is written right now, I can't "access" the information in my list of numbers or my list of personalizations. (NOTICE R DOES NOT THROW AN ERROR! Be careful!)

# AHA! I've organized the three lists so that there is a correspondence between the first items in each list, the second item in each list, and so on.
# In other words, Willa is in the first position on my guest_list, and her phone number is the first in my list of numbers, and her personalization is the first on that list, too!
# Maybe I can utilize this feature of how I've set up my lists in order to get my messages to send how I want them to send.

# I change my for loop so that instead of iterating over the exact contents of my guest_list (i.e., the names), I'm going to iterate over the *position* of each guest's name on that list!
# Their position on the list can also be called their index.

for(guest_position in 1:length(guest_list)) {
  # Copy from our old for_loop
  # In our "Preparing message for..." statement, change guest to guest_list[guest_position]
  # In the second line, change each instance of guest to guest_position, our new looping variable
  print(paste0("Preparing message for ", guest, "..."))
  print(paste("TO:", numbers[guest], "SEND:", personalization[guest], message))
}


# It is common practice to use the variable "i" in for loops - you can think of "i" as meaning "index"
# This loop does the exact same thing as our last one:
for(i in 1:length(guest_list)) {
  print(paste0("Preparing message for ", guest_list[i], "..."))
  print(paste("TO:", numbers[i], "SEND:", personalization[i], message))
}


# Let's say we want to save this message to send later instead of sending (i.e., printing) it now.

# First, I need to create the place where I'm goign to save the messages!
full_messages <- array(dim = length(guest_list))
for(i in 1:length(guest_list)) {
  print(paste0("Preparing message for ", guest_list[i], "..."))
  full_messages[i] <- paste("TO:", numbers[i], "SEND:", personalization[i], message)
}


#### Nested For Loops ####
# Ok, so as you already know, I'm weird. Right before I use my for loop to send all my messages, I decide that I want to send everyone a second message telling them to wear a costume. BUT. I only want to send this message to each individual AFTER I have sent out the first message to everyone!
# For simplicity, I also decide to get rid of the personalizations.

message1 <- paste("Hey!", message)
message2 <- "Oh, and don't forget to wear a costume!"
messages <- c(message1, message2)

# How do I decide which list, my messages or my guests, to iterate over first?
# Let's think about the English:
# Send message one to each guest, then send message two

for(mess in messages) {
  # This is directly copied from what we have above!
  for(guest_position in 1:length(guest_list)) {
    print(paste0("Preparing message for ", guest_list[guest_position], "..."))
    print(paste("TO:", numbers[guest_position], "SEND:", mess))
  }
}


# Here's another example of nexted for loops.
# I am on the GASP committee and I am planning an event for first and second year students to get to know each other better.
# Here are all the people who've RSVPed:
first_years <- c("Lindsey", "Smiti", "Cathrine", "Antonia", "Josh", "Catherine", "Sinclair", "Emily", "Mari")
second_years <- c("Elena", "Willa", "Roya", "Stephanie", "Ezra", "Eliza", "Julianna")

# I decide that I want to make sure that all the first years meet all the second years, and I want to print out each pair so I can make a schedule.

for(fyear in first_years) {
  for(syear in second_years) {
    print(paste(fyear, "meets", syear))
  }
}

# How will this one be different than the first one?
for(syear in second_years)  {
  for(fyear in first_years){
    print(paste(fyear, "meets", syear))
  }
}


# Another way of writing the first one using indices:
for(i in 1:length(first_years)) {
  for(j in 1:length(second_years)) {
    print(paste0(i, ".", j, ": ", first_years[i], " meets ", second_years[j]))
  }
}


#### While Loops ####

capacity <- 15
attendees <- 0

while(attendees < capacity) {
  # Let someone in the door:
  attendees <- attendees + 1
  print(paste("There are now", attendees, "people at the party!", capacity - attendees, "more guests can come in until we are at capacity."))
}


#### Practice with for loops ####

# 1. Print the numbers 1-10 without writing the print statement more than once. (i.e., using a for loop)


# 2. Now print the numbers from 10 to 1.


# 3. Get the length for each name in the guest list and save the length in a new vector

# First, create the vector to save the names!


# Now, write the for loop.


## The following problems are from https://www.r-exercises.com/2018/03/30/loops-in-r-exercises/
# 4. Write a for loop that iterates over the column names of the inbuilt iris dataset and print each together with the number of characters in the column name in parenthesis. Example output: Sepal.Length (12). Use the following functions print(), paste0() and nchar(). 


# 5. Using a for loop simulate the flip a coin twenty times, keeping track of the individual outcomes (1 = heads, 0 = tails) in a vector that you preallocte. 



# 6. Write a while loop that prints out standard random normal numbers (use rnorm()) but stops (breaks) if you get a number bigger than 1.


# 7. Use a nested for loop (a for loop inside a for loop) that produces the following matrix, preallocate the matrix with NA values.

# 0     1     2     3     4
# 1     0     1     2     3
# 2     1     0     1     2
# 3     2     1     0     1
# 4     3     2     1     0



# 8. Use a while loop to investigate the number of terms required before the product 1 x 2 x 3 x 4...x n reaches above 10 million.



