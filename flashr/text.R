####### TÌM THÔNG SỐ TEXT

x <- 0:10
y <- 0:10

oldpar <- par(no.readonly = TRUE)

plot(y ~ x, 
     xlim = c(0, 10), 
     ylim = c(0, 10), 
     xaxs = "i", 
     yaxs = "i", 
     pch = 19, 
     col = "blue", 
     cex = 1.5)

abline(h = 5)
abline(v = 5)

text(x = 0, 
     y = 5, 
     labels = c("triệu tấn"),
     col = "red",
     adj = c(0, 0.5),
     cex = 2,
     xpd = FALSE
)

usr <- par("usr")   
par(usr = c(0, 1, 0, 1), xlog=FALSE, ylog=FALSE) 
text(x = 0, 
     y = 0.5, 
     labels = c("triệu tấn"),
     col = "purple",
     adj = c(0, 0.5),
     cex = 2,
     xpd = FALSE
)  
par(usr = usr)


par(oldpar)

###############################

####### CÁCH CONVERT TỌA ĐỘ TEXT

x <- 0:10
y <- 0:10

par(xpd = NA)

par(oma = c(2, 2, 2, 2),
    mar = c(8, 4, 6, 10))

plot(y ~ x, 
     xlim = c(0, 10), 
     ylim = c(0, 10), 
     xaxs = "i", 
     yaxs = "i", 
     pch = 19, 
     col = "blue", 
     cex = 1.5,
     type = "n")

### TỌA ĐỘ USER TRÊN PLOT REGION

abline(h = 5, 
       col = "red", 
       lty = "dashed")

abline(v = 5, 
       col = "red", 
       lty = "dashed")

points(x = 5,
       y = 5,
       col = "red",
       cex = 2,
       pch = 19)

text(x = 5,
     y = 5,
     labels = c("triệu tấn"),
     col = "red",
     adj = 0,
     cex = 2)

library(precisePlacement)

highlightFigureRegion()

plotSizeInches <- par("pin")
plotSizeUnits <- par("usr")[c(2, 4)] - par("usr")[c(1, 3)]
dataPerInch <- plotSizeUnits/plotSizeInches


figureBoundaries <- c(par("usr")[3] - par("mai")[1] * dataPerInch[2], 
                      par("usr")[1] - par("mai")[2] * dataPerInch[1], 
                      par("usr")[4] + par("mai")[3] * dataPerInch[2], 
                      par("usr")[2] + par("mai")[4] * dataPerInch[1])


rect(xleft = figureBoundaries[2], 
     xright = figureBoundaries[4], 
     ybottom = figureBoundaries[1],
     ytop = figureBoundaries[3],
     col = "transparent",
     border = "purple")

abline(h = (figureBoundaries[1] + figureBoundaries[3])/2, 
       col = "purple", 
       lty = "dashed")

abline(v = (figureBoundaries[2] + figureBoundaries[4])/2, 
       col = "purple", 
       lty = "dashed")

points(x = (figureBoundaries[2] + figureBoundaries[4])/2,
       y = (figureBoundaries[1] + figureBoundaries[3])/2,
       col = "purple",
       cex = 2,
       pch = 19)

text(x = (figureBoundaries[2] + figureBoundaries[4])/2,
     y = (figureBoundaries[1] + figureBoundaries[3])/2,
     labels = c("triệu tấn"),
     col = "purple",
     adj = 0,
     cex = 2)

###############################


abline(h = grconvertY(0.5, from = "nfc", to = "user"), 
       col = "blue", 
       lty = "dashed",
       lwd = 2)

abline(v = grconvertX(0.5, from = "nfc", to = "user"), 
       col = "blue", 
       lty = "dashed",
       lwd = 2)

points(x = grconvertX(0.5, from = "nfc", to = "user"),
       y = grconvertY(0.5, from = "nfc", to = "user"),
       col = "blue",
       cex = 2,
       pch = 19)

text(x = grconvertX(0.5, from = "nfc", to = "user"),
     y = grconvertY(0.5, from = "nfc", to = "user"),
     labels = c("triệu tấn"),
     col = "blue",
     adj = 0,
     cex = 2)

rect(xleft = grconvertX(0, from = "nfc", to = "user"), 
     xright = grconvertX(1, from = "nfc", to = "user"), 
     ybottom = grconvertY(0, from = "nfc", to = "user"),
     ytop = grconvertY(1, from = "nfc", to = "user"),
     col = "transparent",
     border = "blue")

#######################################

#### convert từ normalized plot coordinates (npc) tọa độ usr xy

abline(h = grconvertX(0.2, from = "npc", to = "user"), 
       col = "darkgreen", 
       lty = "dashed")

abline(v = grconvertY(0.8, from = "npc", to = "user"), 
       col = "darkgreen", 
       lty = "dashed")

points(x = grconvertX(0.2, from = "npc", to = "user"),
       y = grconvertY(0.8, from = "npc", to = "user"),
       col = "darkgreen",
       cex = 2,
       pch = 19)

text(x = grconvertX(0.2, from = "npc", to = "user"),
     y = grconvertY(0.8, from = "npc", to = "user"),
     labels = c("triệu tấn"),
     col = "darkgreen",
     adj = 0,
     cex = 2)

########################################

### tách cửa sổ plot

par(pty = "s")

windows(width = 600, height = 600)
# x11() 

x <- 0:10
y <- 0:10

par(xpd = NA)

par(oma = c(2, 2, 2, 2),
    mar = c(8, 4, 6, 10))

plot(y ~ x, 
     xlim = c(0, 10), 
     ylim = c(0, 10), 
     xaxs = "i", 
     yaxs = "i", 
     pch = 19, 
     col = "blue", 
     cex = 1.5,
     type = "n")

# quartz # macOS Quartz Device

dev.off()

# https://stackoverflow.com/questions/25450719/plotting-text-in-r-at-absolute-position
# https://stat.ethz.ch/pipermail/r-help/2008-March/157054.html































