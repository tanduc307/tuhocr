####### TÌM THÔNG SỐ LEGEND

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

legend(x = "center",
       # y = 5,
       legend = c("aaa", "bbb"),
       fill = c("red", "green"))

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

#####################################

####### TÌM THÔNG SỐ MARGIN CHO TEXT

x <- 0:10
y <- 0:10

oldpar <- par(no.readonly = TRUE)

par(xpd = TRUE)

plot(y ~ x, xlim = c(0, 10), ylim = c(0, 10), xaxs = "i", yaxs = "i", pch = 19, col = "blue", cex = 1.5)

text(x = 5, 
     y = 5, 
     labels = "triệu tấn",
     col = "darkgreen")

abline(h = 5, lty = 2, col = "red")
abline(v = 5, lty = 2, col = "red")

t_1 <- 0.5 # percent in plot
t_2 <- 0.5 # percent in plot

text(x = grconvertX(t_1, from = "ndc", to = "user"), 
     y = grconvertY(t_2, from = "ndc", to = "user"),
     labels = "triệu tấn", 
     col = "red")

text(x = grconvertX(t_1, from = "user", to = "user"), 
     y = grconvertY(t_2, from = "user", to = "user"),
     labels = "triệu tấn", 
     col = "purple")

text(x = grconvertX(t_1, from = "inches", to = "user"), 
     y = grconvertY(t_2, from = "inches", to = "user"),
     labels = "triệu tấn", 
     col = "cyan")

text(x = grconvertX(t_1, from = "device", to = "user"), 
     y = grconvertY(t_2, from = "device", to = "user"),
     labels = "triệu tấn", 
     col = "black")

text(x = grconvertX(t_1, from = "nfc", to = "user"), 
     y = grconvertY(t_2, from = "nfc", to = "user"),
     labels = "triệu tấn", 
     col = "black")

text(x = grconvertX(t_1, from = "npc", to = "user"), 
     y = grconvertY(t_2, from = "npc", to = "user"),
     labels = "triệu tấn", 
     col = "red")

text(x = grconvertX(t_1, from = "nic", to = "user"), 
     y = grconvertY(t_2, from = "nic", to = "user"),
     labels = "triệu tấn", 
     col = "blue")

text(x = grconvertX(t_1, from = "nic", to = "user"), 
     y = grconvertY(t_2, from = "nic", to = "user"),
     labels = "triệu tấn", 
     col = "blue")

text(x = grconvertX(t_1, from = "lines", to = "user"), 
     y = grconvertY(t_2, from = "lines", to = "user"),
     labels = "triệu tấn", 
     col = "darkgreen")

text(x = grconvertX(t_1, from = "chars", to = "user"), 
     y = grconvertY(t_2, from = "chars", to = "user"),
     labels = "triệu tấn", 
     col = "blue")

par(oldpar)

par("usr")

#################################################################

x <- 0:10
y <- 0:10

oldpar <- par(no.readonly = TRUE)

par(xpd = TRUE)

plot(y ~ x, xlim = c(0, 10), ylim = c(0, 10), xaxs = "i", yaxs = "i", pch = 19, col = "blue", cex = 1.5)

text(x = 8, 
     y = 4, 
     labels = "triệu tấn",
     col = "darkgreen")

abline(h = 4, lty = 2, col = "red")
abline(v = 8, lty = 2, col = "red")

t_1 <- 0.5 # percent in plot
t_2 <- 0.5 # percent in plot

text(x = grconvertX(t_1, from = "npc", to = "user"), 
     y = grconvertY(t_2, from = "npc", to = "user"),
     labels = "triệu tấn", 
     col = "red")

text(x = grconvertX(grconvertX(8, from = "user", to = "npc"), from = "npc", to = "user"), 
     y = grconvertX(grconvertX(4, from = "user", to = "npc"), from = "npc", to = "user"),
     labels = "triệu tấn", 
     col = "purple")

par(oldpar)

grconvertX(0.8, from = "user", to = "npc")

# graphic device
dev.size(units = "px")
dev.size(units = "cm")
dev.size(units = "in")
par("din") # read-only # units = "in"

# plot region
par("usr") #xy-value # fixed
par("pin") # read-only # units = "in"
par("plt") # percent

# plot margin
par("mai") # units = "in" # fixed
par("mar") # units = "lines" # fixed





