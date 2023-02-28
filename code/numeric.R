# numeric vector bao gồm:
# • double vector (real number)
# • integer vector

a <- c(1, 2, 3, 4, 5, 6)
typeof(a)
class(a)
mode(a)

b <- c(-1L, 2L, 0L, 3L, 5L, 8L)
typeof(b)
class(b)
mode(b)

a + b -> g
g
typeof(g)
class(g)
mode(g)

options(scipen = 999, digits = 22)
sprt(2)^2 - 2

sprt(2)^2 - 2 -> h
round(h, digits = 3)

# floating-point errors

##############