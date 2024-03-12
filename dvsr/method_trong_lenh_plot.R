
### Lệnh plot nhận nhiều object thuộc các class khác nhau

### vector (1 biến)
plot(-1:-20, col = "blue", pch = 19)

plot(x = -1:-20, 
     col = "red", pch = 15)

barplot(height = 1:10,
        col = terrain.colors(n = 10))

hist(rnorm(100))

boxplot(rnorm(100))

pie(1:10)

### vector (2 biến)
plot(x = -1:-20, 
     y = NULL,
     col = "red", pch = 15)


plot(x = trees$Height,
     y = trees$Volume,
     col = "red", pch = 17)

plot(Volume ~ Height,
     data = trees, # trong dataset
     col = "blue", pch = 17)

plot(formula = Volume ~ Height,
     data = trees,
     col = "purple", pch = 17)

plot(formula = trees$Volume ~ trees$Height,
     col = "red", pch = 17)

### data frame

plot(iris,
     col = "darkgreen",
     pch = 19)

class(iris)

graphics:::plot.data.frame(iris,
                           col = "blue",
                           pch = 17) 

plot(x = iris,
     col = "blue",
     pch = 17)

### matrix

plot(as.matrix(iris))

graphics::plot.default(as.matrix(iris))

### list

yes_1 <- list(a = 1:10,
            b = rnorm(20),
            c = head(mtcars))

yes_1

plot(yes_1)

plot(yes_2)

yes_2 <- list(a = 1:10,
              b = 30:40)

boxplot(yes_2)

stripchart(yes_2)

library(plot.matrix)
library(ggplot2)

plot(as.matrix(trees))

plot.matrix:::plot.matrix(as.matrix(iris))

search()
sessionInfo()

# chỉ detach package và function thôi
unloadNamespace("plot.matrix")

detach("package:plot.matrix",
       unload = TRUE,
       force = TRUE)

methods("plot")

unclass(methods("plot"))

pryr::mem_used() # check RAM used for packages

### detach triệt để package và method đi kèm
pkgload:::unload("plot.matrix")
devtools::unload("plot.matrix")

# https://stackoverflow.com/questions/6979917/how-to-unload-a-package-without-restarting-r








