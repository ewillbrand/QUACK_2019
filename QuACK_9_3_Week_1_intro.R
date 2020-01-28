# QuACK Day 1: 9/3/2019

subjid <- c(1, 2, 3, 4, 5)

subjid[1]

age <- subjid + 5

x <- c("a", "x", "y")

x <- 1:5
y <- 5:10


x <- seq(from=4, to=13, by=0.7)
y <- seq(0, 1, .1)
z <- rep(3, 5)
a <- rep(c(3, 4), times=5, each=2)

df <- data.frame(subjid, age, z)
df <- data.frame(subjid, age, y)

number <- 1

df$subjid
df[1,1]
