# Week 2: 9/10/2019


#### Warm-Up ####

# Complete these exercises to get started! Coding is all about creative problem solving! Don't worry if you don't finish them all, do as many as you can while fully understanding what you are doing! If you aren't sure how to do one, that's ok, just skip it and move on to the next one.

# Adapted from https://bookdown.org/ndphillips/YaRrr/test-your-r-might.html and https://bookdown.org/ndphillips/YaRrr/test-your-r-might-1.html


# 0) Create a new R script. Using comments, write your name, the date, and "Week 2: 9/10/2019" at the top of the script. Write your answers to the rest of these exercises on this script, and include a comment with the question number to separate your answers. (You can copy and paste the original questions using comments later when the answer key is posted!) Your script should only contain valid R code and comments.

# 1) 2015 was a good year for pirate booty - your ship collected 100,800 gold coins. Create an object called gold.in.2015 and assign the correct value to it.

gold.in.2015 <- 100800

# 2) Oops, during the last inspection we discovered that one of your pirates Skippy McGee hid 800 gold coins in his underwear. Go ahead and add those gold coins to the object gold.in.2015. Next, create an object called plank.list with the name of the pirate thief and his partner, Skinny Bones Jones.

gold.in.2015 <- gold.in.2015 + 800
plank.list <- c("Skippy McGee", "Skinny Bones Jones")
# Could also use a list()... but since they are of the same type, should use a vector (lists are much rarer)

# 3) Look at the code below. What will R return after the third line? Make a prediction and explain your reasoning, then test the code yourself.

# a <- 10
# a + 15
# a

# It will return 10! Even though you have added 15, you have not *assigned* this change to any variable, including to the variable a! Therefore, this addition is "lost," and the variable maintains its original value. Remember, if you want to change the value of a variable, you always have to assign it that change!

# 4) Create the vector [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] in three ways: once using c(), once using a:b, and once using seq(). Assign one of these ways to a vector named x. [HINT: Remember you can use ?seq to see what arguments seq takes!]

x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
1:10
seq(1, 10)

# 5) Add 8 to each number in the vector and save it as a new vector
xplus8 <- x + 8

# 6) Now, output a vector where each number is twice its value in x. There are two ways to do this
x * 2
x + x

# 7) Now, create a new vector, y, by adding a number to each item in x such that the new vector has a length of 10, and each item equals 10. (I.e., y will equal c(10, 10, 10, ..., 10))

y <- x + 9:0 # Also accepted: y <- x + seq(9, 0)


# 8) Create the vector [2.1, 4.1, 6.1, 8.1] in three ways, using c(), seq() with a by argument, and seq() with a length.out argument.

c(2.1, 4.1, 6.1, 8.1)
seq(2.1, 8.1, by=2)
seq(2.1, by=2, length.out=4)

# Notice that the second opton still works if you don't add by=, but the third option doesn't work if you don't put length.out=!
seq(2.1, 8.1, 2)
seq(2.1, by=2, 4) # R doesn't know what to do with the third argument!


# 9) Create a vector that repeats the integers from 1 to 5, 10 times. That is [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, .]. The length of the vector should be 50!

(a <- rep(1:5, 10)) # also correct to say rep(1:5, times=10)

# 10) Now, create the same vector as before, but this time repeat 1, 10 times, then 2, 10 times, etc., That is [1, 1, 1, ., 2, 2, 2, ., . 5, 5, 5]. The length of the vector should also be 50.

(b <- rep(1:5, each=10)) # Notice you get the answer from previous question if you don't put the each=!
