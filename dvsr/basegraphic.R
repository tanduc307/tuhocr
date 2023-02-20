# BÀI 1: LỊCH SỬ PHÁT TRIỂN GRAPHIC TRONG R ####

# Link download file code
# https://github.com/tanduc307/tuhocr/tree/main/dvsr

###########################################################

# BÀI 2: NGUYÊN TẮC VẼ ĐỒ THỊ TRONG R (PHẦN 1) ####

# Vẽ đồ thị trong Excel
?mtcars
write.csv(mtcars, "mtcars_test.csv")

###########################################################

# BÀI 3: NGUYÊN TẮC VẼ ĐỒ THỊ TRONG R (PHẦN 2) ####

plot(mpg ~ wt, data = mtcars)

?mtcars
write.csv(mtcars, "mtcars_test.csv")# linear regression (fitting, smooth)
# https://vi.wikipedia.org/wiki/H%E1%BB%93i_quy_tuy%E1%BA%BFn_t%C3%ADnh
# https://www.spiceworks.com/tech/artificial-intelligence/articles/what-is-linear-regression/
# cách 1:
# R formula
plot(mpg ~ wt, data = mtcars, pch = 19, col = 4, 
     ylim = c(5, 35), xlim = c(1, 6), main = "Trend line") # pch == point character; col == color
fit_lm <- lm(mpg ~ wt, data = mtcars) # lm == Fitting Linear Models
abline(fit_lm, col = 2, lwd = 2) # lwd == line width 
# abline == add straight line / absolute line

class(fit_lm)
summary(fit_lm)
attributes(fit_lm)
str(fit_lm)
unclass(fit_lm)

# cách 2:
plot(mpg ~ wt, data = mtcars, pch = 19, col = 4, 
     ylim = c(5, 35), xlim = c(1, 6), main = "Trend line")
abline(lm(mpg ~ wt, data = mtcars), col = 3, lwd = 2)
### Correlation Coefficient | Hệ số tương quan
coef_lm <- coef(lm(mpg ~ wt, data = mtcars))
coef_lm 
round(coef_lm, 4) -> ok
ok
class(ok)
###
fit_lm <- lm(mpg ~ wt, data = mtcars)
summary(fit_lm)
# https://www.statology.org/multiple-r-vs-r-squared/

unclass(summary(fit_lm))
unclass(summary(fit_lm))$r.squared
round(unclass(summary(fit_lm))$r.squared, 4) -> r_ok
r_ok

text(x = 4, y = max(mtcars$mpg),  paste("Y = ", fit_lm$coefficients[1], "+", fit_lm$coefficients[2], "X"),
     cex = 1.5)

text(x = 4, y = max(mtcars$mpg),  paste("Y = ", fit_lm$coefficients[1], "+", fit_lm$coefficients[2], "X"),
     cex = 1.5)


text(x = 4, y = max(mtcars$mpg)-2,  
     bquote(atop(Y == ~ .(ok[1]) + (.(ok[2])) * X, R^2 == .(r_ok))),
     cex = 1.5)

text(x = 4, y = max(mtcars$mpg)-4,  
     bquote(atop(Y == ~ .(round(fit_lm$coefficients[1], 4)) + (.(round(fit_lm$coefficients[2], 4))) * "\u00D7" * X, R^2 == .(round(unclass(summary(fit_lm))$r.squared, 4)))),
     cex = 1.5)

text(x = 4, y = max(mtcars$mpg)-2,  
     bquote(atop(Y == ~ .(ok[1]) + (.(ok[2])) * "\u00D7" * X, R^2 == .(r_ok))),
     cex = 1.5)

# dấu nhân == multiply sign ×

# https://www.r-bloggers.com/2018/03/math-notation-for-r-plot-titles-expression-and-bquote/
# https://stackoverflow.com/questions/4973898/combining-paste-and-expression-functions-in-plot-labels

# https://rpubs.com/aaronsc32/
# https://rpubs.com/aaronsc32/regression-confidence-prediction-intervals

###########################################################

# BÀI 4: SO SÁNH 2 ĐỒ THỊ ####

fit_lm <- lm(mpg ~ wt, data = mtcars)
plot(mpg ~ wt, data = mtcars, pch = 19, col = 4)
abline(fit_lm, col = 2, lwd = 2)

text(x = 4, y = max(mtcars$mpg)-4,  
     bquote(atop(Y == ~ .(round(fit_lm$coefficients[1], 4)) + (.(round(fit_lm$coefficients[2], 4))) * "\u00D7" * X, R^2 == .(round(unclass(summary(fit_lm))$r.squared, 4)))),
     cex = 1.5)


plot(mpg ~ wt, data = mtcars, pch = 19, col = 4, 
     ylim = c(0, 40), xlim = c(0, 10))
abline(fit_lm, col = 2, lwd = 2)
text(x = 6, y = max(mtcars$mpg)-4,  
     bquote(atop(Y == ~ .(round(fit_lm$coefficients[1], 4)) + (.(round(fit_lm$coefficients[2], 4))) * "\u00D7" * X, R^2 == .(round(unclass(summary(fit_lm))$r.squared, 4)))),
     cex = 1.5)

###########################################################

# BÀI 5: NGUYÊN TẮC VẼ ĐỒ THỊ TRONG R (PHẦN 3) ####

# base R graphics == base plot == standard plot

# base-R graphics == R base graphics

# graphic, graphics, statistical graph, chart, plot

# Phân biệt thuật ngữ kỹ lưỡng
# Wilkinson, L. (2005). The Grammar of Graphics (2nd ed.)

# standard chart
# other chart ~ advanced chart

###########################################################

# BÀI 6: DATA VISUALIZATION LÀ GÌ? ####

# https://www.tuhocr.com/faqs/dataviz

###########################################################

# BÀI 7: PHÂN TÍCH LỆNH PLOT ####

plot(1, pch = 19, col = 2) # vector 1 thành phần

plot(1:20, pch = 19, col = 2) # vector 1 dãy số

z <- rnorm(n = 20, mean = 0, sd = 1)
z
plot(z, pch = 19, col = 2)

plot(1:10, 30:21, pch = 19, col = 2) # vector x, vector y

ok <- data.frame(aaa = c(2, 3, 4, 6, 7, -1, 10, 0), bbb = c(-1, -4, 2, 5, 10, 0, 1, -2))
ok

plot(ok, pch = 19, col = 2)
plot(ok$aaa, ok$bbb, pch = 19, col = 2)
plot(ok$bbb, ok$aaa, pch = 19, col = 2)
plot(x = ok$bbb, y = 1:8, pch = 19, col = 2)

plot(aaa ~ bbb, ok, pch = 19, col = 2) # y ~ x, data = ok
plot(bbb ~ aaa, ok, pch = 19, col = 2)
plot(ok$aaa ~ ok$bbb, data = ok, pch = 19, col = 2)

ok$eee <- 1:8
ok
plot(ok, pch = 19, col = 2)



























