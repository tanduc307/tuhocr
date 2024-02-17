trees -> df
names(df) <- c("duong_kinh", "chieu_cao", "the_tich")
df

# windows(width = 8, height = 8, rescale = "fixed")

oldpar <- par(no.readonly = TRUE)


par(oma = c(4, 4, 4, 4))
par(pty = "s")

par(bg = "lightgreen")
# par(fg = "red")
par(ann = FALSE)

plot(x = df$duong_kinh,
     y = df$the_tich,
     type = "n",
     # QUY ĐỊNH ANNOTATION
     ann = FALSE,
     xlab = "aaa",
     ylab = "bbb",
     xlim = c(0, 30),
     ylim = c(0, 100),
     xaxs = "i",
     yaxs = "i",
     main = "tree",
     col.lab = "#FF000000",
     # QUY ĐỊNH FORMAT AXIS
     axes = FALSE,
     xaxt = "s",
     yaxt = "s",
     bty = "n"
     # fg = "blue"
     )

rect(xleft = par("usr")[1],
     xright = par("usr")[2],
     ybottom = par("usr")[3],
     ytop = par("usr")[4],
     col = "lightyellow",
     border = NA,
     lwd = 0)

grid(col = "red", lwd = 1, nx = 6, ny = 5)

# axTicks(side = 1) -> truc_x
# axTicks(side = 2) -> truc_y
# 
# abline(h = seq(from = truc_y[2],
#                to = truc_y[5],
#                by = 20),
# 
#        v = seq(from = truc_x[2],
#                to = truc_x[6],
#                by = 5),
# 
#        col = "blue",
#        lwd = 1,
#        lty = "dotted")

par(new = TRUE)

par(cex.axis = 1.5)
par(font.axis = 2)
par(col.axis = "black")
par(cex.lab = 1.5)
par(col.lab = "black")
par(fg = "blue")

plot(x = df$duong_kinh,
     y = df$the_tich,
     type = "l",
     col = "purple",
     xlim = c(0, 30),
     ylim = c(0, 100),
     las = 1,
     xaxs = "i",
     yaxs = "i",
     xlab = "Đường kính (inch)",
     ylab = expression("Thể tích"~"("*ft^3*")"),
     lwd = 3,
     lty = 1
)

par(lheight = 1)

title(main = "Tương quan giữa đường kính và thể tích\ncủa cây black cherry",
      cex.main = 1.5,
      col.main = "black",
      line = 1)

points(x = df$duong_kinh,
       y = df$the_tich,
       type = "h",
       col = adjustcolor("blue", alpha.f = 0.5),
       bg = "yellow",
       pch = 21,
       cex = 2,
       lwd = 2)

segments(x0 = 0,
         y0 = df$the_tich,
         x1 = df$duong_kinh,
         y1 = df$the_tich,
         col = adjustcolor("blue", alpha.f = 0.5),
         cex = 2,
         lwd = 2)

points(x = df$duong_kinh,
       y = df$the_tich,
       type = "p",
       col = "blue",
       bg = "yellow",
       pch = 21,
       cex = 2,
       lwd = 2)



# box(which = "plot", lty = 1, col = "blue", lwd = 1)
box(which = "figure", lty = 1, col = "blue", lwd = 4)

box(which = "outer", lty = 1, col = "red", lwd = 4)

# abline(h = 30, col = "purple", lwd = 5, xpd = FALSE)
# 
# abline(h = 50, col = "purple", lwd = 5, xpd = TRUE)
# 
# abline(h = 70, col = "purple", lwd = 5, xpd = NA)

par(oldpar)














