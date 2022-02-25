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

