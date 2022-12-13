# CÁC LỆNH TOÁN HỌC THƯỜNG DÙNG
# TRÊN NUMERIC VECTOR

## Cumulative Sums, Products, and Extremes

1:10
mean(1:10)
sum(1:10)
cumsum(1:10)


prod(1:10)
1*2*3*4*5*6*7*8*9*10
cumprod(1:10)
1*2
1*2*3
1*2*3*4
1*2*3*4*5
1*2*3*4*5*6
1*2*3*4*5*6*7


1/2/3/4/5/6/7/8/9/10

((((((((1/2)/3)/4)/5)/6)/7)/8)/9)/10

############
set.seed(111)       # Create random example vector
x <- round(rnorm(10, 10, 5))
x
min(x)
cummin(x)

# Basically: if you have a vector x, the i-th entry of the cumulative minimum is the minimum of x(1:i).

max(x)
cummax(x)

# As nouns the difference between maxima and maximum is that maxima is irregular plural of maximum while maximum is the highest limit.
# As an adjective maximum is to the highest degree.
# tương tự minimum và minima

###############

# Một số lệnh time series

# diff() function in R Language is used to find the difference between each consecutive pair of elements of a vector. Here, in the above code, the 'lag' tells the period between values, i.e. lag = 2 means, diff is calculated between 1st and 3rd value, 2nd and 4th values, etc.

set.seed(111)       # Create random example vector
x <- round(rnorm(10, 10, 5))
x
diff(x)
# diff(x, lag = 0)
diff(x, lag = 1) # khoảng cách trừ nhau là 1 số
# 8 - 11
# 8 - 8
# -2 - 8
# 9 - -2
# ...
# 8 - 5 

diff(x, lag = 2) # khoảng cách trừ nhau là 2 số

# diff(x, lag = 3)
# diff(x, lag = 4)
# diff(x, lag = 9)
# diff(x, lag = 10)
# diff(x, lag = 11)

# Here, in the above code, the ‘lag’ tells the period between values, i.e. lag = 2 means, diff is calculated between 1st and 3rd value, 2nd and 4th values, etc. and ‘differences’ tells the order in which diff() function is called i.e. differences = 2 means diff() function is called twice on the vector.

set.seed(111) 
x <- round(rnorm(10, 10, 5))
x
# diff(x, differences = 0)
diff(x, differences = 1)

diff(x, differences = 2)

diff(diff(x))

diff(x)
diff(x, lag = 1)
diff(x, differences = 1)
diff(x, differences = 1, lag = 1)


diff(x, differences = 2, lag = 3)
diff(diff(x, lag = 3))
diff(diff(x, lag = 3), lag = 1)
diff(diff(x, lag = 3), lag = 3)

# lag()
# time()
# frequency()
# cycle()
# deltat()

#################################

## MỘT SỐ LỆNH THỐNG KÊ

set.seed(111) 
x <- round(rnorm(10, 10, 5))
x

mean(x)
median(x)

sort(x)
summary(x)

sd(x) # độ lệch chuẩn

sd(x)^2

var(x) # phương sai

### TÍNH PHƯƠNG SAI THỦ CÔNG

var(x)

"%sum_of_square%" <- function(a, mean_a) {
    ok <- (a - mean_a)^2
    sum(ok)
}

x %sum_of_square% mean(x)/(length(x) - 1)

sqrt(x %sum_of_square% mean(x)/(length(x) - 1))
sd(x)

