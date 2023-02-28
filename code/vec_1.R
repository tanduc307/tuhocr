a <- c(7, 3, 4, 6, 14, 13)
b <- c(3, 7, 5, 2, 10, 11)

a + b

a - b

a*b

a/b

a^b

a %% b # a mod b

7 %% 3 # Lấy phần dư sau phép chia

a %/% b 

7 %/% 3 # Lấy kết quả phép chia (số nguyên)

#########

x <- c(1.12, -0.2, -1, 11)

abs(x)

exp(x)

exp(1) # số e ~ 2.71828

pi # số pi ~ 3.14159

log(x)

log(x, base = exp(1))

log(x, base = 10)

sqrt(x) # Tính căn bậc 2

# Để tính căn bậc cao hơn
install.packages("pracma")
pracma::nthroot(x, 3) # Căn bậc 3

1/0

0/0

Inf/Inf

Inf/0

NaN + 5

vec_1 <- c(2, NaN, 3)

vec_1 + 5

4 - NaN

is.finite(10^(304:312))

2 + 3

'+'(2, 3)

10*12

base::'*'(10, 12)

10^12

10**12

















