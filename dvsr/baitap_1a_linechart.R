trees -> df
names(df) <- c("duong_kinh", "chieu_cao", "the_tich")
df

# windows(width = 8, height = 8, rescale = "fixed")

oldpar <- par(no.readonly = TRUE)

par(pty = "s")

# par(cex.axis = 1.5)
# par(font.axis = 2)
# 
# par(cex.lab = 1.5)
# par(col.lab = "red")

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
     lty = 1,
     cex.axis = 1.5,
     font.axis = 2,
     cex.lab = 1.5,
     col.lab = "red"
)

par(lheight = 1)

title(main = "Tương quan giữa đường kính và thể tích\ncủa cây black cherry",
      cex.main = 1.5,
      col.main = "darkgreen",
      line = 1)

points(x = df$duong_kinh,
       y = df$the_tich,
       type = "p",
       col = "blue",
       bg = "yellow",
       pch = 21,
       cex = 2,
       lwd = 2)

par(oldpar)
