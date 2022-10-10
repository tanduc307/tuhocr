"convert"
"coerce"
"coercion"
a <- c(1, 2, 3, NA)
class(a)
b <- c(1, 2, 3, NA, "bbb")
class(b)
c <- c(1, 2, 3, TRUE, FALSE)
class(c)
d <- c(T, T, F, F)
class(d)
e <- c(1, 2, 3, TRUE, FALSE, "bbb")
class(e)

as.character(a) -> a_1
a_1
class(a_1)

a_1[4]
class(a_1[4])
a[4]
class(a[4])

f <- c(NA, NA, NA)
class(f)
as.numeric(f) -> f_1
class(f_1)
f_1
as.character(f) -> f_2
class(f_2)
f_2
f_3 <- c(NA, NA, "NA")
f_3
class(f_3)
############################

dulieu <- read.table("dulieu.txt", header = TRUE)
dulieu
class(dulieu)
as.matrix(dulieu) -> dulieu_1

dulieu_1

as.data.frame(dulieu_1) -> dulieu_2
dulieu_2
dulieu
identical(dulieu, dulieu_2)
class(dulieu)
class(dulieu_2)
mode(dulieu)
mode(dulieu_2)
typeof(dulieu)
typeof(dulieu_2)
storage.mode(dulieu)
storage.mode(dulieu_2)
dulieu == dulieu_2

sapply(dulieu, class)
sapply(dulieu_2, class)
dulieu_2$weight <- as.numeric(dulieu_2$weight)
identical(dulieu, dulieu_2)

#########################################

ketqua <- read.table("ketqua.txt", header = TRUE)
ketqua
class(ketqua)
mode(ketqua)
as.matrix(ketqua) -> ketqua_1
ketqua_1
mode(ketqua_1)
as.data.frame(ketqua_1) -> ketqua_2
ketqua_2
identical(ketqua, ketqua_2)
sapply(ketqua, class)
sapply(ketqua_2, class)

ketqua$group <- as.numeric(ketqua$group)
identical(ketqua, ketqua_2)
