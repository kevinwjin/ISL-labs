# 2.3 Lab: Introduction to R

### Basic commands 
x <- c(1, 3, 2, 5)
x <- c(1, 6, 2)
y <- c(1, 4, 3)
length(x)
length(y)
x + y

ls() # list all environmental objects
rm(x, y) # remove objects
rm(list = ls())

x <- matrix(data = c(1, 2, 3, 4), nrow = 2, ncol = 2)
x <- matrix(c(1, 2, 3, 4), 2, 2)
matrix(c(1, 2, 3, 4), 2, 2, byrow = TRUE)

sqrt(x)

x <- rnorm(50) # generate vector of random normal variables
y <- x + rnorm(50, mean = 50, sd = 0.1)
cor(x, y) # compute correlation
set.seed(1303)
rnorm(50)
set.seed(3)
y <- rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

### Graphics
x <- rnorm(100)
y <- rnorm(100)
plot(x, y)
plot(x, y, xlab = "This is the x-axis",
     ylab = "This is the y-axis",
     main = "Plot of x vs y")

pdf("Figure.pdf")
plot(x, y, col = "green", 
     xlab = "This is the x-axis",
     ylab = "This is the y-axis",
     main = "Plot of x vs y")
dev.off() # Write PDF of plot

x <- seq(1, 10) 
x <- 1:10
x <- seq(-pi, pi, length = 50)

y <- x 
f <- outer(x, y, function(x, y) cos (y) / (1 + x ^ 2))
contour(x, y, f)
contour(x, y, f, nlevels = 45, add = T)
fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels = 15)

image(x, y, fa) # color-coded contour
persp(x, y, fa) # 3d plot
persp(x, y, fa, theta = 30) # change viewing angles
persp(x, y, fa, theta = 30, phi = 20)
persp(x, y, fa, theta = 30, phi = 70)
persp(x, y, fa, theta = 30, phi = 40)

### Indexing data
A <- matrix(1:16, 4, 4)
A[2, 3]
A[c(1, 3), c(2, 4)]
A[1:3, 2:4]
A[1:2, ]
A[, 1:2]
A[1, ]
A[-c(1, 3), ]
A[-c(1, 3), -c(1, 3, 4)]
dim(A) # dimensions of a matrix (rows, columns)

### Loading data
library(ISLR2)
Auto <- read.table("Auto.data")
View(Auto)
head(Auto)

Auto <- read.table("Auto.data", header = TRUE, na.strings = "?", 
                   stringsAsFactors = TRUE) 
Auto <- read.csv("Auto.csv", na.strings = "?")
View(Auto)

dim(Auto)
Auto[1:4, ] # extract first 4 rows of dataframe
Auto <- na.omit(Auto)
dim(Auto)
names(Auto) # check names of variables

### Additional graphical and numerical summaries
plot(Auto$cylinders, Auto$mpg)
attach(Auto) # make variables available for reference without $
plot(cylinders, mpg) # generates scatter plot

cylinders <- as.factor(cylinders) # convert quantitative variable to qualitative 
plot(cylinders, mpg) # generates box plot
plot(cylinders, mpg, col = "red")
plot(cylinders, mpg, col = "red", 
     varwidth = TRUE) # draw width of box proportionate to sample size
plot(cylinders, mpg, col = "red", 
     varwidth = TRUE, 
     horizontal = TRUE) # flip box plot to horizontal 
plot(cylinders, mpg, col = "red", 
     varwidth = TRUE,
     xlab = "cylinders", ylab = "MPG")

hist(mpg) # plot histogram
hist(mpg, col = 2) # 2 = red
hist(mpg, col = 2, breaks = 15)

pairs( # generates scatterplot matrix (scatterplot for every variable pair)
  ~ mpg + displacement + horsepower + weight + acceleration, 
  data = Auto) 

plot(horsepower, mpg)
identify(horsepower, mpg, name) # click + esc to identify val of variable on plot

summary(Auto) # numerical summary of each variable in dataset
summary(mpg) # numerical summary of a single variable

q() # quit R; save workspace to preserve loaded datasets and objects

savehistory() # save record of all commands
loadhistory() # load saved record of all commands