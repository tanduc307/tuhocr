###########################################################

# BÀI 8: METHOD TRONG LỆNH PLOT ####

# base-r graphics
plot
plot(1:10)
plot(iris)
?plot
methods("plot")

plot.default(1:10)
graphics::plot.default(1:10)

# https://stackoverflow.com/questions/56781386/the-way-usemethod-works-in-r
# https://tuhocr.netlify.app/phan-loai-function.svg
# function có asterisk
# All method with an asterisk are namespace protected methods.
# https://stat.ethz.ch/pipermail/r-help/2005-July/075948.html
# https://stackoverflow.com/questions/58356237/why-some-functions-are-prototyped-with-an-asterisk

getAnywhere("plot")
getAnywhere("plot.default")
plot.default
plot.lm
getAnywhere("plot.lm")

methods(class = "data.frame")
methods(class = "lm")
methods(class = "matrix")

fit_lm <- lm(mpg ~ wt, data = mtcars)
fit_lm
plot(fit_lm)


lsf.str("package:base")
grep("plot", lsf.str("package:base"), value = TRUE)
grep("plot", lsf.str("package:graphics"), value = TRUE)
grep("plot", lsf.str("package:stats"), value = TRUE)

objects("package:base", pattern = "plot")
objects("package:graphics", pattern = "plot")
objects("package:stats", pattern = "plot")


identical(base::plot, graphics::plot)

identical(base::plot, graphics::plot.default)

methods(graphics::plot)
methods(base::plot)

base::plot(1:20)
base::plot.default(1:20)
graphics::plot.default(1:20)
base::plot(cars)
base::plot(iris)
graphics::plot(1:20)
graphics::plot(cars)
graphics::plot(iris)

plot.data.frame
getAnywhere(plot.data.frame)

plot.default(iris)
plot(iris)
plot.data.frame(iris)
# LỆNH NÀY BỊ ẨN DO ĐÓ MUỐN DÙNG THÌ DÙNG NHƯ VẦY.

plot_df <- function (x, ...) 
{
    plot2 <- function(x, xlab = names(x)[1L], ylab = names(x)[2L], 
                      ...) plot(x[[1L]], x[[2L]], xlab = xlab, ylab = ylab, 
                                ...)
    if (!is.data.frame(x)) 
        stop("'plot.data.frame' applied to non data frame")
    if (ncol(x) == 1) {
        x1 <- x[[1L]]
        if (class(x1)[1L] %in% c("integer", "numeric")) 
            stripchart(x1, ...)
        else plot(x1, ...)
    }
    else if (ncol(x) == 2) {
        plot2(x, ...)
    }
    else {
        pairs(data.matrix(x), ...)
    }
}

plot_df(iris)
plot(iris)
plot.data.frame(iris)

###############################




