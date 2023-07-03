####### TÌM THÔNG SỐ LEGEND

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

leg1 <- legend(x = 5,
       y = 5,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"),
       plot = FALSE)

legend(x = leg1$rect$left,
       y = leg1$rect$top,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"),
       plot = TRUE)

legend(x = "center",
       # y = leg1$rect$top,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"),
       plot = TRUE)

legend(x = "bottom",
       # y = leg1$rect$top,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"),
       plot = TRUE)

leg2 <- legend(x = "bottom",
       # y = leg1$rect$top,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"),
       plot = FALSE)

legend(x = leg2$rect$left,
       y = leg2$rect$top,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"),
       plot = TRUE)

par(oldpar)





















