# BÀI 1: LỊCH SỬ PHÁT TRIỂN GRAPHIC TRONG R ####

#######################################

# BÀI 2: NGUYÊN TẮC VẼ ĐỒ THỊ TRONG R ####

# base R graphic == base plot == standard plot

# graphic, graphics, statistical graph, chart, plot
# Phân biệt thuật ngữ kỹ lưỡng
# Wilkinson, L. (2005). The Grammar of Graphics (2nd ed.). Springer.


# standard chart
# other chart ~ advanced chart

# NGUYÊN TẮC VẼ ĐỒ THỊ (tr. 249)
# Jones, E., Harden, S., & Crawley, M. J. (2023). 
# The R book (3rd edition) (3rd ed.). Wiley.

### EXAMPLE










#####################################

## BÀI 3

# PHÂN TÍCH CẤU TRÚC FUNCTION TRONG PLOT BASE R

# BASE R GRAPHIC
mtcars
?mtcars

# chạy thử example mtcars

plot(mpg ~ wt, data = mtcars, 
     main = "base plot")

?plot
plot
methods(plot)
plot.default

plot.mlm*
plot.mlm
getAnywhere(plot.mlm)
stats::plot.mlm
stats:::plot.mlm
.NotYetImplemented()
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/notyet.html
# barplot(1:5, inside = TRUE)

# function with comma
plot,ANY-method
?plot,ANY-method


getAnywhere(plot,ANY-method)

base::plot(mpg ~ wt, data = mtcars, 
           main = "cách 1")

graphics::plot(mpg ~ wt, data = mtcars, 
               main = "cách 2")




















##########

plot

?methods
methods(ggplot)
methods(methods)
ggplot.default
methods

args(ggplot)
# https://stackoverflow.com/questions/39718433/accessing-codes-for-functions-using-methods-with-asterisk-in-its-name-in-r
getAnywhere(ggplot.default) 
# https://github.com/tidyverse/ggplot2/blob/main/R/plot.r
ggplot2::ggplot.default
ggplot2:::ggplot.default


ggplot.default*


ggplot

?methods
graphics::plot.default(mpg ~ wt, data = mtcars, 
                       main = "cách 3")




plot.default(x = mtcars$wt, y = mtcars$mpg, 
             data = mtcars, main = "base plot cách 1")



base::plot.default(x = mtcars$wt, y = mtcars$mpg, 
             data = mtcars, main = "base plot cách 1")

graphics::plot.default(x = mtcars$wt, y = mtcars$mpg,
                       main = "base plot cách 1")



plot(x = mtcars$wt, y = mtcars$mpg, 
     data = mtcars, main = "base plot cách 1")









plot(x = mtcars[c("wt", "mpg")], main = "base plot cách 3")





ok_1 <- mtcars$wt
ok_2 <- mtcars$mpg

rm(list = ls())











# lưu ý các tham số trong base R 
base::plot(x = mtcars$wt, y = mtcars$mgp)

Speed <- cars$speed
Distance <- cars$dist
plot(Speed, Distance, panel.first = grid(8, 8),
     pch = 0, cex = 1.2, col = "blue")







cars$speed
plot(Speed, Distance, panel.first = grid(8, 8),
     pch = 0, cex = 1.2, col = "blue")

with(cars, xy.coords(dist ~ speed, NULL)$xlab )
?plot


# LATTICE GRAPHIC


# GGPLOT2 GRAPHIC
library(ggplot2)
# Basic scatter plot
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()




















###################################################

# Plotting commands are divided into three basic groups:

# High-level plotting functions create a new plot on the graphics device, 
# possibly with axes, labels, titles and so on.

# Low-level plotting functions add more information 
# to an existing plot, such as extra points, lines and labels.

# Interactive graphics functions allow you interactively 
# add information to, or extract information from, 
# an existing plot, using a pointing device such as a mouse.

?mtcars

pairs(mtcars, main = "mtcars data", gap = 1/4)
coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)
?BOD

data()

women
pairs(airquality, panel = panel.smooth, main = "airquality data")

plot(women, xlab = "Height (in)", ylab = "Weight (lb)",
     main = "women data: American women aged 30-39")
ChickWeight 
?ChickWeight 

coplot(weight ~ Time | Chick, data = ChickWeight,
       type = "b", show.given = FALSE)
#Create data
set.seed(1)
Ixos=rnorm(4000 , 120 , 30)     
Primadur=rnorm(4000 , 200 , 30) 

# First distribution
hist(Ixos, breaks=30, xlim=c(0,300), col=rgb(1,0,0,0.5), xlab="height", 
     ylab="nbr of plants", main="distribution of height of 2 durum wheat varieties" )

# Second with add=T to plot on top
hist(Primadur, breaks=30, xlim=c(0,300), col=rgb(0,0,1,0.5), add=T)

# Add legend
legend("topright", legend=c("Ixos","Primadur"), 
       col=c(rgb(1,0,0,0.5), 
             rgb(0,0,1,0.5)), pt.cex=2, pch=15 )


######## https://rpubs.com/kkuipers/529695

install.packages("HSAUR3")
install.packages("KernSmooth")

library("HSAUR3")
library("KernSmooth")
data(birthdeathrates)

#Creating contour plot 
birthdeathrates1 <- bkde2D(birthdeathrates, bandwidth=sapply(birthdeathrates, dpik))

#plotting the contour plot
contour(x = birthdeathrates1$x1, y=birthdeathrates1$x2, z= birthdeathrates1$fhat,
        xlab="Birth Rate",
        ylab='Death Rate',
        main='contour Scatterplot: Birth Rate Vs. Death Rate')
points(birthdeathrates, pch=1, col='red')










######### lattice
# https://rdrr.io/cran/lattice/man/barley.html
# Graphic suggesting the Morris data switched the years 1931 and 1932
# Figure 1.1 from Cleveland
dotplot(variety ~ yield | site, data = barley, groups = year,
        key = simpleKey(levels(barley$year), space = "right"),
        xlab = "Barley Yield (bushels/acre) ",
        aspect=0.5, layout = c(1,6), ylab=NULL,
        scales=list(tck=c(1,0), x=list(cex=0.8), y=list(cex=0.55)),
        par.strip.text=list(cex=0.8)
        )

par(ask=F) # turn off hit enter to see next plot


######### ggplot2

library(ggplot2)
library(dplyr)

## simple scatter plot

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, color=Species)) + 
    geom_point(size=1) +
    theme_bw()

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, color=Species)) + 
    geom_point(size=2) +
    labs(col = "Species") +
    scale_color_manual(labels = c("setosa", "versicolor", "virginica"),
                       values = c("red", "darkgreen", "blue"))

###############


iris.sc <- iris
iris.sc[,1:4] <- scale(iris[,1:4])
iris.sc.input <- iris.sc[,1:4]

data.frame(
    "means"=apply(iris[,1:4], 2, mean), #2 means rows, 1 means cols
    "sd"=apply(iris[,1:4], 2, sd)
) %>% print(,digits = 2)

#######################


############

irisKM.mod <- kmeans(iris.sc.input, centers = 3, nstart = 100)

# Make the Data
groupPred <- factor(irisKM.mod$cluster, levels = c(1,2,3), ordered = FALSE)
iris$KMpred <- groupPred
groupPred %>% print()

# Make the Data
groupPred <- factor(irisKM.mod$cluster, levels = c(1,2,3), ordered = FALSE)
iris$KMpred <- groupPred


# Plot the Data
ggplot(iris, aes(y = Sepal.Length, x = Sepal.Width, col = KMpred)) +
    geom_point(size=2) +
    stat_ellipse(level = 0.9) +
    labs(col = "Species") +
    scale_color_manual(labels = c("setosa", "versicolor", "virginica"),
                       values = c("red", "darkgreen", "blue")) 

###########


