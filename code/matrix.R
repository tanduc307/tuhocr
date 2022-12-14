# Cách tạo ma trận

mt_1 <- matrix(1:12, ncol = 4, nrow = 3)
mt_1

mt_1 <- matrix(1:12, ncol = 4)
mt_1

mt_1 <- matrix(1:12, 4, 3)
mt_1

mt_2 <- matrix(1:12, ncol = 4, nrow = 5)
mt_2

mt_3 <- matrix(1:12, ncol = 4, nrow = 1)
mt_3

# byrow = FALSE ==> đánh số theo column-wise
# byrow = TRUE ==> đánh số theo row-wise

mt_4 <- matrix(1:12, ncol = 4, byrow = TRUE)
mt_4

str(mt_1)
str(mt_4) 


a <- 1:12
dim(a)
dim(mt_1)

length(mt_1)

attributes(mt_1) -> ok1
class(ok1)
attr(mt_1, "dim")

attr(mt_1, "dim") <- c(2, 6)
mt_1

#############################

# CÁC LỆNH PHÂN TÍCH CẤU TRÚC MATRIX
mt_1 <- matrix(1:12, ncol = 4, nrow = 3)
mt_1
class(mt_1)
dim(mt_1)
mode(mt_1)
typeof(mt_1)
length(mt_1)
seq_along(mt_1)
nrow(mt_1)
row(mt_1)
ncol(mt_1)
col(mt_1)
str(mt_1)
attributes(mt_1)
diag(mt_1) ## ĐƯỜNG CHÉO TRONG MA TRẬN
# Lệnh transpose và tính định thức được nói ở bài về các phép tính trên ma trận

###########################

## THAY ĐỔI TÊN TRONG MA TRẬN
mt_1 <- matrix(1:12, ncol = 4, nrow = 3)
mt_1 
mt_1_names <- list(rrr = c("a", "b", "c"), ccc = c("e", "f", "g", "h"))
dimnames(mt_1) <- mt_1_names
mt_1 
rownames(mt_1) <- c("aa", "bb", "c")
mt_1
colnames(mt_1) <- c("e", "fff", "ggg", "h")
mt_1
attributes(mt_1)
attr(mt_1, "dimnames")

str(mt_1)

###################

# combining vector to matrix

a <- c(1:15)
a
b <- c(31:45)
b
cbind(a, b) -> c
c
class(c)

cbind(a, a, c, a) -> d
d

colnames(d) <- c("a1", "a2", "a3", "a4", "a5")
d

thay_doi_cot <- c("a1", "a4", "a2", "a3", "a5")
d[ , thay_doi_cot]

a <- c(1:15)
e <- c(16:30)
rbind(a, e, a)






####################################

# SUBSET MA TRẬN

mt_1 <- matrix(-2:17, nrow = 4)
mt_1


# SUBSET THEO TRỰC TIẾP VỊ TRÍ INDEX
mt_1[4]
mt_1[4:6]

mt_1[[4]]
mt_1[[4:6]] # không áp dụng cho dãy số
mt_1$3 # không áp dụng dấu '$' cho matrix

# SUBSET THEO TRỰC TIẾP VỊ TRÍ hàng i, cột j

# By default, R always tries to simplify the objects to the smallest number of dimensions possible.

mt_1

mt_1[3, 4] # theo kiểu hàng i, cột j

mt_1[3, 4, drop = FALSE] 

mt_1[3:4, 4] 
mt_1[3:4, 4:5]
mt_1[3:4, 4:1]

mt_1[c(3, 2), 4]
mt_1[c(3, 1), 4]
mt_1[c(3, -2), 4]

# LOẠI GIÁ TRỊ TRONG MATRIX
mt_1[4]
mt_1[-4]
mt_1[-3, -4] # theo kiểu loại hàng 3 và cột 4

# SUBSET THEO CẢ HÀNG HAY CỘT
mt_1[3:4, ]
mt_1[4, ]
mt_1[ ,4]

mt_1[-4, ]
mt_1[-5, ]
mt_1[0, ]
mt_1[ , ]
mt_1[, 0]

mt_1[-c(1, 3), ]
mt_1[c(-1, -3), ]
mt_1[c(0, -3), ]

## SUBSET THEO GIÁ TRỊ LOGIC

mt_1 <- matrix(-2:17, nrow = 4)
mt_1
mt_1[mt_1 > 3]
mt_1[mt_1 == 3]
mt_1[mt_1 != 3]

logic <- c(T, T, F, T, F)
mt_1[logic]

a <- c(F, F, F, F, F)
b <- c(F, T, F, F, T)
c <- c(F, F, F, F, F)
d <- c(F, F, F, T, F)

sub_1 <- rbind(a, b, c, d)
sub_1
class(sub_1)

mt_1[sub_1]
mt_1[!sub_1] <- 0
mt_1

## subset theo tên

mt_5 <- matrix(-4:15, 4, 5)
mt_5

colnames(mt_5) <- c("a1", "a2", "a3", "a4", "a5")
mt_5

mt_5[, "a2"]
mt_5[, "a2", drop = FALSE]

mt_5[2, "a1"]

###################

## THAY ĐỔI GIÁ TRỊ TRONG MATRIX
mt_1 <- matrix(-2:17, nrow = 4)
mt_1
mt_1[3:4, 4] <- c(100, 104)
mt_1

mt_1[3:4, ] <- c(100, 104)
mt_1

mt_aaa <- matrix(c(72, 72, 72, 72), 2)
mt_aaa
mt_1[2:3, 3:4] <- mt_aaa
mt_1

# R reads and writes matrices column‐wise by default.


######### SUBSET THEO MA TRẬN
mt_1 <- matrix(-2:17, nrow = 4)
mt_1
mt_2 <- matrix(1:4, 2, 2)
mt_2
mt_1[mt_2]

mt_3 <- matrix(1:6, 2, 3)
mt_3
mt_1[mt_3]

# Subsetting a matrix with another matrix in R
# http://adv-r.had.co.nz/Subsetting.html


################### BÀI TẬP

# 1) GIỮ LẠI SỐ -2 VÀ 17 VÀ TẤT CẢ SỐ CÒN LẠI BẰNG 0
mt_1 <- matrix(-2:17, nrow = 4)
mt_1

#      [,1] [,2] [,3] [,4] [,5]
# [1,]   -2    0    0    0    0
# [2,]    0    0    0    0    0
# [3,]    0    0    0    0    0
# [4,]    0    0    0    0   17

# 2) TẠO MA TRẬN CON 
mt_1 <- matrix(-2:17, nrow = 4)
mt_1
#      [,1] [,2]
# [1,]    3   11
# [2,]    4   12

# 3) ĐẢO CHIỀU MA TRẬN

x <- matrix(11:19, 3, 3)
x
x[seq_along(x)]
rev(x)
t(x)

#      [,1] [,2] [,3]
# [1,]   17   14   11
# [2,]   18   15   12
# [3,]   19   16   13

# 4) GHÉP LẠI

a <- matrix(1:16, nrow = 4, ncol = 4)
a
diag(a)
diag(a) <- NA
a

#      [,1] [,2] [,3] [,4]
# [1,]    2    5    9   13
# [2,]    3    7   10   14
# [3,]    4    8   12   15

# 5) THAY ĐỔI THEO ĐƯỜNG CHÉO PRIMARY

matrix_data <- matrix(1:25, nrow = 5, ncol = 5)

matrix_data

# assign value to 100

#       [,1] [,2] [,3] [,4] [,5]
# [1,]  100    6   11   16   21
# [2,]    2  100   12   17   22
# [3,]    3    8  100   18   23
# [4,]    4    9   14  100   24
# [5,]    5   10   15   20  100

# dùng cách khác: diag(matrix_data) <- 100

# 6) THAY ĐỔI ĐƯỜNG CHÉO SECONDARY
y <- matrix(10:18, 3, 3)
y

#      [,1] [,2] [,3]
# [1,]   10   13   6
# [2,]   11   5   17
# [3,]   4   15   18

##################
# solution 1)
seq_along(mt_1)
mt_1[c(1, 20)]
mt_1[c(-1, -20)] <- 0
mt_1

# CÁCH TÌM VỊ TRÍ INDEX CỦA 1 CON SỐ BẤT KỲ
mt_1 <- matrix(-2:17, nrow = 4)
mt_1
seq_along(mt_1)
which(mt_1 == 11)
which(mt_1 == 11, arr.ind = TRUE)
?which



# solution 2)
mt_1 <- matrix(-2:17, nrow = 4)
mt_1[c(2, 3), c(2, 4)]

# solution 3)
x <- matrix(11:19, 3, 3)
x
x[, 3:1]
ncol(x):1
x[, ncol(x):1]

# solution 4)

a <- matrix(a[which(!is.na(a))], nrow = 3, ncol = 4)
a
a[which(!is.na(a))]
a[!is.na(a)]

# solution 5a)
matrix_data <- matrix(1:25, nrow = 5, ncol = 5)
matrix_data
matrix_data[row(matrix_data) == col(matrix_data)] <- 100
matrix_data
row(matrix_data)
col(matrix_data)
row(matrix_data) == col(matrix_data)

# solution 5b)
diag(matrix_data) <- 100
matrix_data

# solution 6)

# 1 SUBSET THEO diag() cách 1
y <- matrix(10:18, 3, 3)
y
y[, nrow(y):1]
diag(y[, nrow(y):1])
diag(y[, nrow(y):1]) <- c(6, 5, 4)
y

# 2 SUBSET THEO diag() cách 2
y <- matrix(10:18, 3, 3)
y

diag(y[1:3, 3:1])
diag(y[1:nrow(y), ncol(y):1]) <- c(6, 5, 4)
y

# 3 SUBSET THEO LOGICAL
y <- matrix(10:18, 3, 3)
y
# rev(y[row(y) + col(y) == nrow(y) + 1]) <- c(6, 5, 4) ## ko assign được giá trị

y[row(y) + col(y) == nrow(y) + 1] <- c(4, 5, 6)
y
row(y)
col(y)
row(y) + col(y)

nrow(y) + 1
row(y) + col(y) == nrow(y) + 1

# 4 SUBSET THEO VỊ TRÍ INDEX 
y <- matrix(10:18, 3, 3)
y

which(y == 16)

which(y == 14)

which(y == 12)


y[seq(to = nrow(y), by = 1 - nrow(y), length = nrow(y))] <- c(6, 5, 4)
y

########

y <- matrix(1:20, 4)
y
seq(to = nrow(y), by = 1 - nrow(y), length = nrow(y))
seq(to = nrow(y) + nrow(y), by = 1 - nrow(y), length = nrow(y))


# 5 chỉ trích xuất số liệu theo đường chéo secondary
y <- matrix(10:18, 3, 3)
y
as.data.frame(y)

rev(as.data.frame(y))

as.matrix(rev(as.data.frame(y)))
# as.matrix(rev(as.matrix(y)))

diag(as.matrix(rev(as.data.frame(y)))) 

# 6 SUBSET THEO MA TRẬN
y <- matrix(10:18, 3, 3)
y
y[cbind(1:nrow(y), ncol(y):1)] <- c(6, 5, 4)
cbind(1:nrow(y), ncol(y):1)
y

y <- matrix(1:20, 4)
y

cbind(1:nrow(y), nrow(y):1)
cbind(1:nrow(y), ncol(y):2)

y[cbind(1:nrow(y), nrow(y):1)] <- 1000
y
y[cbind(1:nrow(y), ncol(y):2)] <- 999
y

# https://stat.ethz.ch/pipermail/r-help/2010-September/251766.html


######################

# ĐƯỜNG CHÉO TRONG MA TRẬN

# Primary diagonal == left == Major, Principal, leading, main
# Secondary diagonal == right == Minor, Counter, lagging, anti-

diag(1, 3, 3)
diag(1, 3, 4)
diag(1, 4, 3)

mt_1 <- matrix(1:16, nrow = 4)
mt_1

diag(mt_1)

lower.tri(mt_1, diag = TRUE) -> ok_1
ok_1


lower.tri(mt_1, diag = FALSE) -> ok_2
ok_2

mt_1[ok_1]
mt_1[!ok_1] <- 0
mt_1

mt_1[ok_2]
mt_1[!ok_2] <- 0
mt_1

upper.tri(mt_1, diag = TRUE) -> ok_3
ok_3

upper.tri(mt_1, diag = FALSE) -> ok_4
ok_4

#######################

# CÁC PHÉP TÍNH TRÊN MA TRẬN
mt_1 <- matrix(1:16, nrow = 4)
mt_1

mt_1 + 3

##########################

mt_1 <- matrix(1:16, nrow = 4)
mt_1
mt_4 <- matrix(1:9, nrow = 3)
mt_4

mt_1 + mt_4
mt_1 * mt_4

dim(mt_1)
dim(mt_4)
identical(dim(mt_1), dim(mt_4))

##############################

mt_2 <- matrix(12:27, nrow = 4)
mt_2
identical(dim(mt_1), dim(mt_2))
mt_1 + mt_2
mt_1 - mt_2

mt_1 * mt_2
mt_1 %*% mt_2
?'%*%'
1*12 + 5*13 + 9*14 + 13*15
mt_1 / mt_2
mt_1[seq_along(mt_1)] * 16

##################################

mt_1 <- matrix(1:16, nrow = 4)
mt_1
mt_1 + 9:12
mt_1

mt_1 + 9:11
mt_1

mt_1 * 9:11
mt_1

mt_1 * 9:12
mt_1

mt_1 %*% 9:11

mt_1 %*% 9:12
1*9 + 5*10 + 9*11 + 13*12

mt_5 <- matrix(9:12, 4)
mt_5

mt_1 * mt_5
mt_1 %*% mt_5
mt_5 %*% mt_1

mt_6 <- matrix(9:12, 1, 4)
mt_6

mt_6 %*% mt_1
mt_1 %*% mt_6

1*9 + 2*10 + 3*11 + 4*12


#################################
# Chuyển vị ma trận Transpose

mt_1 <- matrix(1:16, nrow = 4)
mt_1

t(mt_1)

1:10

t(1:10)
t(t(1:10))

mt_1[, 2]
mt_1[, 2, drop = FALSE]
t(mt_1[, 2])

################################

# tính định thức ở ma trận vuông

mt <- matrix(1:4, 2, 2)
mt
det(mt)
1*4 - 3*2

mt_1 <- matrix(1:16, nrow = 4)
mt_1
det(mt_1)

mt_3 <- matrix(c(3, 2, 1, 3:7, 5, 3, -1:4), nrow = 4)
mt_3
det(mt_3)


# https://matrixcalc.org/vi/

# Invert matrix

square.matrix <- matrix(c(1, 0, 3, 2, 2, 4, 3, 2, 1), ncol = 3)
square.matrix

solve(square.matrix)

det(square.matrix)

t(square.matrix)

adjoint(square.matrix)

(1/det(square.matrix)) * adjoint(square.matrix)

?solve

square.matrix^(-1)
# install.packages("RConics")
library("RConics")
adjoint(square.matrix)

square.matrix %*% b

# Định thức ma trận / Determinant of matrix
# Ma trận khả nghịch / invertible matrix
# Ma trận phụ hợp / adjunct matrix
# Ma trận chuyển vị / transposing matrix


# https://youtu.be/jBZCUfGGRRw
# https://sami.hust.edu.vn/wp-content/uploads/03-Ma-tran-nghich-dao1.pdf

