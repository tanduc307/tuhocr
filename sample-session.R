# Làm quen với R

# Start the HTML interface to on-line help.
help.start()

# Generate two pseudo-random normal vectors of x- and y-coordinates.

x <- rnorm(50)

x

y <- rnorm(x)

y

# Plot the points in the plane.

plot(x, y)

# See which R objects are now in the R workspace.

ls() 

#  Remove objects no longer needed. (Clean up).

rm(x, y)

############################################################

# Make x = (1, 2, ... , 20).

x <- 1:20

x

# A ‘weight’ vector of standard deviations.

w <- 1 + sqrt(x)/2

w

#  Make a data frame of two columns, x and y, and look at it. 

dummy <- data.frame(x = x, y = x + rnorm(x)*w)

dummy

# Fit a simple linear regression and look at the analysis. With y to the left of the tilde, we are modelling y dependent on x.

fm <- lm(y ~ x, data = dummy)

summary(fm)

# Since we know the standard deviations, we can do a weighted regression.

fm1 <- lm(y ~ x, data = dummy, weight = 1/w^2)

summary(fm1)

# Make the columns in the data frame visible as variables.

attach(dummy)

# Make a nonparametric local regression function.

lrf <- lowess(x, y)

# Standard point plot.

plot(x, y)

# Add in the local regression.

lines(x, lrf$y, lwd = 3, col = "green")

# The true regression line: (intercept 0, slope 1).

abline(0, 1, lty = 3, lwd = 2, col = "blue")

# Unweighted regression line.

abline(coef(fm), lty = 4, lwd = 2, col = "black")

# Weighted regression line

abline(coef(fm1), lwd = 2, col = "red")

# Remove data frame from the search path.

detach() 

# A standard regression diagnostic plot to check for heteroscedasticity. 

plot(fitted(fm), resid(fm),
     xlab = "Fitted values",
     ylab = "Residuals",
     main = "Residuals vs Fitted")

# A normal scores plot to check for skewness, kurtosis and outliers. 

qqnorm(resid(fm), main = "Residuals Rankit Plot")

# Clean up all.

rm(list = ls())

############################################################

# The next section will look at data from the classical experiment of Michelson to measure the speed of light. 

# This dataset is available in the `morley` object, but we will read it to illustrate the `read.table()` function.

# Get the path to the data file

filepath <- system.file("data", 
                        "morley.tab", 
                        package = "datasets")

# Xem đường dẫn.

filepath

# Optional. Look at the file.

file.show(filepath)

# Read in the Michelson data as a data frame, and look at it.
# There are five experiments (column `Expt`) and each has 20 runs (column `Run`) and `sl` is the recorded speed of light, suitably coded.

mm <- read.table(filepath)

# Kiểm tra nội dung của `mm`

mm

# Change `Expt` and `Run` into factors.

mm$Expt <- factor(mm$Expt)

mm$Run <- factor(mm$Run)

# Make the data frame visible at position 2 (the default).

attach(mm)

# Kiểm tra các object đang `attach`.

search()

# Compare the five experiments with simple boxplots.

plot(Expt, Speed, 
     main = "Speed of Light Data", 
     xlab = "Experiment No.")

# Analyze as a randomized block, with ‘runs’ and ‘experiments’ as factors.

fm <- aov(Speed ~ Run + Expt, data = mm)

summary(fm)

# Fit the sub-model omitting ‘runs’, and compare using a formal analysis of variance.

fm0 <- update(fm, . ~ . - Run)

anova(fm0, fm)

# Remove data frame from the search path.

detach()

# Clean up before moving on.

rm(fm, fm0)

############################################################

# We now look at some more graphical features: contour (đường đồng mức) and image plots.

x <- seq(-pi, pi, len = 50)

x

# x is a vector of 50 equally spaced values in −π ≤ x ≤ π. y is the same.

y <- x

y

# f is a square matrix, with rows and columns indexed by x and y respectively, of values of the function cos(y)/(1 + x^2).

f <- outer(x, y, function(x, y) cos(y)/(1 + x^2))

f

# Save the plotting parameters and set the plotting region to “square”.

oldpar <- par(no.readonly = TRUE)

par(pty = "s")

contour(x, y, f)

# Make a contour map of f; add in more lines for more detail.

contour(x, y, f, nlevels = 15, add = TRUE)

# fa is the “asymmetric part” of f. (t() is transpose).

fa <- (f - t(f))/2

# Make a contour plot, ...

contour(x, y, fa, nlevels=15)

# and restore the old graphics parameters.

par(oldpar)

# Make some high density image plots

image(x, y, f)

image(x, y, fa)

# List all objects and clean up

objects() 

ls()

rm(list = ls())

############################################################

# R can do complex arithmetic

th <- seq(-pi, pi, len = 100)

th

# 1i is used for the complex number i.

z <- exp(1i*th)

z

par(pty = "s")

# Plotting complex arguments means plot imaginary versus real parts. This should be a circle.

plot(z, type = "l")

# Suppose we want to sample points within the unit circle.

# One method would be to take complex numbers with standard normal real and imaginary parts ...

w <- rnorm(100) + rnorm(100)*1i

w

# and to map any outside the circle onto their reciprocal.

w <- ifelse(Mod(w) > 1, 1/w, w)

w

plot(w, 
     xlim = c(-1, 1), 
     ylim = c(-1, 1), 
     pch = "+",
     xlab = "x", 
     ylab = "y")

# All points are inside the unit circle, but the distribution is not uniform.

lines(z)

# Là, lại cho `uniform` hơn.

w <- sqrt(runif(100))*exp(2*pi*runif(100)*1i)

w

plot(w, 
     xlim = c(-1, 1), 
     ylim = c(-1, 1), 
     pch= "+", 
     xlab = "x", 
     ylab = "y")

lines(z)

# Remove các object liên quan.

rm(th, w, z)

# Quit the R program.

q()





