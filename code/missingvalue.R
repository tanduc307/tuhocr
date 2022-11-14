# missing value là gì

# logic xử lý missing value == cleaning data == flat file

### CÁC LỆNH EXPLORING NA

### CÁC LỆNH REMOVING NA

### CÁC LỆNH THAY THẾ NA == IMPUTATION

####################

### CÁC LỆNH EXPLORING NA   

a <- c("aaa", "bbb", NA, "ccc")
a
is.na(a)

airquality
is.na(airquality)
colSums(is.na(airquality)) 

summary(airquality)

b <- c(1, 2, 4, 6)
b
sum(b)

b_1 <- c(1, 2, 4, 6, NA, NA, 3) 
sum(b_1)
is.na(b_1)
sum(is.na(b_1))

sum(airquality$Temp)

sum(is.na(airquality))

####################

b <- c(1, 2, 4, 6)
b
is.na(b)
any(is.na(b)) # Are Some Values True?

b_1 <- c(1, 2, 4, 6, NA, NA, 3)
is.na(b_1)
any(is.na(b_1)) # CÓ ÍT NHẤT 1 GIÁ TRỊ NA TRONG VECTOR KO?

### CÓ ÍT NHẤT 1 GIÁ TRỊ NA TRONG NÀY KO? Đây là cơ sở để xem xét kỹ hơn dataset.

any(is.na(airquality))
any(is.na(mtcars))

#######################

### CÁC LỆNH REMOVING NA

a <- c("aaa", "bbb", NA, "ccc")

na.omit(a) -> a_1

a_1
attributes(a_1)
attributes(a_1) <- NULL
a_1

###############

mt <- matrix(c(1:8, NA), 3, 3)
mt
na.omit(mt) -> mt_1

mt_1

class(mt_1)
attributes(mt_1)
attributes(mt_1) <- NULL
mt_1

attr(mt_1, "na.action") <- NULL
mt_1

###############

airquality
dim(airquality)

## BỎ HẾT CÁC DÒNG HỄ CÓ CHỮ NA
na.omit(airquality) -> airquality_1
dim(airquality_1)

summary(airquality)

colSums(is.na(airquality))

153 - 111 = 42

37 + 7 = 44

# Bài tập: có hai dòng ở 2 cột trùng nhau NAs. Tìm ra 2 dòng đó.

airquality$Ozone

airquality$Solar.R

# tìm vị trí index của các số NAs

# cách 1 dùng order()

order(airquality$Ozone, na.last = FALSE)[1:37] -> e_1

order(airquality$Solar.R, na.last = FALSE)[1:7] -> e_2

e_1
e_2

# cách 2 dùng which()

which(is.na(airquality$Ozone))
which(is.na(airquality$Solar.R))

# so sánh giữa các vị trí index có NA trùng sau

# cách 1 dùng match
match(e_1, e_2)
match(e_2, e_1)

# cách 2 dùng intersect
intersect(e_1, e_2)
intersect(e_2, e_1)

# cách 3 dùng %in%
e_1 %in% e_2
e_2 %in% e_1

# subset ra những dòng trùng NA với nhau
e_1[e_1 %in% e_2]

airquality[c(5, 27), ]

##########################

order(a, na.last = FALSE)

######################

### BỎ HẾT CÁC DÒNG HỄ CÓ CHỮ NA

a
complete.cases(a) # FALSE LÀ CÓ NA

a[complete.cases(a)]

airquality

complete.cases(airquality)
table(complete.cases(airquality))

airquality[complete.cases(airquality), ] -> airquality_2

dim(airquality_2)

na.omit(airquality) -> airquality_1

dim(airquality_1)
identical(airquality_1, airquality_2)

airquality_1 == airquality_2

attributes(airquality_1)

attributes(airquality_2)

attr(airquality_1, "na.action")

class(attr(airquality_1, "na.action")) 

unclass(attr(airquality_1, "na.action"))

length(unclass(attr(airquality_1, "na.action")))

names(unclass(attr(airquality_1, "na.action")))

attr(airquality_1, "na.action") <- NULL
#########################

# CHỈ BỎ CÁC DÒNG CÓ NA TRONG CỘT OZONE

airquality$Ozone

complete.cases(airquality$Ozone)

airquality[complete.cases(airquality$Ozone), ]

dim(airquality[complete.cases(airquality$Ozone), ])

#######################

d <- c(1:8, NA, NA, 12)
d
mean(d)
mean(d, na.rm = FALSE)
mean(d, na.rm = TRUE)

is.na(d)
mean(d[!is.na(d)])

#######################

d_1 <- c(1:8, NA, NA, 12, NA, NA, 16)
d_1[is.na(d_1)]

d_1[is.na(d_1)] <- 0
d_1

#####################

### BÀI TẬP

a_1 <- c(1:4, NA, NA, 6, 7, NA, 9:11, NA, NA)
a_1

a_2 <- c(NA, NA, 1:6, NA, NA, 4:5, NA, NA)
a_2

a_3 <- c(NA, 1:7, NA, 1:4, NA)
a_3

df1 <- data.frame(a_1, a_2, a_3)
df1
class(df1)

#########################

# 1/ remove NA toàn bộ

# 2/ chỉ remove NA ở cột 1 

# 3/ chỉ remove NA ở cột 1 và 3

#######
a_4 <- (3:16)
length(a_4)
cbind(df1, a_4) -> df2
df2

# 4/ tìm ra các dòng trùng nhau trong a_1, a_2 và a_3

############################

# SOLUTION


# 1/ remove NA toàn bộ

df1[complete.cases(df1), ] -> df1a
df1a

na.omit(df1) -> df1b
df1b

# 2/ chỉ remove NA ở cột 1 

# cách 1:
df1[complete.cases(df1$a_1), ]

# cách 2:
na.omit(df1$a_1)

attr(na.omit(df1$a_1), "na.action")

unclass(attr(na.omit(df1$a_1), "na.action"))

as.numeric(rownames(df1))

1:nrow(df1)

as.numeric(rownames(df1))[-unclass(attr(na.omit(df1$a_1), "na.action"))]

df1[as.numeric(rownames(df1))[-unclass(attr(na.omit(df1$a_1), "na.action"))], ]

# 3/ chỉ remove NA ở cột 1 và 3
# cách 1: 
df1[complete.cases(df1$a_1), ] -> df1e
df1e
df1e[complete.cases(df1e$a_3), ] -> df1f
df1f

# cách 2:

complete.cases(df1$a_1)
complete.cases(df1$a_3)

complete.cases(df1$a_1) & complete.cases(df1$a_3)

df1[complete.cases(df1$a_1) & complete.cases(df1$a_3), ] -> df1g
df1g

identical(df1f, df1g)

#######
a_4 <- (3:16)
length(a_4)
cbind(df1, a_4) -> df2
df2

# 4/ tìm ra các dòng trùng nhau trong a_1, a_2 và a_3

which(is.na(df2))

which(is.na(df2$a_1)) -> ok_1
which(is.na(df2$a_2)) -> ok_2
which(is.na(df2$a_3)) -> ok_3

#  intersect for multiple vectors in R

intersect(intersect(ok_1, ok_2), ok_3)
Reduce(intersect, list(ok_1, ok_2, ok_3))

#################

## CÂU HỎI TRONG FILE EXCEL BAN ĐẦU CÓ NHỮNG KÝ HIỆU ?, TRỐNG, ĐỂ CHUYỂN HẾT VỀ NA CẦN SET THAM SỐ na.strings = ... để R nhận biết mà chuyển về.


### CASE 1: File excel, package readxl

# By default, blank cell is treated as missing value (NA)
# https://readxl.tidyverse.org/reference/read_excel.html

ghichu <- c("không rõ", ".", "", 0)
ghichu
readxl::read_excel(file.choose(), na = ghichu)

### CASE 2: File txt

ghichu <- c("", "NA")

read.delim(file.choose(), na.strings = ghichu)
