library(precisePlacement)

par(xpd = NA)

par(oma = c(2, 2, 2, 2),
    mar = c(3, 3, 3, 3))

plot(x = 1:10,
     y = 1:10,
     xaxs = "i",
     yaxs = "i",
     pch = 19,
     col = "blue",
     xlim = c(0, 10),
     ylim = c(0, 10)
)

highlightFigureRegion()

rect(xleft = -1.6, 
     xright = 9,
     ybottom = -1, 
     ytop = 11,
     col = "transparent",
     border = "darkviolet",
     lwd = 2,
     lty = 2)

par("usr")

box(which = "figure", col="blue", lwd = 2)

##########################

plotSizeInches <- par("pin")
plotSizeUnits <- par("usr")[c(2, 4)] - par("usr")[c(1, 3)]
dataPerInch <- plotSizeUnits/plotSizeInches


figureBoundaries <- c(par("usr")[3] - par("mai")[1] * dataPerInch[2], 
                      par("usr")[1] - par("mai")[2] * dataPerInch[1], 
                      par("usr")[4] + par("mai")[3] * dataPerInch[2], 
                      par("usr")[2] + par("mai")[4] * dataPerInch[1])


rect(xleft = figureBoundaries[2], 
     xright = figureBoundaries[4], 
     ytop = figureBoundaries[3],
     ybottom = figureBoundaries[1],
     col = "transparent",
     border = "red")


############################

# https://www.tuhocr.com/gallery/toolbox

## các lệnh check function

is.primitive(.External.graphics)
is.primitive(box)
is.primitive(rect)

typeof(.External.graphics)
typeof(box)
typeof(rect)

methods(.External.graphics)
methods(box)
methods(rect)

print(.External.graphics)
print(box)
print(rect)

is.function(.External.graphics) 
is.function(box) 
is.function(rect) 

###########

## kiểm tra S3 hay S4 method

!isS4(.External.graphics)
isS4(.External.graphics)

!isS4(box)
isS4(box)

!isS4(rect)
isS4(rect)

# http://adv-r.had.co.nz/OO-essentials.html
# https://www.tuhocr.com/gallery/toolbox
# https://blog.r-hub.io/2019/05/14/read-the-source/
# https://github.com/jennybc/access-r-source#accessing-r-source
# https://github.com/jimhester/lookup#readme
# https://github.com/wch/r-source
# .External.graphics
# https://github.com/wch/r-source/blob/trunk/src/main/names.c
# search github: do_Externalgr path:src/main
# https://github.com/wch/r-source/blob/2c11f068f7a7d36bed6f0b7187cee8ae1eaedf55/src/main/dotcode.c#L1614









































