data()

trees

?trees

trees -> df

df

names(df) <- c("duong_kinh", "chieu_cao", "the_tich")

df
# ?quartz

#####################

windows(width = 8, height = 8, rescale = "fixed")

oldpar <- par(no.readonly = TRUE)

par(mar = c(5, 5, 5, 5))
par(pty = "s")
par(lheight = 1)

plot(x = df$duong_kinh,
     y = df$the_tich,
     type = "n",
     col = "red",
     pch = 19,
     cex = 2,
     xlim = c(0, 30),
     ylim = c(0, 100),
     las = 1,
     xaxs = "i",
     yaxs = "i",
     xlab = "Đường kính\n(inch)",
     # ylab = "Thể tích (cubic feet)",
     # ylab = "Thể tích (ft^3)"
     # ylab = bquote("Thể tích"~"("*ft^3*")")
     ylab = expression("Thể tích"~"("*ft^3*")"),
     lwd = 3,
     lty = 1
     )

par(lheight = 2)

title(main = "Tương quan giữa đường kính và thể tích\ncủa cây black cherry",
      cex.main = 1,
      col.main = "red")

par("lheight" = oldpar$lheight)

lines(x = df$duong_kinh,
       y = df$the_tich,
       type = "l",
       col = "blue",
       pch = 17,
       cex = 2,
       lwd = 4,
       lty = 1)

points(x = df$duong_kinh,
       y = df$the_tich,
       type = "p",
       col = "red",
       pch = 17,
       cex = 2,
       lwd = 4,
       lty = 1)

par(oldpar)

# https://stackoverflow.com/questions/56750911/difference-between-points-and-lines

# https://stackoverflow.com/questions/19226816/how-can-i-view-the-source-code-for-a-function






