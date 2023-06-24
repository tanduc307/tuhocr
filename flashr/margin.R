# https://bootstrappers.umassmed.edu/bootstrappers-courses/pastCourses/rCourse_2014-09/resources/helpfulGuides/Rfigurelayout.pdf
# https://r-graph-gallery.com/74-margin-and-oma-cheatsheet.html
# https://tuhocr.netlify.app/flashr/Rfigurelayout.pdf
# https://tuhocr.netlify.app/flashr/how-big-is-your-graph-v2017.pdf
# https://www.stat.auckland.ac.nz/~paul/RG3e/chapter3.html
# https://cran.r-project.org/web/packages/precisePlacement/vignettes/Overview.html
# All four-unit values are returned in the order of (bottom, left, top, right) like par('mar') 
# and not like par('usr') which is (left, right, bottom, top).
# https://jeromyanglim.blogspot.com/2010/05/abbreviations-of-r-commands-explained.html
# https://r-charts.com/base-r/margins/

#########################################################

### RECTANGLE

par(bg = "lightyellow")

par(xpd = TRUE)

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

rect(xleft = 1,
     xright = 8,
     ybottom = par("usr")[3],
     ytop = par("usr")[4],
     col = "lightgreen")

rect(xleft = -1, 
     xright = 9,
     ybottom = -1, 
     ytop = 11,
     col = "transparent",
     border = "darkviolet",
     lwd = 2,
     lty = 2)

highlightDeviceRegion()
highlightFigureRegion()
highlightPlotRegion()
highlightDataRegion()

showMarginLines()
showOuterMarginLines()

par(new = TRUE)

plot(x = 1:10,
     y = 1:10,
     xaxs = "i",
     yaxs = "i",
     pch = 19,
     col = "blue",
     xlim = c(0, 10),
     ylim = c(0, 10)
)

##################################################

par("mar")
par(mar)
par(mar = c(4, 4, 4, 4)) # bottom left top right # unit: lines
par("mar" = c(5, 5, 5, 5)) 

par("usr") # left, right, bottom, top # unit: xy value


###################################################

### BOX ## outer margin và figure marign

oldpar <- par(no.readonly = TRUE)

par(bg = "lightyellow")

par(pty = "s") # square

par(pty = "m") # maximum

par(xpd = TRUE)

### outer margin

par(oma = c(2, 2, 2, 2)) # lines

par(omi = c(2, 2, 2, 2)) # inches

par(omd = c(0, 0.7, 0, 1)) # pct percent

# par("omd")

### figure margin

par(mar = c(4, 4, 4, 4)) # lines

par(mai = c(2, 2, 2, 2)) # inches

plot(x = 1:10,
     y = 1:10,
     xaxs = "i",
     yaxs = "i",
     pch = 19,
     col = "blue",
     xlim = c(0, 10),
     ylim = c(0, 10)
)

box(which = "plot", col="red", lwd = 2)

box(which = "figure", col="purple", lwd = 2)

box(which = "inner", col="darkgreen", lwd = 2)

box(which = "outer", col="blue", lwd = 2)

par(oldpar)

##########

########################################

### BOX ## inner margin ### layout multiple plot 

par(oldpar)

par(oma = c(2, 2, 2, 2), mar = c(2, 2, 2, 2), mfrow = c(2, 2))

plot(1, 1, ylab = "", xlab = "", type = "n")
plot(1, 1, ylab = "", xlab = "", type = "n")
plot(1, 1, ylab = "", xlab = "", type = "n")
plot(1, 1, ylab = "", xlab = "", type = "n")

mtext(text = "label 1", side = 1, line = 0, outer = TRUE, col = "red")
mtext(text = "label 2", side = 2, line = 0, outer = TRUE, col = "red")

mtext(text = "x label", side = 1, line = 0, outer = FALSE, col = "blue")
mtext(text = "y label", side = 2, line = 0, outer = FALSE, col = "blue")

box(which = "plot", col="red", lwd = 2)
box(which = "figure", col="purple", lwd = 2)
box(which = "inner", col="darkgreen", lwd = 2)
box(which = "outer", col="blue", lwd = 2)


###############################################
# Margins area
par(oma=c(3,3,3,3)) # all sides have 3 lines of space
par(mar=c(5,4,4,2) + 0.1)

# Plot
plot(0:10, 0:10, type="n", xlab="X", ylab="Y") # type="n" hides the points

# plot(cars)

# Place text in the plot and color everything plot-related red
text(5,5, "Plot", col="red", cex=2)
box(col="red")

# Place text in the margins and label the margins, all in forestgreen  
mtext("Margins", side=3, line=2, cex=2, col="forestgreen")  
mtext("par(mar=c(b,l,t,r))", side=3, line=1, cex=1, col="forestgreen")  
mtext("Line 0", side=3, line=0, adj=1.0, cex=1, col="forestgreen")  
mtext("Line 1", side=3, line=1, adj=1.0, cex=1, col="forestgreen")  
mtext("Line 2", side=3, line=2, adj=1.0, cex=1, col="forestgreen")  
mtext("Line 3", side=3, line=3, adj=1.0, cex=1, col="forestgreen")  
box("figure", col="forestgreen")  

# Label the outer margin area and color it blue  
# Note the 'outer=TRUE' command moves us from the figure margins to the outer margins.  
mtext("Outer Margin Area", side=1, line=1, cex=2, col="blue", outer=TRUE)  
mtext("par(oma=c(b,l,t,r))", side=1, line=2, cex=1, col="blue", outer=TRUE)  
mtext("Line 0", side=1, line=0, adj=0.0, cex=1, col="blue", outer=TRUE)  
mtext("Line 1", side=1, line=1, adj=0.0, cex=1, col="blue", outer=TRUE)  
mtext("Line 2", side=1, line=2, adj=0.0, cex=1, col="blue", outer=TRUE)  
box("outer", col="blue")  

######################

library(precisePlacement)

par(xpd = NA, oma = c(1, 2, 3, 4))

plot(1:100, pch = 19)

highlightDeviceRegion()
highlightFigureRegion()
highlightPlotRegion()
highlightDataRegion()

showMarginLines()
showOuterMarginLines()

legend('topleft', c('Data Region', 'Plot Region', 'Figure Region', 'Device Region'),
       text.col = c('darkgreen', 'red', 'orange', 'skyblue'), bty = 'n', text.font = 2,
       xjust = 0.5, yjust = 0.5)


######################
# https://stat.ethz.ch/R-manual/R-patched/library/graphics/html/par.html
### read-only parameters
# https://www.r-bloggers.com/2016/03/mastering-r-plot-part-3-outer-margins/
# https://r-graph-gallery.com/42-colors-names.html

########################################

########### các nội dung còn lại về graphics device và layout multiple plot được trình bày
########### ở chuyên đề 2 Data visualization in R.
# windows(300, 300)
# plot(1:100)

















