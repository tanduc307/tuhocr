x <- 0:10
y <- 0:10

oldpar <- par(no.readonly = TRUE)



plot(y ~ x, xlim = c(0, 10), ylim = c(0, 10), xaxs = "i", yaxs = "i", pch = 19, col = "blue", cex = 1.5)
abline(h = 5)
abline(v = 5)


legend(x = 5,
       y = 5,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"))

leg_1 <- legend(x = 5,
              y = 5,
              legend = c("aaa", "bbb"),
              fill = c("red", "green"),
              plot = FALSE)


legend(x = leg_1$rect$left,
       y = leg_1$rect$top,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"))

############

legend(x = "bottom",
       # y = 5,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"))




leg_2 <- legend(x = "bottom",
       # y = 5,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"),
       plot = FALSE)

legend(x = leg_2$rect$left,
       y = leg_2$rect$top,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"))

############

par(xpd = TRUE)

leg_3 <- legend(x = "bottom",
                # y = 5,
                inset = -0.15,
                legend = c("aaa", "bbb"),
                fill = c("red", "green"),
                plot = FALSE)

legend(x = leg_3$rect$left,
       y = leg_3$rect$top,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"))

par(oldpar)

















